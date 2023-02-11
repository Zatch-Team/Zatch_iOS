//
//  WantRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class ZatchRegisterSecondViewController: BaseViewController<LeftNavigationEtcButtonHeaderView,ZatchRegisterSecondView> {
    
    //MARK: - Properties
    
    private var categoryPriority = [Int?](repeating: nil, count: 3)
    private var isCategoryFieldOpen = [true, false, false]{
        didSet{
            mainView.tableView.reloadData()
        }
    }
    private var isKeyboardOpen = false

    //MARK: - LifeCycle
    
    init(){
        super.init(headerView: LeftNavigationEtcButtonHeaderView(title: "재치 등록하기", etcButton: Image.exit),
                   mainView: ZatchRegisterSecondView())
    }
    
    required init?(coder: NSCoder) {
        super.init(headerView: LeftNavigationEtcButtonHeaderView(title: "재치 등록하기", etcButton: Image.exit),
                   mainView: ZatchRegisterSecondView())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardNotifications()
    }
    
    override func initialize() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.separatorStyle = .none
        
        headerView.etcButton.addTarget(self, action: #selector(exitBtnDidClicked), for: .touchUpInside)
        mainView.shareBtn.addTarget(self, action: #selector(shareBtnDidClicked), for: .touchUpInside)
        mainView.nextBtn.addTarget(self, action: #selector(nextBtnDidClicked), for: .touchUpInside)
    }
    
    override func bind() {
        mainView.topRadioButtonFrame.rx.tapGesture()
            .when(.recognized)
            .bind(onNext: { [weak self] in
                self?.radioButtonDidSelected($0)
            }).disposed(by: disposeBag)
        
        mainView.belowRadioButtonFrame.rx.tapGesture()
            .when(.recognized)
            .bind(onNext: { [weak self] in
                self?.radioButtonDidSelected($0)
            }).disposed(by: disposeBag)
    }
    
    //MARK: - Action
    
    private func addKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillAppear(noti:)), name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillAppear(noti: NSNotification) {
        
        isKeyboardOpen = true

        /* TODO: - 세번째 카테고리 focus 갈 때만 높이 조절 시키기
        if let keyboardFrame: NSValue = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            UIView.animate(
                withDuration: 0.3
                , animations: {
                    self.view.transform = CGAffineTransform(translationX: 0, y: -60)
                }
            )
        }
         */
    }

    @objc private func keyboardWillDisappear() {
        isKeyboardOpen = false
        self.view.transform = .identity
    }
    
    @objc func radioButtonDidSelected(_ sender: UITapGestureRecognizer){
        
        guard let selectView = sender.view as? ZatchComponent.RadioButtonView,
              let willDeselectView = view.viewWithTag(ViewTag.select) as? ZatchComponent.RadioButtonView else { return }
        
        selectView.isSelected = true
        willDeselectView.isSelected = false
    }
    
    @objc func shareBtnDidClicked(){
        let vc = CheckShareRegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func nextBtnDidClicked(){
        let vc = CheckExchangeRegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func exitBtnDidClicked(){
        self.navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - TableView
extension ZatchRegisterSecondViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 || isCategoryFieldOpen[section] ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: RegisterCategorySelectWithPriorityTableViewCell.self).then{
                $0.setPriorityTitle(section: indexPath.section)
                $0.setCategoryTitle(id: categoryPriority[indexPath.section])
            }
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TextFieldTabeViewCell.self)
        getTextFieldCellType(section: indexPath.section){
            cell.informationType = $0
        }
        return cell
    }
    
    private func getTextFieldCellType(section: Int, closure: (TextFieldTabeViewCell.CellType) -> Void){
        switch section{
        case 0:     closure(.firstPriority); return
        case 1:     closure(.secondPriority); return
        case 2:     closure(.thirdPriority); return
        default:    return
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(isKeyboardOpen){
            self.view.endEditing(true)
            return
        }
        
        if(indexPath.row == 0){
            
            let sheet = CategorySheetViewController(service: .Zatch).show(in: self)
            sheet.completion = { categoryId in
                
                _ = tableView.cellForRow(at: indexPath, cellType: RegisterCategorySelectWithPriorityTableViewCell.self).then{
                    $0.setCategoryTitle(id: categoryId)
                }
                
                self.categoryPriority[indexPath.section] = categoryId
                self.isCategoryFieldOpen[indexPath.section] = true
                
                if(indexPath.section == 2){
                    self.mainView.tableView.scrollToRow(at: [2,1], at: .bottom, animated: true)
                }
            }
        }
    }
}

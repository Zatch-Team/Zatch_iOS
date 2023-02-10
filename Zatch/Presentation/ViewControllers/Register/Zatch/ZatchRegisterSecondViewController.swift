//
//  WantRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class ZatchRegisterSecondViewController: BaseViewController<LeftNavigationEtcButtonHeaderView,ZatchRegisterSecondView> {
    
    //MARK: - Properties
    
    private var categoryPriority : [Int?] = [nil, nil, nil]
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboardView()
    }
    
    @objc func radioButtonDidSelected(_ sender: UITapGestureRecognizer){
        
        guard let selectView = sender.view as? ZatchComponent.RadioButtonView,
              let willDeselectView = view.viewWithTag(Const.ViewTag.select) as? ZatchComponent.RadioButtonView else { return }
        
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
    
    //MARK: - Helper
    func dismissKeyboardView(){
        
        UIView.animate(withDuration: 0.3){
            self.view.window?.frame.origin.y = 0
        }
        
        isKeyboardOpen = false
        
        self.view.endEditing(true)

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
        }else{
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductNameTabeViewCell.self)
            cell.productNameTextField.delegate = self
            cell.productNameTextField.tag = indexPath.section
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //TODO: 키보드 제어...
        if(isKeyboardOpen){
            dismissKeyboardView()
            return
        }
        
        if(indexPath.row == 0){
            let sheet = CategorySheetViewController(service: .Zatch).show(in: self)
            sheet.completion = { categoryId in
                
                let cell = tableView.cellForRow(at: indexPath, cellType: RegisterCategorySelectWithPriorityTableViewCell.self).then{
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

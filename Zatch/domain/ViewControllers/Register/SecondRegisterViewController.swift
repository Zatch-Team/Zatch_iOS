//
//  WantRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class SecondRegisterViewController: BaseLeftTitleViewController {
    
    //MARK: - Properties
    
    var isFieldOpen = [true, false, false]
    var categoryChoose : [String?] = [nil, nil, nil]
    var isKeyboardOpen = false
    
    var currentBtnSelect: ZatchRoundCheck!
    
    let registerView = SecondRegisterView().then{
        $0.exitBtn.addTarget(self, action: #selector(exitBtnDidClicked), for: .touchUpInside)
        $0.topCheckBoxBtn.addTarget(self, action: #selector(radioBtnDidClicked(_:)), for: .touchUpInside)
        $0.belowCheckBoxBtn.addTarget(self, action: #selector(radioBtnDidClicked(_:)), for: .touchUpInside)
        $0.shareBtn.addTarget(self, action: #selector(shareBtnDidClicked), for: .touchUpInside)
        $0.nextBtn.addTarget(self, action: #selector(nextBtnDidClicked), for: .touchUpInside)
        
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Override
    override func style() {
        
        super.style()
        
        self.navigationTitle.text = "재치 등록하기"
        self.addRightTopBtn(image: Image.exit)
    
    }
    
    override func initialize() {
        currentBtnSelect = registerView.topCheckBoxBtn
        registerView.tableView.settingCustomTableView(self)
    }
    
    override func layout() {
        
        super.layout()
        
        self.view.addSubview(registerView)
        
        registerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.TOP_OFFSET)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    //MARK: - Action
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismissKeyboardView()
    }
    
    @objc func radioBtnDidClicked(_ sender: ZatchRoundCheck){
        if(sender != currentBtnSelect){
            sender.isSelected.toggle()
            currentBtnSelect.isSelected.toggle()
            currentBtnSelect = sender
        }
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
extension SecondRegisterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 || isFieldOpen[section] ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.row == 0){
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategorySelectWithRankTableViewCell.cellIdentifier)
                    as? CategorySelectWithRankTableViewCell else { fatalError() }
            
            cell.rankLabel.text = "\(indexPath.section + 1)순위"
            cell.categoryText.text = categoryChoose[indexPath.section] ?? "카테고리 선택"
        
            return cell
            
        }else{
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductNameTabeViewCell.cellIdentifier)
                    as? ProductNameTabeViewCell else { fatalError() }
            
            cell.productNameTextField.delegate = self
            cell.productNameTextField.tag = indexPath.section

            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(isKeyboardOpen){
            dismissKeyboardView()
        }else{
            if(indexPath.row == 0){
                let vc = CategoryBottomSheet(service: .Zatch)
                vc.categorySelectHandler = { category in
                    
                    guard let cell = tableView.cellForRow(at: indexPath) as? CategorySelectTableViewCell else{ return }
                    
                    self.categoryChoose[indexPath.section] = category
                    
                    if(!self.isFieldOpen[indexPath.section]){
                        self.isFieldOpen[indexPath.section] = true
                    }
                    
                    self.registerView.tableView.reloadData()
                    
                    if(indexPath.section == 2){
                        self.registerView.tableView.scrollToRow(at: [2,1], at: .bottom, animated: true)
                    }
                }
                
                vc.loadViewIfNeeded()
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
}

extension SecondRegisterViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if(textField.tag == 2){
            UIView.animate(withDuration: 0.3){
                self.view.window?.frame.origin.y -= 80
            }
        }
        
        self.isKeyboardOpen = true
    }
    
}

//
//  RegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class FirstRegisterViewController: BaseLeftTitleViewController {
    
    //MARK: - Properties
    
    struct ZatchFirstInput{ //상품 정보 유효성 검사 위한 데이터 저장 구조체(서버 통신용 Model 아님)
        var category: String = ""
        var productName: String = ""
        var images = [UIImage]()
        var buyDate: String = ""
        var endDate: String = ""
    }
    
    var isOpen = false
    
    var productInfo = ZatchFirstInput()
    
    let registerView = FirstRegisterView().then{
        $0.nextButton.addTarget(self, action: #selector(nextBtnDidClicked), for: .touchUpInside)
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Override
    
    override func style() {
        
        super.style()
        
        self.navigationTitle.text = "재치 등록하기"
    }
    
    override func layout() {
        
        super.layout()
        
        self.view.addSubview(registerView)
        
        registerView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(88)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    override func initialize(){
        registerView.backTableView.dataSource = self
        registerView.backTableView.delegate = self
        registerView.backTableView.separatorStyle = .none
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    //MARK: - Action
    
    @objc func nextBtnDidClicked(){
        
        //cell에서 등록한 이미지 데이터 가져오기
        guard let imageCell = registerView.backTableView.cellForRow(at: [0,2]) as? ImageAddTableViewCell else { return }
        productInfo.images = imageCell.imageArray
        
        let alert: Alert
        
        if(productInfo.category.isEmpty){
            alert = .RegisterCategory
        }else if(productInfo.productName.isEmpty){
            alert = .ProductName
        }else if(productInfo.images.count == 0){
            alert = .ImageMin
        }else if(productInfo.category == "음식|조리" && productInfo.buyDate.isEmpty){
            alert = .BuyDate
        }else if(productInfo.category == "음식|조리" && productInfo.endDate.isEmpty){
            alert = .EndDate
        }else{ //input 데이터 모두 유효할 경우, Second로 이동
            let vc  = SecondRegisterViewController()
            //TODO: Data 담아서 넘기기
            self.navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        _ = alert.generateAlert().show(in: self)
        
    }

}

extension FirstRegisterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 3
        }else{
            return isOpen ? 2 : 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CategorySelectTableViewCell.cellIdentifier, for: indexPath) as? CategorySelectTableViewCell else{ fatalError("Cell Casting Error")}
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductNameTabeViewCell.cellIdentifier, for: indexPath) as? ProductNameTabeViewCell else{ fatalError("Cell Casting Error")}
                cell.productNameTextField.delegate = self
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ImageAddTableViewCell.cellIdentifier, for: indexPath) as? ImageAddTableViewCell else{ fatalError("Cell Casting Error")}
                cell.navigationController = self.navigationController
                return cell
            default:
                fatalError("index error")
            }
        }else{
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: CategorySelectTableViewCell.cellIdentifier, for: indexPath) as? CategorySelectTableViewCell else{ fatalError("Cell Casting Error")}
                cell.categoryText.text = "입력사항 더보기"
                cell.arrowImage.isSelected = !isOpen
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstProductInfoTableView.cellIdentifier, for: indexPath) as? FirstProductInfoTableView else{ fatalError("Cell Casting Error")}
                
                cell.viewController = self
                
                return cell
            default:
                fatalError("index error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.view.endEditing(true)
        
        if(indexPath == [0,0]){
            
            let vc = CategorySheetViewController(service: .Zatch)
            
            vc.completion = { category in
                guard let cell = tableView.cellForRow(at: indexPath) as? CategorySelectTableViewCell else{ return }
                cell.categoryText.text = category
                self.productInfo.category = category
            }
            
            vc.loadViewIfNeeded()
            self.present(vc, animated: true, completion: nil)
            
        }else if(indexPath == [1,0]){
            
            guard let cell = tableView.cellForRow(at: indexPath) as? CategorySelectTableViewCell else { return}
            isOpen.toggle()
            cell.arrowImage.isSelected = isOpen
            self.registerView.backTableView.reloadSections(IndexSet.init(integer: indexPath.section), with: .none)
        }
    }
    
}

extension FirstRegisterViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.productInfo.productName = textField.text ?? ""
    }
}


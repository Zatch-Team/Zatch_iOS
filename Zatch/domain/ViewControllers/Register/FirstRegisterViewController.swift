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
        var category: String?
        var productName: String?
        var imageCount: Int?
        var buyDate: String?
        var endDate: String?
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
        
        registerView.backTableView.settingCustomTableView(self)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - Action
    
    @objc func nextBtnDidClicked(){
        
        let alertType: FirstRegisterViewController.InvalidationMessage!
        
        if(productInfo.category == nil){
            alertType = .category
        }else if(productInfo.productName == nil){
            alertType = .productName
        }else if(productInfo.imageCount == 0){
            alertType = .image
        }else if(productInfo.category == nil && productInfo.buyDate == nil){
            alertType = .buyDate
        }else if(productInfo.category == nil && productInfo.endDate == nil){
            alertType = .endDate
        }else{ //input 데이터 모두 유효할 경우, Second로 이동
            let vc  = SecondRegisterViewController()
            //TODO: Data 담아서 넘기기
            self.navigationController?.pushViewController(vc, animated: true)
            return
        }
        
        let alert = BasicAlertViewController(message: alertType.rawValue)
        alert.modalPresentationStyle = .overFullScreen
        
        self.present(alert, animated: false, completion: nil)
        
        
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
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductInputTextFieldTabeViewCell.cellIdentifier, for: indexPath) as? ProductInputTextFieldTabeViewCell else{ fatalError("Cell Casting Error")}
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
                guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstProductInfoTableViewCell.cellIdentifier, for: indexPath) as? FirstProductInfoTableViewCell else{ fatalError("Cell Casting Error")}
                cell.navigationController = self.navigationController
                return cell
            default:
                fatalError("index error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.view.endEditing(true)
        
        if(indexPath == [0,0]){
            
            let vc = CategoryBottomSheet()
            
            vc.categorySelectHandler = { category in
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

extension FirstRegisterViewController{
    enum InvalidationMessage: String{
        case category = "카테고리를 입력해주세요."
        case productName = "상품 이름을 입력해주세요."
        case image = "이미지를 최소 1장 이상 첨부해주세요."
        case buyDate = "구매일자를 입력해주세요."
        case endDate = "유통기한을 입력해주세요."
    }
}


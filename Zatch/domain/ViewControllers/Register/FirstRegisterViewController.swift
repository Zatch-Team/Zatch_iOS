//
//  RegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class FirstRegisterViewController: BaseLeftTitleViewController {
    
    //MARK: - Properties
    
    var isOpen = false
    
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
    
    //MARK: - Action
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc
    func nextBtnDidClicked(){
        let vc  = SecondRegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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


//
//  RegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class FirstRegisterViewController: BaseViewController {
    
    //MARK: - Properties
    var isOpen = false
    
    //MARK: - UI
    let topView = TitleView().then{
        $0.titleLabel.text = "주고 싶은\n물건이 무엇인가요?"
    }
    
    var backTableView : UITableView!
    
    let nextButton = PurpleButton().then{
        $0.setTitle("다음 단계로", for: .normal)
        $0.addTarget(self, action: #selector(nextBtnDidClicked), for: .touchUpInside)
    }

    override func viewDidLoad() {
        
        super.navigationTitle.text = "재치 등록하기"
        super.viewDidLoad()

        setInitView()
        setUpView()
        setUpConstraint()
    }
    
    //MARK: - Action
    @objc
    func nextBtnDidClicked(){
        let vc = SecondRegisterViewController()
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
                return cell
            default:
                fatalError("index error")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
            self.backTableView.reloadSections(IndexSet.init(integer: indexPath.section), with: .none)
        }
    }
    
}


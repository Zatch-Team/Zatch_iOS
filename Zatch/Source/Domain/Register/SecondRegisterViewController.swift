//
//  WantRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class SecondRegisterViewController: BaseViewController {
    
    //MARK: - Properties
    var isFieldOpen = [true, false, false]
    var categoryChoose : [String?] = [nil, nil, nil]
    
    //MARK: - UI
    
    let topTitleView = TitleView().then{
        $0.titleLabel.text = "받고 싶은\n물건이 있나요?"
    }
    
    var tableView : UITableView!
    
    let checkBoxFrame = UIStackView().then{
        $0.spacing = 16
        $0.axis = .vertical
    }
    
    let topCheckBoxFrame = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    
    let topCheckBoxBtn = ZatchRoundCheck()
    
    let topCheckBoxLabel = UILabel().then{
        $0.text = "다른 것도 괜찮아요!"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    
    let belowCheckBoxFrame = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    
    let belowCheckBoxBtn = ZatchRoundCheck()
    
    let belowCheckBoxLabel = UILabel().then{
        $0.text = "이 것만 가능해요!"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    
    let btnFrame = UIStackView().then{
        $0.spacing = 10
        $0.axis = .horizontal
    }
    
    lazy var shareBtn = WhitePurpleButton().then{
        $0.setTitle("나눔", for: .normal)
    }
    
    lazy var nextBtn = PurpleButton().then{
        $0.setTitle("다음 단계로", for: .normal)
    }

    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setInitView()
        setUpView()
        setUpConstraint()
    }
    
    //MARK: - Helper

}

extension SecondRegisterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0 || isFieldOpen[section]){
            return 2
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategorySelectWithRankTableViewCell.cellIdentifier) as? CategorySelectWithRankTableViewCell else {fatalError()}
            cell.rankLabel.text = "\(indexPath.section + 1)순위"
            cell.categoryText.text = categoryChoose[indexPath.section] ?? "카테고리 선택"
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductInputTextFieldTabeViewCell.cellIdentifier) as? ProductInputTextFieldTabeViewCell else {fatalError()}
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            let vc = CategoryBottomSheet()
            vc.categorySelectHandler = { category in

                guard let cell = tableView.cellForRow(at: indexPath) as? CategorySelectTableViewCell else{ return }
                
                self.categoryChoose[indexPath.section] = category
                
                if(!self.isFieldOpen[indexPath.section]){
                    self.isFieldOpen[indexPath.section] = true
                }
                
                self.tableView.reloadData()
                
            }
            
            vc.loadViewIfNeeded()
            self.present(vc, animated: true, completion: nil)
        }
    }
}

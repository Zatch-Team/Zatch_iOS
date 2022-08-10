//
//  WantRegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class SecondRegisterViewController: BaseViewController {
    
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
}

extension SecondRegisterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 2
        }else{
            return 1
        }
        //open 상태일 때는 2 반환하도록
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategorySelectWithRankTableViewCell.cellIdentifier) as? CategorySelectWithRankTableViewCell else {fatalError()}
            cell.rankLabel.text = "\(indexPath.section + 1)순위"
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductInputTextFieldTabeViewCell.cellIdentifier) as? ProductInputTextFieldTabeViewCell else {fatalError()}
            return cell
        }
    }
}

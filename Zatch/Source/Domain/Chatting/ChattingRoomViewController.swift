//
//  ChattingRoomViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/17.
//

import UIKit

class ChattingRoomViewController: BaseViewController {

    let nameLabel = UILabel().then{
        $0.text = "쑤야"
        $0.font = UIFont.pretendard(size: 18, family: .Bold)
        $0.textColor = .black85
    }
    
    let townLabel = UILabel().then{
        $0.text = "중계동"
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textColor = .zatchPurple
    }
    
    let reservationFinishTag = UILabel().then{
        $0.text = "예약완료"
        $0.textAlignment = .center
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
        $0.textColor = .white
        $0.backgroundColor = .zatchPurple
        $0.layer.cornerRadius = 24/2
        $0.clipsToBounds = true
    }
    
    let etcBtn = UIButton().then{
        $0.setImage(UIImage(named: "dot"), for: .normal)
    }
    
    var tableView: UITableView!
    
    let chatInputView = ChatInputView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setInitView()
        setUpView()
        setUpConstraint()
        
        tableView.backgroundColor = .red
    }

}

extension ChattingRoomViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}

//
//  BlockUserView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/15.
//

import UIKit

class BlockUserView: BaseView {
    
    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        $0.backgroundView = EmptyBlockUserView()
        
        $0.register(cellType: BlockUserTableViewCell.self)
    }
    
    override func hierarchy() {
        self.addSubview(tableView)
    }
    
    override func layout() {
        tableView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        tableView.backgroundView?.snp.makeConstraints{
            $0.width.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}

extension BlockUserView{
    
    class EmptyBlockUserView: BaseView{
        
        let message = UILabel().then{
            $0.text = "차단된 사용자가 없습니다."
            $0.textColor = .black20
            $0.setTypoStyleWithSingleLine(typoStyle: .medium15_21)
        }
        
        override func hierarchy() {
            self.addSubview(message)
        }
        
        override func layout() {
            message.snp.makeConstraints{
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview().offset(292)
                $0.bottom.equalToSuperview().offset(-317)
            }
        }
    }
}

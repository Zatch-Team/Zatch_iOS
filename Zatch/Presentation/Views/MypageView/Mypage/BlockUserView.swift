//
//  BlockUserView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/15.
//

import UIKit

class BlockUserView: UIView {
    
    let tableView = UITableView().then{
        $0.showsVerticalScrollIndicator = false
        
        $0.register(BlockUserTableViewCell.self, forCellReuseIdentifier: BlockUserTableViewCell.cellIdentifier)
    }
    
    let emptyView = EmptyBlockUserView().then{
        $0.isHidden = true
    }

    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        self.addSubview(tableView)
        self.addSubview(emptyView)
        
        tableView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        emptyView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BlockUserView{
    
    class EmptyBlockUserView: UIView{
        
        let message = UILabel().then{
            $0.text = "차단된 사용자가 없습니다."
            $0.textColor = .black20
            $0.font = UIFont.pretendard(size: 15, family: .Medium)
        }
        
        override init(frame: CGRect){
            
            super.init(frame: .zero)
            
            self.addSubview(message)
            
            message.snp.makeConstraints{
                $0.centerX.equalToSuperview()
                $0.top.equalToSuperview().offset(292)
                $0.bottom.equalToSuperview().offset(-317)
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

//
//  BaseTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/14.
//

import UIKit

class BaseTableViewCell: UITableViewCell, CellReuse {
    
    var cellIndexPath: IndexPath?{
        return (superview as? UITableView)?.indexPath(for: self)
    }
    
    let baseView = UIView().then{
        $0.backgroundColor = .white
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.style()
        hierarchy()
        layout()
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() {
        selectedBackgroundView = UIView()
    }
    
    func hierarchy() {
        contentView.addSubview(baseView)
    }
    
    func layout() {
        baseView.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func initialize(){ }
    
}

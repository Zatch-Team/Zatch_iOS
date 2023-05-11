//
//  BaseCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2023/01/12.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell, CellReuse {
    
    var indexPath: IndexPath?{
        guard let collectionView = superview as? UICollectionView,
                let cellIndex =  collectionView.indexPath(for: self) else { return nil }
        return cellIndex
    }
    
    let baseView = UIView().then{
        $0.backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        hierarchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func style() { }
    
    func hierarchy(){
        self.contentView.addSubview(baseView)
    }
    
    func layout(){
        baseView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

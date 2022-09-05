//
//  ResultSearchTagCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

class ResultSearchTagCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let cellIdentifier = "ResultSearchTagCell"
    
    var textColor: UIColor!
    var unselectBackgroundColor: UIColor!
    var selectBackgroundColor: UIColor!
    
    //MARK: - UI
    
    lazy var tagBtn = UILabel().then{
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.layer.cornerRadius = 28/2
        $0.numberOfLines = 1
        $0.textAlignment = .center
        $0.clipsToBounds = true
    }
    
    let backView = UIView()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        self.contentView.addSubview(backView)
        self.backView.addSubview(tagBtn)
        
        backView.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        tagBtn.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper
    
    func setTagColorInit(){
        self.tagBtn.backgroundColor = unselectBackgroundColor
        self.tagBtn.textColor = textColor
    }
    
    func setTagColorSelect(){
        self.tagBtn.backgroundColor = selectBackgroundColor
        self.tagBtn.textColor = .white
    }
}

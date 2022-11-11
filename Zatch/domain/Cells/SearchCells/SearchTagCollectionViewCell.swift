//
//  SearchSelectCollectionViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/05.
//

import UIKit

class SearchTagCollectionViewCell: UICollectionViewCell{
    
    //MARK: - Properties
    
    static let cellIdentifier = "selectionCell"
    
    var delegate: CellDelegate?
    
    //MARK: - UI
    
    let backView = UIView()
    
    lazy var selectBtn = UIButton().then{
        $0.layer.cornerRadius = 28 / 2
        $0.addTarget(self, action: #selector(selectBtnIsTapped), for: .touchUpInside)
        $0.titleLabel?.numberOfLines = 1
    }
    
    //MARK: - Helper
    
    func setBtnInitState(){
        self.selectBtn.layer.borderWidth = 1
        self.selectBtn.titleLabel?.font = UIFont.pretendard(size: 13, family: .Medium)
        self.selectBtn.layer.borderColor = UIColor.black45.cgColor
        self.selectBtn.setTitleColor(.black45, for: .normal)
    }
    
    func setBtnSelectedState(){
        self.selectBtn.layer.borderWidth = 1.5
        self.selectBtn.titleLabel?.font = UIFont.pretendard(size: 13, family: .Bold)
        self.selectBtn.layer.borderColor = UIColor.zatchYellow.cgColor
        self.selectBtn.setTitleColor(.zatchYellow, for: .normal)
    }
    
    //MARK: - Action
    @objc
    func selectBtnIsTapped(){}
    
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        self.contentView.addSubview(backView)
        
        backView.addSubview(selectBtn)
        
        self.backView.snp.makeConstraints{ make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
        self.selectBtn.snp.makeConstraints{ make in
            make.height.equalToSuperview()
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

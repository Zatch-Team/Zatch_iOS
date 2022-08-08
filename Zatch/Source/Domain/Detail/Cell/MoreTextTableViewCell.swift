//
//  MoreTextTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/27.
//

import UIKit

class MoreTextTableViewCell: UITableViewCell {
    
    let moreText = UILabel().then{
        $0.text = "귀여운 고양이 몰랑이 피규어 12종입니다.캣타워까지 세트예요.2022년 호랑이의 해 기념으로 나온 호랑이 몰랑이랑 교환 구해요."
        $0.numberOfLines = 0
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
    }
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        self.contentView.addSubview(moreText)
        self.contentView.addSubview(borderLine)
    }
    
    func setUpConstraint(){
        moreText.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-24)
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        borderLine.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
    }

}

//
//  ResultEmptyTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/09.
//

import UIKit

class ResultEmptyTableViewCell: UIView {
    
    let titleLabel = UILabel().then{
        $0.text = "이런!\n검색결과가 없어요."
        $0.numberOfLines = 2
        $0.textAlignment = .center
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black85
    }
    
    let tipTitle = UILabel().then{
        $0.text = "검색 TIP"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black85
    }
    
    let tipFrame = UIView().then{
        $0.backgroundColor = .black5
        $0.layer.cornerRadius = 14
    }
    
    let paragraph1 = UILabel().then{
        $0.text = " • "
        $0.font = UIFont.pretendard(size: 25, family: .Regular)
    }
    
    let tipLabel1 = UILabel().then{
        $0.text = "교환하고 싶은 재치가 있다면 나의 재치를 ‘ ? ‘ 로 설정하고 검색해서 상대방에게 제안해보세요!"
        $0.numberOfLines = 2
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
        $0.setTextWithLineHeight(lineHeight: 19.6)
    }
    
    let paragraph2 = UILabel().then{
        $0.text = " • "
        $0.font = UIFont.pretendard(size: 25, family: .Regular)
    }
    
    let tipLabel2 = UILabel().then{
        $0.text = "유연한 탐색을 통해 우리 집 근처의 재치들을 둘러보세요!"
        $0.numberOfLines = 2
        $0.font = UIFont.pretendard(size: 14, family: .Regular)
        $0.setTextWithLineHeight(lineHeight: 19.6)
    }
    
    override init(frame: CGRect){
        
        super.init(frame: .zero)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView(){
        
        self.addSubview(titleLabel)
        self.addSubview(tipTitle)
        self.addSubview(tipFrame)
        
        tipFrame.addSubview(paragraph1)
        tipFrame.addSubview(tipLabel1)
        tipFrame.addSubview(paragraph2)
        tipFrame.addSubview(tipLabel2)
    }
    
    private func setUpConstraint(){
        
        self.titleLabel.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(172)
            make.bottom.equalToSuperview().offset(-294)
            make.height.equalTo(40)
        }
        
        self.tipTitle.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(27)
        }
        
        self.tipFrame.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(tipTitle.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-80)
        }
        
        self.paragraph1.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(12)
            make.firstBaseline.equalTo(tipLabel1).offset(2)
        }
        
        self.tipLabel1.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(paragraph1.snp.trailing).offset(3)
            make.trailing.equalToSuperview().offset(-15)
        }
        
        self.paragraph2.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(12)
            make.firstBaseline.equalTo(tipLabel2).offset(2)
        }
        
        self.tipLabel2.snp.makeConstraints{ make in
            make.top.equalTo(tipLabel1.snp.bottom).offset(8)
            make.leading.equalTo(paragraph2.snp.trailing).offset(3)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}

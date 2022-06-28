//
//  BottomFixView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/27.
//

import UIKit

class BottomFixView: UIView {
    
    let likeImage = UIImageView().then{
        $0.image = UIImage(named: "heart")
        $0.tintColor = .black85
    }
    
    let likeLabel = UILabel().then{
        $0.textColor = .black85
        $0.text = "관심리스트 보기"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let upBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let chatImage = UIImageView().then{
        $0.image = UIImage(named: "chat")
    }
    
    let chatLabel = UILabel().then{
        $0.textColor = .black85
        $0.text = "채팅리스트 보기"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    let stackView = UIStackView().then{
        $0.spacing = 26
        $0.axis = .horizontal
        $0.alignment = .center
    }
    
    let leftStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 6
    }
    
    let rightStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 6
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.addSubview(stackView)
        self.addSubview(upBorderLine)
        
        stackView.addArrangedSubview(leftStack)
        stackView.addArrangedSubview(borderLine)
        stackView.addArrangedSubview(rightStack)
        
        leftStack.addArrangedSubview(likeImage)
        leftStack.addArrangedSubview(likeLabel)
        
        rightStack.addArrangedSubview(chatImage)
        rightStack.addArrangedSubview(chatLabel)
    }
    
    func setUpConstraint(){
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(60)
        }
        
        upBorderLine.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints{ make in
            make.centerX.centerY.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        likeImage.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
        }
        
        borderLine.snp.makeConstraints{ make in
            make.width.equalTo(1)
            make.top.equalToSuperview().offset(14)
            make.bottom.equalToSuperview().offset(-14)
        }
        
        chatImage.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
        }
        
    }
    
}

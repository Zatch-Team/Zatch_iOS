//
//  BottomFixView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/27.
//

import UIKit

final class ZatchDetailBottomFixView: BaseView {
    
    var likeViewTitle: String!{
        didSet{
            likeLabel.text = likeViewTitle
        }
    }
    var chatViewTitle: String!{
        didSet{
            chatLabel.text = chatViewTitle
        }
    }
    
    let likeImage = UIButton().then{
        $0.setImage(Image.heart.withTintColor(.black85), for: .normal)
        $0.setImage(Image.heartYellow, for: .selected)
        $0.isUserInteractionEnabled = false
    }
    
    private let likeLabel = UILabel().then{
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    private let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    private let upBorderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    private let chatImage = UIImageView().then{
        $0.setImageTintColor(.black85)
        $0.image = Image.chat
    }
    
    private let chatLabel = UILabel().then{
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    private let leftBackView = UIView().then{
        $0.isUserInteractionEnabled = true
    }
    let leftStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 6
        $0.isUserInteractionEnabled = true
    }
    private let rightBackView = UIView()
    let rightStack = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 6
        $0.isUserInteractionEnabled = true
    }
    
    override func style() {
        backgroundColor = .white
    }
    
    override func hierarchy() {
        addSubview(upBorderLine)
        addSubview(leftBackView)
        addSubview(borderLine)
        addSubview(rightBackView)
        
        leftBackView.addSubview(leftStack)
        rightBackView.addSubview(rightStack)
        
        leftStack.addArrangedSubview(likeImage)
        leftStack.addArrangedSubview(likeLabel)
        
        rightStack.addArrangedSubview(chatImage)
        rightStack.addArrangedSubview(chatLabel)
    }
    
    override func layout() {
        
        self.snp.makeConstraints{ make in
            make.height.equalTo(60)
        }
        
        upBorderLine.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }

        leftBackView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.trailing.equalTo(borderLine.snp.leading)
            $0.centerY.equalToSuperview()
            $0.top.bottom.equalTo(borderLine)
        }
        leftStack.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
        
        rightBackView.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.leading.equalTo(borderLine.snp.trailing)
            $0.centerY.equalToSuperview()
            $0.top.bottom.equalTo(borderLine)
        }
        rightStack.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
        
        likeImage.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
        }
        borderLine.snp.makeConstraints{ make in
            make.width.equalTo(1)
            make.centerX.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(14)
        }
        chatImage.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
        }
    }
}

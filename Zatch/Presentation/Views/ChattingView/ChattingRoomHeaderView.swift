//
//  ChattingRoomHeaderView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/01.
//

import Foundation

class ChattingRoomHeaderView: EtcButtonHeaderView{
    
    var opponentNameLabel = UILabel().then{
        $0.text = "쑤야"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
        $0.textColor = .black85
        $0.isUserInteractionEnabled = true
    }
    
    let townLabel = UILabel().then{
        $0.text = "중계동"
        $0.setTypoStyleWithSingleLine(typoStyle: .medium12)
        $0.textColor = .zatchPurple
    }
    
    let reservationFinishTag = UILabel().then{
        $0.text = "예약완료"
        $0.textAlignment = .center
        $0.setTypoStyleWithSingleLine(typoStyle: .bold13)
        $0.textColor = .white
        $0.backgroundColor = .zatchPurple
        $0.layer.cornerRadius = 24/2
        $0.clipsToBounds = true
    }
    
    init(){
        super.init(image: Image.dot)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hierarchy() {
        super.hierarchy()
        self.addSubview(opponentNameLabel)
        self.addSubview(townLabel)
        self.addSubview(reservationFinishTag)
    }
    
    override func layout() {
        
        super.layout()
        
        opponentNameLabel.snp.makeConstraints{
            $0.leading.equalTo(self.backButton.snp.trailing).offset(16)
            $0.centerY.equalToSuperview()
        }
        
        townLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(opponentNameLabel.snp.trailing).offset(8)
        }
        
        reservationFinishTag.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(etcButton.snp.leading).offset(-16)
            make.height.equalTo(24)
            make.width.equalTo(58)
        }
    }
}

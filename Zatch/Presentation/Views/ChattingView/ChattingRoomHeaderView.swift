//
//  ChattingRoomHeaderView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/01.
//

import Foundation

class ChattingRoomHeaderView: EtcButtonHeaderView{
    
    let opponentNameLabel = UILabel().then{
        $0.text = "쑤야"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold20)
        $0.textColor = .black85
        $0.isUserInteractionEnabled = true
    }
    
    private let townLabel = UILabel().then{
        $0.text = "중계동"
        $0.setTypoStyleWithSingleLine(typoStyle: .medium15_21)
        $0.textColor = .zatchPurple
    }
    
    private let reservationTag = ZatchComponent.PurlpleTag(configuration: .height29).then{
        $0.text = "예약완료"
        $0.isSelected = true
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
        self.addSubview(reservationTag)
    }
    
    override func layout() {
        
        super.layout()
        
        opponentNameLabel.snp.makeConstraints{
            $0.leading.equalTo(backButton.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }
        townLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(opponentNameLabel.snp.trailing).offset(8)
        }
        reservationTag.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(etcButton.snp.leading).offset(-8)
        }
    }
}

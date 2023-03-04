//
//  ChatEtcBtnView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/21.
//

import UIKit

extension ChattingRoomView{
    
    class ChatEtcBtnView: BaseView {
        
        private let etcBtnStackView = UIStackView().then{
            $0.spacing = 20
            $0.axis = .horizontal
            $0.alignment = .leading
        }
        
        let cameraStackView = EtcButtonLabelStackView(title: "카메라", image: Image.chatCamera)
        let galleryStackView = EtcButtonLabelStackView(title: "갤러리", image: Image.chatGallery)
        let appointmentStackView = EtcButtonLabelStackView(title: "거래약속", image: Image.chatAppintment)
        
        override func hierarchy() {
            
            addSubview(etcBtnStackView)
            
            etcBtnStackView.addArrangedSubview(cameraStackView)
            etcBtnStackView.addArrangedSubview(galleryStackView)
            etcBtnStackView.addArrangedSubview(appointmentStackView)
        }
        
        override func layout() {
            
            etcBtnStackView.snp.makeConstraints{ make in
                make.top.equalToSuperview().offset(12)
                make.leading.equalToSuperview().offset(52)
                make.bottom.equalToSuperview().offset(-23)
            }
        }
    }
}

extension ChattingRoomView.ChatEtcBtnView{
    
    class EtcButtonLabelStackView: UIStackView{
        
        lazy var button = UIButton()
        private let titleLabel = UILabel().then{
            $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
            $0.textColor = .black65
        }
        
        init(title: String, image: UIImage){
            super.init(frame: .zero)
            titleLabel.text = title
            button.setImage(image, for: .normal)
            style()
            layout()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func style(){
            spacing = 8
            axis = .vertical
            alignment = .center
        }
        
        private func layout(){
            addArrangedSubview(button)
            addArrangedSubview(titleLabel)
            
            button.snp.makeConstraints{
                $0.width.height.equalTo(52)
            }
        }
    }
}

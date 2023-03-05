//
//  ChattingRoomView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/01.
//

import Foundation

class ChattingRoomView: BaseView{
    
    let tableView = UITableView().then{
        $0.register(cellType: RightChattingMessageTableViewCell.self)
        $0.register(cellType: LeftChattingMessageTableViewCell.self)
        $0.register(cellType: RightChattingImageTableViewCell.self)
        $0.register(cellType: LeftChattingImageTableViewCell.self)
    }
    
    let matchBannerView = ChattingMatchBannerView()
    let chatInputView = ChatInputView()
    let chatEtcBtnView = ChatEtcBtnView()
    let chatBottomFrame = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 0
        $0.alignment = .leading
    }
    
    override func hierarchy() {
        self.addSubview(matchBannerView)
        self.addSubview(tableView)
        self.addSubview(chatBottomFrame)
        
        chatBottomFrame.addArrangedSubview(chatInputView)
    }
    
    override func layout() {
        
        matchBannerView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(matchBannerView.snp.bottom)
            make.bottom.equalTo(chatInputView.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        chatBottomFrame.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
        
        chatInputView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
        }
    }
}

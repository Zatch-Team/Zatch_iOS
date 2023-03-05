//
//  ChattingSideSheetView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/03/05.
//

import Foundation

class ChattingSideSheetView: BaseView{
    
    //MARK: - UI

    private let titleLabel = UILabel().then{
        $0.text = "채팅 참여자"
        $0.textColor = .black85
        $0.setTypoStyleWithSingleLine(typoStyle: .bold18)
    }
    
    let tableView = UITableView().then{
        $0.isScrollEnabled = false
        $0.register(cellType: ChattingMemberTableViewCell.self)
    }
    
    private let borderLine = ZatchComponent.BorderLine(color: .black10, height: 1.5)
    
    private let exitFrame = UIView().then{
        $0.backgroundColor = .black5
    }
    let exitStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
        $0.isUserInteractionEnabled = true
    }
    private let exitImage = UIImageView().then{
        $0.image = Image.chatExit
    }
    private let exitTitle = UILabel().then{
        $0.text = "채팅 나가기"
        $0.isUserInteractionEnabled = true
        $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
        $0.textColor = .black20
    }
    
    override func hierarchy(){
        addSubview(titleLabel)
        addSubview(tableView)
        addSubview(exitFrame)
        
        exitFrame.addSubview(borderLine)
        exitFrame.addSubview(exitStackView)
        
        exitStackView.addArrangedSubview(exitImage)
        exitStackView.addArrangedSubview(exitTitle)
    }
    
    override func layout(){
        
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(21)
            $0.leading.equalToSuperview().offset(20)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(17)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(exitFrame.snp.top)
        }
        
        exitFrame.snp.makeConstraints{
            $0.height.equalTo(85)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        borderLine.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
        }
        
        exitStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().offset(16)
        }
        exitImage.snp.makeConstraints{
            $0.width.height.equalTo(24)
        }
        exitTitle.snp.makeConstraints{
            $0.centerY.equalToSuperview()
        }
    }
}

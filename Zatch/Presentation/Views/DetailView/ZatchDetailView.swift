//
//  DetailView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/28.
//

import UIKit
import RxSwift
import RxGesture

class ZatchDetailView: BaseView {
    
    var isLike: Bool = false{
        didSet{
            bottomView.likeImage.isSelected = isLike
        }
    }
    
    lazy var likeView: UIView = bottomView.leftStack
    lazy var chatView: UIView = bottomView.rightStack
    
    init(writer: ZatchDetailViewController.Writer) {
        super.init(frame: .zero)
        setTitle(of: writer)
    }
    
    private func setTitle(of writer: ZatchDetailViewController.Writer){
        switch writer {
        case .me:
            bottomView.likeViewTitle = "관심목록 보기"
            bottomView.chatViewTitle = "채팅리스트 보기"
        case .others:
            bottomView.likeViewTitle = "관심"
            bottomView.chatViewTitle = "채팅하기"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView = UITableView().then{
        $0.contentInset = UIEdgeInsets(top: -48, left: 0, bottom: 0, right: 0)
        $0.showsVerticalScrollIndicator = false
        
        $0.register(cellType: DetailImageTableViewCell.self)
        $0.register(cellType: ExchangeDetailTableViewCell.self)
        $0.register(cellType: ShareDetailTableViewCell.self)
        $0.register(cellType: ProductInfoTableViewCell.self)
        $0.register(cellType: MoreTextTableViewCell.self)
        $0.register(cellType: SimilarZatchTableViewCell.self)
    }
    
    private let bottomView = ZatchDetailBottomFixView()

    override func hierarchy() {
        addSubview(tableView)
        addSubview(bottomView)
    }
    
    override func layout() {
        tableView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomView.snp.top)
        }
        bottomView.snp.makeConstraints{
            $0.bottom.equalTo(safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

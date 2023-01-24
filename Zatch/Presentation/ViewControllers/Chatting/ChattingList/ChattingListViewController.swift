//
//  ChattingListViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/16.
//

import UIKit

class ChattingListViewController: BaseTabBarViewController {
    
    //MARK: - Properties
    
    init(){
        super.init(headerView: TabBarHeaderView(title: "채팅",
                                                etcButton: Image.bell))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        setUpChildVC()
    }
    
    override func initialize() {
        headerView.etcButton.addTarget(self, action: #selector(bellButtonDidClicked), for: .touchUpInside)
        //        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellWillMoveToOriginalPosition)
    }
    //MARK: - Action
    
    @objc func bellButtonDidClicked(){
        print("bell btn clicked")
    }

}

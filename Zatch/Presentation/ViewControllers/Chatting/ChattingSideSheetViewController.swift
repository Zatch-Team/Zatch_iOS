//
//  ChattingSideSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/21.
//

import UIKit

protocol ChattingSideMenuDelegate: AnyObject{
    func willShowDeclarationBottomSheet(index: Int)
    func willShowExitRoomAlert()
}

class ChattingSideSheetViewController: UIViewController, UIGestureRecognizerDelegate, DeclarationDelegate {

    weak var delegate: ChattingSideMenuDelegate?
    
    private let viewModel: any BlockUserInterface
    
    init(viewModel: BlockUserInterface){
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mainView = ChattingSideSheetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        initialzie()
    }

    private func style(){
        view.backgroundColor = .white
    }
    
    private func initialzie(){
        setTableViewDelegate()
        mainView.exitStackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(exitBtnDidTap)))
    }
    
    private func setTableViewDelegate(){
        mainView.tableView.initializeDelegate(self)
    }
    
    private func layout(){
        view.addSubview(mainView)
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.headerTop)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func willShowDelclarationBottomSheet(index: Int) {
        delegate?.willShowDeclarationBottomSheet(index: index)
    }
    
    @objc private func exitBtnDidTap(){
        delegate?.willShowExitRoomAlert()
    }
}

extension ChattingSideSheetViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        viewModel.chattingmMembers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(for: indexPath, cellType: ChattingMemberTableViewCell.self).then{
            $0.delegate = self
            $0.bindingData(viewModel.chattingmMembers[indexPath.row])
        }
    }
}

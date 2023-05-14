//
//  DetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit
import RxSwift

class ZatchDetailViewController: BaseViewController<EtcButtonHeaderView, ZatchDetailView>, DetailStrategy {

    @frozen
    enum Writer{
        case me
        case others
    }
    
    static func getInstance(data zatch: ZatchResponseModel) -> ZatchDetailViewController {
        return MyZatchDetailViewController(zatch: zatch) //임시
//        zatch.userId == UserManager.userId
//        ? MyZatchDetailViewController(zatch: zatch)
//        : OthersZatchDetailViewController(zatch: zatch)
    }
    
    private let zatch: ZatchResponseModel
    
    init(zatch: ZatchResponseModel, writer: Writer) {
        self.zatch = zatch
        super.init(headerView: EtcButtonHeaderView(image: Image.dot), mainView: ZatchDetailView(writer: writer))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        changeMainViewLayout()
    }
    
    private func changeMainViewLayout(){
        view.bringSubviewToFront(headerView)
        mainView.snp.remakeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    override func initialize(){
        super.initialize()
        mainView.tableView.initializeDelegate(self)
        bindStrategyAction()
    }
    
    private func bindStrategyAction(){
        headerView.etcButton.rx.tap
            .subscribe{ [weak self] _ in
                self?.etcBtnDidTapped()
            }.disposed(by: disposeBag)
        
        mainView.likeView.rx.tapGesture()
            .when(.recognized)
            .subscribe{ [weak self] _ in
                self?.likeBtnDidTapped()
            }.disposed(by: disposeBag)
        
        mainView.chatView.rx.tapGesture()
            .when(.recognized)
            .subscribe{ [weak self] _ in
                self?.chatBtnDidTapped()
            }.disposed(by: disposeBag)
    }
    
    func etcBtnDidTapped() {
        
    }
    
    func likeBtnDidTapped() {
        
    }
    
    func chatBtnDidTapped() {
        
    }
    
    

}

extension ZatchDetailViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: DetailImageTableViewCell.self)
            return cell
        case 1:
            
            //1. exchange
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstWantCell", for: indexPath) as? ExchangeDetailTableViewCell else{
//                fatalError("Cell Casting Error")
//            }
            
            //2. share
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ShareDetailTableViewCell.self)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductInfoTableViewCell.self)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MoreTextTableViewCell.self)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SimilarZatchTableViewCell.self)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}

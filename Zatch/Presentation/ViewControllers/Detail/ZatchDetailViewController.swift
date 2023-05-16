//
//  DetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit
import RxSwift
import RxGesture

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
    
    let zatch: ZatchResponseModel
    
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
    
    //MARK: - Template Method
    //하위 클래스가 로직 구현
    func etcBtnDidTapped() {
    }
    
    func likeBtnDidTapped() {
    }
    
    func chatBtnDidTapped() {
    }
}

extension ZatchDetailViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return getImagesTableViewCell(indexPath: indexPath)
        default:
            return getDetailTableViewCell(indexPath: indexPath)
        }
    }
    
    private func getImagesTableViewCell(indexPath: IndexPath) -> UITableViewCell {
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: DetailImageTableViewCell.self).then{
            $0.images = zatch.images
        }
    }
    
    private func getDetailTableViewCell(indexPath: IndexPath) -> UITableViewCell{
        let cellType: BaseTableViewCell.Type = {
            switch indexPath.row {
            case 1:     return zatch.isFree ? ShareDetailTableViewCell.self : ExchangeDetailTableViewCell.self
            case 2:     return ProductInfoTableViewCell.self
            case 3:     return MoreTextTableViewCell.self
            default:    fatalError()
            }
        }()
        guard let cell = mainView.tableView.dequeueReusableCell(for: indexPath, cellType: cellType.self) as? BindingZatch else { fatalError() }
        cell.bindingData(zatch)
        return cell
    }
    
    /* 보류 기능
    private func getSimilarZatchTableViewCell(indexPath: IndexPath) -> UITableViewCell {
        mainView.tableView.dequeueReusableCell(for: indexPath, cellType: SimilarZatchTableViewCell.self)
    }
     */
}

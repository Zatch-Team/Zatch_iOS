//
//  ServiceCenterView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/04/26.
//

import Foundation

final class ServiceCenterView: BaseView{
    
    let serviceCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{

        $0.collectionViewLayout = CenterAlignCollectionViewFlowLayout().then{
            $0.itemSize = CGSize(width: 60, height: 22)
            $0.minimumInteritemSpacing = 26
        }
        $0.showsHorizontalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        
        $0.register(cellType: ServiceTitleCollectionViewCell.self)
    }
    
    let faqTableView = UITableView().then{
        $0.register(cellType: FAQTitleTableViewCell.self)
        $0.register(cellType: FAQContentTableViewCell.self)
    }
    
    let moveAskButton = ZatchComponent.ZatchButton(title: "1:1 문의하기", configuration: .height48)
    
    override func hierarchy(){
        addSubview(serviceCollectionView)
        addSubview(faqTableView)
        addSubview(moveAskButton)
    }
    
    override func layout(){
        serviceCollectionView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(46)
        }
        
        faqTableView.snp.makeConstraints{
            $0.top.equalTo(serviceCollectionView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        moveAskButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(46)
            $0.leading.trailing.equalToSuperview().inset(101)
        }
    }
}

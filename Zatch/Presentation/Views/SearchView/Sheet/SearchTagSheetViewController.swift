//
//  SearchTagSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

class SearchTagSheetViewController: BaseBottomSheetViewController<Int>{
    
    //MARK: - Properties
    
    var tagData = ["타이머","안경닦이","호랑이 인형","램프","2022 달력", "미니 가습기","마우스 패드"]
    var currentTag: Int?
    
    //MARK: - UI
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        let flexLayout = CenterAlignCollectionViewFlowLayout().then{
            $0.minimumLineSpacing = 12
            $0.minimumInteritemSpacing = 8
        }
        $0.collectionViewLayout = flexLayout
    }

    override func layout() {
        super.layout()
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(35)
            $0.trailing.equalToSuperview().offset(-35)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
    override func initialize() {
        super.initialize()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension SearchTagSheetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tagData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return BaseCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return SearchWantZatchByRegisterCollectionViewCell.getEstimatedSize(title: tagData[indexPath.row])
    }

}

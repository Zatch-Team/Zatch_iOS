//
//  SearchTagSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit
import RxSwift

class SearchTagSheetViewController: BaseBottomSheetViewController<Int>{
    
    //MARK: - Properties
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        let flexLayout = CenterAlignCollectionViewFlowLayout().then{
            $0.minimumLineSpacing = 12
            $0.minimumInteritemSpacing = 8
        }
        $0.collectionViewLayout = flexLayout
    }
    
    let viewModel: ZatchSearchResultViewModel
    
    init(viewModel: ZatchSearchResultViewModel, type: BottomSheet){
        self.viewModel = viewModel
        super.init(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    override func layout() {
        super.layout()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(35)
            $0.bottom.equalToSuperview().offset(-30)
        }
    }
    
    override func initialize() {
        super.initialize()
        collectionView.initializeDelegate(self)
    }
}

extension SearchTagSheetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        BaseCollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dismiss(animated: true)
    }

}

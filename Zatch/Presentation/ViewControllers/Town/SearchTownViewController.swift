//
//  TownSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/12.
//

import UIKit

class SearchTownViewController: UIViewController {
    
    let mainView = SearchTownView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        mainView.myTownCollectionView.delegate = self
        mainView.myTownCollectionView.dataSource = self
    }

}

extension SearchTownViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyTownTagCollectionViewCell.cellIdentifier, for: indexPath) as? MyTownTagCollectionViewCell else { fatalError() }
        cell.townLabel.text = "성수동"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let label = UILabel().then{
            $0.layer.cornerRadius = 28/2
            $0.text = "성수동"
            $0.numberOfLines = 1
            $0.font = UIFont.pretendard(size: 14, family: .Medium)
            $0.sizeToFit()
        }
        return CGSize(width: label.intrinsicContentSize.width + 40, height: 28)
    }
    
}

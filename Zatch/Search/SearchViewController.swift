//
//  SearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/30.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var skipButton: UIButton!
    @IBOutlet var titleText: UILabel!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    let myZatchData: [String] = ["몰랑이 피규어","매일우유 250ml","콜드브루 60ml","예시가 있다면","이렇게 들어가야","해요","아아앙아ㅏ앙아아앙아아"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        
        searchCollectionView.dataSource = self
        searchCollectionView.delegate = self
        
        let cellNib: UINib = UINib(nibName: "SearchCollectionViewCell", bundle: nil)
        searchCollectionView.register(cellNib, forCellWithReuseIdentifier: "SearchCollectionCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 12
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 200, height: 28)
        flowLayout.minimumInteritemSpacing = CGFloat(8)
        searchCollectionView.collectionViewLayout = flowLayout
        searchCollectionView.showsHorizontalScrollIndicator = false
        
        //title text
        titleText.font = UIFont.pretendard(size: 20, family: .Bold)

        //next button custom
        nextButton.titleLabel?.text = "다음으로"
        nextButton.titleLabel?.font = UIFont.pretendard(family: .Bold)
        nextButton.titleLabel?.textColor = .white
        nextButton.backgroundColor = .zatchPurple
        nextButton.layer.cornerRadius = CGFloat(16)
        
        //skip button custom
        skipButton.titleLabel?.text = "건너뛰기"
        skipButton.titleLabel?.font = UIFont.pretendard(size: 12, family: .Medium)
        skipButton.titleLabel?.textColor = .black45
        
        //text field custom
        
    }

}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myZatchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell: SearchCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionCell", for: indexPath) as? SearchCollectionViewCell {
            
            cell.productName.setTitle(myZatchData[indexPath.row], for: .normal)
        
            return cell
        }
        return UICollectionViewCell()
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//
//    }
    

}

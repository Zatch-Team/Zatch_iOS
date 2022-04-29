//
//  MainZatchTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/03/16.
//

import UIKit

class MainZatchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var explain: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let cellNib: UINib = UINib(nibName: "MainZatchCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "mainZatchCollectionCell")
        
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 124, height: 226)
        flowLayout.minimumInteritemSpacing = CGFloat(20)
        collectionView.collectionViewLayout = flowLayout
        collectionView.showsHorizontalScrollIndicator = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MainZatchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell: MainZatchCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainZatchCollectionCell", for: indexPath) as? MainZatchCollectionViewCell {
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    
}

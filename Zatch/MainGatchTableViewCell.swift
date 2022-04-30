//
//  MainGatchTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/29.
//

import UIKit

class MainGatchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var moreButton: UILabel!
    @IBOutlet weak var colletionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        colletionView.dataSource = self
        colletionView.delegate = self
        
        let cellNib: UINib = UINib(nibName: "MainGatchCollectionViewCell", bundle: nil)
        colletionView.register(cellNib, forCellWithReuseIdentifier: "mainGatchCollectionCell")
        
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 219, height: 188)
        flowLayout.minimumInteritemSpacing = CGFloat(20)
        colletionView.collectionViewLayout = flowLayout
        colletionView.showsHorizontalScrollIndicator = false
        
        title.font = UIFont.pretendard(size: 16, family: .Bold)
        moreButton.textColor = .zatchYellow
        moreButton.font = UIFont.pretendard(size: 13, family: .Bold)
        
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}

extension MainGatchTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell: MainGatchCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainGatchCollectionCell", for: indexPath) as? MainGatchCollectionViewCell{
                return cell
            }
    
        return UICollectionViewCell()
    }
}

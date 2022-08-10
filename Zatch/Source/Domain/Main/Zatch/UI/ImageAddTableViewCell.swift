//
//  ImageAddTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/18.
//

import UIKit

class ImageAddTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "imageAddCell"
    
    let imageCollectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 84, height: 84)
        flowLayout.minimumInteritemSpacing = CGFloat(8)
        
        let collectionView = UICollectionView(frame: .init(), collectionViewLayout: flowLayout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        
        return collectionView
    }()
    
    let imageCountLabel = UILabel()
    
    let backView = UIView()
    
    var imageCount: Int = 0 {
        didSet{
            
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpView()
        setUpConstraint()
        setUpValue()

        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setUpView(){
        
        self.contentView.addSubview(backView)
        
        self.backView.addSubview(imageCollectionView)
        self.backView.addSubview(imageCountLabel)
    }
    
    func setUpConstraint(){
        
        self.backView.snp.makeConstraints{ make in
            make.height.equalTo(165)
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        imageCollectionView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(36)
            make.trailing.equalToSuperview()
            make.height.equalTo(84)
        }
        
        imageCountLabel.snp.makeConstraints{ make in
            make.top.equalTo(imageCollectionView.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(36)
        }
    }
    
    func setUpValue(){
        
        imageCountLabel.font = UIFont.pretendard(family: .Medium)
        imageCountLabel.text = "\(imageCount) / 10"
    }

}

extension ImageAddTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.row == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundView = UIImageView.init(image: UIImage(named: "image_add_button"))
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        //cell 재사용으로 인한 init 작업 진행
        cell.backgroundView = UIImageView.init()
        cell.layer.cornerRadius = 4
        return cell
        
    }
    
    
}

//
//  ImageAddTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/18.
//

import UIKit

class ImageAddTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "imageAddCell"
    
    var imageCollectionView: UICollectionView!
    
    let imageCountLabel = UILabel()
    
    let backView = UIView()
    
    var imageCount: Int = 0 {
        didSet{
            
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            flowLayout.itemSize = CGSize(width: 84, height: 84)
            flowLayout.minimumInteritemSpacing = CGFloat(8)
            
            $0.delegate = self
            $0.dataSource = self
            
            $0.collectionViewLayout = flowLayout
            $0.contentInset = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 20)
            $0.showsHorizontalScrollIndicator = false
            
            $0.register(ImageAddBtnCollectionViewCell.self, forCellWithReuseIdentifier: ImageAddBtnCollectionViewCell.cellIdentifier)
            $0.register(ImageRegisterCollectionViewCell.self, forCellWithReuseIdentifier: ImageRegisterCollectionViewCell.cellIdentifier)
        }

        setUpView()
        setUpConstraint()
        setUpValue()
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
            make.leading.equalToSuperview()
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageAddBtnCollectionViewCell.cellIdentifier, for: indexPath)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageRegisterCollectionViewCell.cellIdentifier, for: indexPath)
        return cell
        
    }
    
    
}

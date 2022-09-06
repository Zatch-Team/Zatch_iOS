//
//  MainCollectionViewTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit

class MainCollectionViewTableViewCell: UITableViewCell {
    let label = UILabel().then{
        $0.text = "내 주변 재치"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black
    }
    let subLabel = UILabel().then{
        $0.text = "내 주변에서는 이런 재치들이 거래되고 있어요!"
        $0.font = UIFont.pretendard(size: 13, family: .Regular)
        $0.textColor = .systemGray
    }
    
    var collectionView : UICollectionView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()) .then{
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 20
            
            flowLayout.itemSize = CGSize(width: 124, height: 210)
            flowLayout.scrollDirection = .horizontal
            
            $0.collectionViewLayout = flowLayout
            $0.dataSource = self
            $0.delegate = self
            $0.showsHorizontalScrollIndicator = false
            
            $0.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        }
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpView() {
        contentView.addSubview(label)
        contentView.addSubview(subLabel)
        contentView.addSubview(collectionView)
    }
    func setUpConstraint() {
        label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(24)
        }
        subLabel.snp.makeConstraints { make in
            make.leading.equalTo(label.snp.leading)
            make.top.equalTo(label.snp.bottom).offset(4)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.equalTo(subLabel.snp.leading)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(subLabel.snp.bottom).offset(16)
        }
    }
}
// MARK: 메인페이지의 콜렉션뷰를 갖고있는 테이블뷰의 CollectionView delegate
extension MainCollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier,
                                                            for: indexPath)
                as? MainCollectionViewCell else{ fatalError() }
        return cell
    }
}

//
//  CategoryBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/09.
//

import UIKit
import SnapKit


class CategoryBottomSheet: SheetViewController {
    
    //MARK: - Properties
    
    var categorySelectHandler : ((_ category: String) -> Void)!
    
    var currentCategory: Int?

    var collectionView : UICollectionView!
    
    var service: ServiceType!
    
    //MARK: - LifeCycle
    
    init(service: ServiceType){
        self.service = service
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.bottomSheetType = .Category
        
        self.titleLabel.text = "카테고리"
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()) .then{
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 16
            
            let width = UIScreen.main.bounds.size.width - 40
            flowLayout.itemSize = CGSize(width: width/4, height: (width/4)/80*96)
            
            $0.collectionViewLayout = flowLayout
            $0.dataSource = self
            $0.delegate = self
            $0.showsVerticalScrollIndicator = false
            $0.isScrollEnabled = false
            
            $0.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.cellIdentifier)
            
        }

        setUpView()
        setUpConstraint()
        
    }
    
    //MARK: - ViewSetting
    
    func setUpView(){
        self.view.addSubview(collectionView)
    }
    
    func setUpConstraint(){
        
        self.collectionView.snp.makeConstraints{ make in
            make.top.equalTo(super.titleLabel.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

    }
}

extension CategoryBottomSheet: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return service == .Zatch ? 15 : 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? CategoryCollectionViewCell else { fatalError() }
        
        let category = self.service.getCategoryFromCategories(at: indexPath.row)
        
        cell.categoryText.text = category.title
        cell.categoryImage.image = category.image
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categorySelectHandler(self.service.getCategoryFromCategories(at: indexPath.row).title)
        self.dismiss(animated: true, completion: nil)
    }
}

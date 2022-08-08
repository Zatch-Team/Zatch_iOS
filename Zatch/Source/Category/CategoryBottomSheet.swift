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
    
    static let categoryTitle = ["음식|조리","음식|비조리","생활용품","가구/인테리어","디지털기기","잡화","의류","뷰티/미용","도서/문구류",
                                  "문화생활","게임/취미","스포츠/레저","반려동물","식물/원예","차량용품","기타물품"]
    
    static let categoryImage = [UIImage(named: "Image-0"),UIImage(named: "Image-1"),UIImage(named: "Image-2"),UIImage(named: "Image-3"),UIImage(named: "Image-4"),UIImage(named: "Image-5"),UIImage(named: "Image-6"),UIImage(named: "Image-7"),UIImage(named: "Image-8"),UIImage(named: "Image-9"),UIImage(named: "Image-10"),UIImage(named: "Image-11"),UIImage(named: "Image-12"),UIImage(named: "Image-13"),UIImage(named: "Image-14"),UIImage(named: "Image-15"),UIImage(named: "Image-16")]
    
    var categorySelectHandler : ((_ category: String) -> Void)?
    
    var currentCategory: Int?
    
    //MARK: - UI
    
    let titleLabel = UILabel().then{
        $0.text = "카테고리"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    var collectionView : UICollectionView!
    

    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        
        super.sheetType = .Category
        
        super.viewDidLoad()

        self.view.backgroundColor = .white
    
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()) .then{
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.minimumInteritemSpacing = 0
            flowLayout.minimumLineSpacing = 10
            
            
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
        self.view.addSubview(titleLabel)
        self.view.addSubview(collectionView)
    }
    
    func setUpConstraint(){
        
        self.titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
        
        self.collectionView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-12)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

    }
}

extension CategoryBottomSheet: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.cellIdentifier, for: indexPath) as? CategoryCollectionViewCell else{
            fatalError()
        }
        cell.categoryText.text = CategoryBottomSheet.categoryTitle[indexPath.row]
        
        cell.categoryImage.image = CategoryBottomSheet.categoryImage[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        self.dismiss(animated: true, completion: nil)
        categorySelectHandler!(CategoryBottomSheet.categoryTitle[indexPath.row])
    }
    
    
}

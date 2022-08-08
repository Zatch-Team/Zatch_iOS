//
//  SearchTagBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/07.
//

import UIKit

class SearchTagBottomSheet: SheetViewController {
    
    //MARK: - Properties
    
    var tagData : [String]!
    
    var currentTag: Int?
    
    var selectCompleteHandelr: ((String, Int) -> ())? //선택한 Tag 데이터 전달

    //MARK: - UI
    let titleLabel = UILabel().then{
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        
        super.sheetType = .SearchTag
        
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
            
            let flexLayout = LeftAlignCollectionViewFlowLayout()
            flexLayout.minimumLineSpacing = 16
            flexLayout.minimumInteritemSpacing = 8
            
            $0.collectionViewLayout = flexLayout

        }
        
        setUpView()
        setUpConstraint()

    }
    
    //MARK: - Helper
    func setUpView(){
        self.view.addSubview(titleLabel)
        self.view.addSubview(collectionView)
    }
    
    func setUpConstraint(){
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        
        collectionView.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(55)
            make.leading.equalToSuperview().offset(33)
            make.trailing.equalToSuperview().offset(-33)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
}


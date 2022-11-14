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
    
    var collectionView : UICollectionView!
    
    override func viewDidLoad() {
        
        super.sheetSize = .SearchTag
        
        super.viewDidLoad()
        
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
        self.view.addSubview(collectionView)
    }
    
    func setUpConstraint(){
        
        collectionView.snp.makeConstraints{ make in
            make.top.equalTo(super.titleLabel.snp.bottom).offset(55)
            make.leading.equalToSuperview().offset(33)
            make.trailing.equalToSuperview().offset(-33)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
}


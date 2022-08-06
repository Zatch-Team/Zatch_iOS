//
//  SearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/04/30.
//

import UIKit
import SnapKit

class MySearchViewController: BaseViewController{
    
    //MARK: - Properties
    var currentSelected: SearchVCCheckBox?
    
    let myZatchData: [String] = ["몰랑이 피규어","매일우유 250ml","콜드브루 60ml","예시가 있다면","이렇게 들어가야","해요요요요","해요요요","해요요","해요","해","아아앙아ㅏ앙아아앙아아"]
    
    var currentSelect: Int = -1
    
    //MARK: UIComponent
    
    let topView = TitleView().then{
        $0.titleLabel.text = "내가 교환할 재치를\n입력해주세요."
    }
    
    //selectFrame
    let selectFrame = UIView()
    
    let selectTextField = UILabel().then{
        $0.textAlignment = .center
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    let searchImage = UIImageView().then{
        $0.image = UIImage(named: "search")
    }
    
    let underLine = UIView().then{
        $0.backgroundColor = .black85
    }
    
    //
    let subTitle = UILabel().then{
        $0.text = "나의 재치"
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
    }
    
    let nextButton = PurpleButton().then{
        $0.setTitle("다음으로", for: .normal)
        $0.addTarget(self, action: #selector(nextButtonClick(_:)), for: .touchUpInside)
    }
    
    let skipButton = UIButton().then{
        $0.setTitle("건너뛰기", for: .normal)
        $0.setTitleColor(.black45, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(size: 12, family: .Medium)
    }
    
    var collectionView : UICollectionView!
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
            
            let layout = LeftAlignCollectionViewFlowLayout()
            layout.minimumLineSpacing = 12
            layout.minimumInteritemSpacing = 8
//            layout.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
            
            $0.delegate = self
            $0.dataSource = self
            
            $0.collectionViewLayout = layout
            
            $0.register(MySearchTagCollectionViewCell.self, forCellWithReuseIdentifier: MySearchTagCollectionViewCell.cellIdentifier)
        }
        
        setUpView()
        setUpConstraints()
        
    }
    
    //MARK: Action
    
    @objc
    func nextButtonClick(_ sender: UIButton){
        let nextVC = FindSearchViewController()
        nextVC.myLabel.text = selectTextField.text
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension MySearchViewController: CellCalledViewController{
    
    func newCellIsSelected(_ indexPath: IndexPath){
        if let currentTag = collectionView.cellForItem(at: [0, currentSelect]) as? MySearchTagCollectionViewCell {
            currentTag.setBtnInitState()
        }
        
        if(currentSelect == indexPath.row){
            currentSelect = -1
            selectTextField.text = ""
        }else{
            if let newTag = collectionView.cellForItem(at: indexPath) as? MySearchTagCollectionViewCell{
                newTag.setBtnSelectedState()
                selectTextField.text = myZatchData[indexPath.row]
                currentSelect = indexPath.row
            }
        }
    }
    
    func newCellIsSelected(_ cell: UICollectionViewCell) { }
}

extension MySearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myZatchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MySearchTagCollectionViewCell.cellIdentifier,
                                                            for: indexPath)
                as? MySearchTagCollectionViewCell else{ fatalError() }
        
        cell.delegate = self
        cell.selectBtn.setTitle(myZatchData[indexPath.row], for: .normal)
        cell.setBtnInitState()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let tmpLabel = UILabel().then{
            $0.text = myZatchData[indexPath.row]
            $0.numberOfLines = 1
            $0.sizeToFit()
        }

        let width = tmpLabel.frame.size.width
        
        let adjustWidth = myZatchData[indexPath.row].count < 6 ? width + 18 : width
        
        return CGSize(width: adjustWidth, height: 28)
    }
}

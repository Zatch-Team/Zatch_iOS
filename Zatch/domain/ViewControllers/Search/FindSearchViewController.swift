//
//  SecondSearchViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit
import SnapKit

class FindSearchViewController: BaseViewController {
    
    //MARK: - Properties
    
    let popularData : [String] = ["몰랑이","몰랑몰랑","몰랑","말랑이","말랭"]
    let findData : [String] = ["몰랑이","몰랑몰랑","몰랑","말랑이","말랭"]
    
    var currentSelect: SearchTagCollectionViewCell?
    
    //MARK: - UI
    
    let titleView = TitleView().then{
        $0.titleLabel.text = "무엇을 찾고 있나요?"
        $0.titleLabel.font = UIFont.pretendard(size: 20, family: .Bold)
    }
    
    //
    let exchangeFrame = UIView()
    
    let myLabel = UILabel().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black85
        $0.numberOfLines = 1
        $0.textAlignment = .center
    }
    
    let exchangeImage = UIImageView().then{
        $0.image = UIImage(named: "exchange_vertical")
    }
    
    let wantTextField = UITextField().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black85
        $0.textAlignment = .center
    }
    
    let textFieldBorderLine = UIView().then{
        $0.backgroundColor = .black85
    }
    
    let searchImage = UIImageView().then{
        $0.image = UIImage(named: "search")
    }
    
    //
    let subTitle1 = UILabel().then{
        $0.text = "가장 인기있는 재치"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
    }
    
    let firstCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        
        let flexLayout = UICollectionViewFlowLayout()
        flexLayout.scrollDirection = .horizontal
        flexLayout.minimumInteritemSpacing = 8
        
        $0.collectionViewLayout = flexLayout
        
        $0.register(FindSearchTagCollectionViewCell.self, forCellWithReuseIdentifier: FindSearchTagCollectionViewCell.cellIdentifier)
    }
    
    let subTitle2 = UILabel().then{
        $0.text = "내가 찾는 재치"
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 15, family: .Bold)
    }
    
    let secondCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        
        let flexLayout = UICollectionViewFlowLayout()
        flexLayout.scrollDirection = .horizontal
        flexLayout.minimumInteritemSpacing = 8
        
        $0.collectionViewLayout = flexLayout
        
        $0.register(FindSearchTagCollectionViewCell.self, forCellWithReuseIdentifier: FindSearchTagCollectionViewCell.cellIdentifier)
    }
    
    let nextButton = Purple36Button(title: "검색하기").then{
        $0.addTarget(self, action: #selector(moveToResultVC(_:)), for: .touchUpInside)
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        setUpView()
        setConstraints()
        
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
    }
    
    
    //MARK: Action
    @objc
    func popToSearchVC(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func moveToResultVC(_ sender: UIButton){
        let nextVC = ResultSearchViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}

extension FindSearchViewController: CellCalledViewController{
    
    func newCellIsSelected(_ cell: UICollectionViewCell){
        if(currentSelect == cell){
            currentSelect?.setBtnInitState()
            currentSelect = nil
            wantTextField.text = ""
        }else{
            if let newCell = cell as? FindSearchTagCollectionViewCell {
                
                newCell.setBtnSelectedState()
                
                wantTextField.text = newCell.selectBtn.title(for: .normal)
                
                currentSelect?.setBtnInitState()
                currentSelect = newCell
            }
        }
    }
    
    func newCellIsSelected(_ indexPath: IndexPath) { }
}

extension FindSearchViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == firstCollectionView ? popularData.count : findData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FindSearchTagCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? FindSearchTagCollectionViewCell else { fatalError()}
        
        let title = collectionView == firstCollectionView ? popularData[indexPath.row] : findData[indexPath.row]
        
        cell.delegate = self
        cell.selectBtn.setTitle(title, for: .normal)
        cell.setBtnInitState()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let title = collectionView == firstCollectionView ? popularData[indexPath.row] : findData[indexPath.row]
        
        let tmpLabel = UILabel().then{
            $0.text = title
            $0.numberOfLines = 1
            $0.sizeToFit()
        }

        let width = tmpLabel.frame.size.width
        
        let adjustWidth = title.count < 6 ? width + 18 : width
        
        return CGSize(width: adjustWidth, height: 28)
    }
    
}

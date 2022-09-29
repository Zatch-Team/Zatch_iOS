//
//  MySearchView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/29.
//

import UIKit

class MySearchView: UIView {
    
    //MARK: UI
    
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
    
    lazy var nextButton = Purple36Button(title: "다음으로")
    
    lazy var skipButton = UIButton().then{
        $0.setTitle("건너뛰기", for: .normal)
        $0.setTitleColor(.black45, for: .normal)
        $0.titleLabel?.font = UIFont.pretendard(size: 12, family: .Medium)
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        
        let layout = LeftAlignCollectionViewFlowLayout()
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 8
        
        $0.collectionViewLayout = layout
        
        $0.register(MySearchTagCollectionViewCell.self, forCellWithReuseIdentifier: MySearchTagCollectionViewCell.cellIdentifier)
    }
    
    override init(frame: CGRect){
        super.init(frame: .zero)
        
        setUpView()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.addSubview(topView)
        
        self.addSubview(selectFrame)
        self.selectFrame.addSubview(selectTextField)
        self.selectFrame.addSubview(underLine)
        self.selectFrame.addSubview(searchImage)
        
        self.addSubview(subTitle)
        self.addSubview(collectionView)
        self.addSubview(nextButton)
        self.addSubview(skipButton)
    }
    
    func setUpConstraints(){
        
        self.topView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(88)
            make.leading.trailing.equalToSuperview()
        }
        
        //selectFrame
        self.selectFrame.snp.makeConstraints{ make in
            make.height.equalTo(122)
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        self.selectTextField.snp.makeConstraints{ make in
            make.height.equalTo(44)
            make.top.equalToSuperview().offset(54)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }

        self.searchImage.snp.makeConstraints{ make in
            make.width.height.equalTo(24)
            make.trailing.equalToSuperview().offset(-48)
            make.bottom.equalTo(underLine).offset(-8)
            make.top.equalToSuperview().offset(62)
        }
        
        self.underLine.snp.makeConstraints{ make in
//            make.top.equalTo(selectTextField.snp.bottom).offset(8)
            make.top.equalTo(selectTextField.snp.bottom)
            make.height.equalTo(1.5)
            make.leading.equalTo(selectTextField)
            make.trailing.equalTo(selectTextField)
        }
        
        
        //
        self.subTitle.snp.makeConstraints{ make in
            make.top.equalTo(underLine.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(20)
        }
        
        self.collectionView.snp.makeConstraints{ make in
            make.top.equalTo(subTitle.snp.bottom).offset(16)
            make.bottom.equalTo(nextButton.snp.top).offset(-16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        self.nextButton.snp.makeConstraints{ make in
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-54)
            make.leading.equalToSuperview().offset(74)
            make.trailing.equalToSuperview().offset(-74)
        }
        
        self.skipButton.snp.makeConstraints{ make in
            make.top.equalTo(nextButton.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide).offset(-26)
        }
    }
}

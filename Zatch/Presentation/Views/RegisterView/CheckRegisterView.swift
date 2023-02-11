//
//  CheckRegisterView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/23.
//

import UIKit

class CheckRegisterView: BaseView {
    
    init(infoView: BaseView){
        self.infoFrame = infoView
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Properties

    static let placeHolder = "추가 설명이 필요하다면 여기에 적어주세요."

    //MARK: - UI
    
    let titleView = TitleView().then{
        $0.titleLabel.text = "이렇게 재치를\n업로드해도 괜찮을까요?"
    }

    let photoFrame = UIView()
    let photoTitle = UILabel().then{
        $0.text = "사진"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    let photoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: 84, height: 84)
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.scrollDirection = .horizontal

        $0.collectionViewLayout = flowLayout
        $0.showsHorizontalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 20)

        $0.register(ImageRegisterCollectionViewCell.self, forCellWithReuseIdentifier: ImageRegisterCollectionViewCell.cellIdentifier)
    }

    let infoFrame: BaseView
    
    let addTitle = UILabel().then{
        $0.text = "추가 설명"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    let addExplainTextView = UITextView().then{
        $0.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 8

        $0.text = CheckRegisterView.placeHolder
        $0.setTextWithLineHeight(lineHeight: 15.6)
        $0.textColor = .black20
        $0.font = UIFont.pretendard(size: 12, family: .Medium)
        $0.textContainerInset = UIEdgeInsets(top: 23, left: 17, bottom: 23, right: 25)
    }

    lazy var registerBtn = Purple36Button(title: "재치 등록").then{
        $0.setTitle("재치 등록", for: .normal)
    }
    
    override func hierarchy(){
        self.addSubview(titleView)
        self.addSubview(registerBtn)
        self.addSubview(photoFrame)
        self.addSubview(infoFrame)

        self.photoFrame.addSubview(photoTitle)
        self.photoFrame.addSubview(photoCollectionView)

        self.addSubview(addTitle)
        self.addSubview(addExplainTextView)
    }

    override func layout(){

        titleView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
        }

        photoFrame.snp.makeConstraints{ make in
            make.top.equalTo(titleView.snp.bottom)
            make.leading.equalToSuperview()
            make.height.equalTo(129)
            make.trailing.equalToSuperview()
        }
        photoTitle.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(36)
            make.top.equalToSuperview().offset(9)
            make.height.equalTo(17)
        }
        photoCollectionView.snp.makeConstraints{ make in
            make.top.equalTo(photoTitle.snp.bottom).offset(19)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(84)
            make.bottom.equalToSuperview()
        }

        infoFrame.snp.makeConstraints{ make in
            make.top.equalTo(photoFrame.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(166)
        }

        addTitle.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(36)
            make.top.equalTo(infoFrame.snp.bottom).offset(18)
            make.height.equalTo(17)
        }
        addExplainTextView.snp.makeConstraints{ make in
            make.top.equalTo(addTitle.snp.bottom).offset(11)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-157)
        }

        registerBtn.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-38)
            make.leading.equalToSuperview().offset(74)
            make.trailing.equalToSuperview().offset(-74)
        }
    }
}

extension CheckRegisterView{
    
    class MyProductDetailView: UIStackView{
        
        let endDateFrame = MyProductInfoStackView(title: "유통기한")
        let buyDateFrame = MyProductInfoStackView(title: "구매 일자")
        let countFrame = MyProductInfoStackView(title: "수량")
        let openFrame = MyProductInfoStackView(title: "개봉 상태")
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            hierarchy()
            style()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func hierarchy(){
            self.addArrangedSubview(endDateFrame)
            self.addArrangedSubview(buyDateFrame)
            self.addArrangedSubview(countFrame)
            self.addArrangedSubview(openFrame)
        }
        
        private func style(){
            self.axis = .vertical
            self.spacing = 8
            self.alignment = .leading
        }
    }
}

extension CheckRegisterView.MyProductDetailView{
    
    class MyProductInfoStackView: UIStackView{
        
        private let titleLabel = UILabel().then{
            $0.setTypoStyleWithSingleLine(typoStyle: .bold12)
            $0.textColor = .black85
        }
        private let infoLabel = UILabel().then{
            $0.setTypoStyleWithSingleLine(typoStyle: .medium12)
            $0.textColor = .black85
            $0.text = "2022/02/03"
        }
        
        init(title: String){
            self.titleLabel.text = title
            super.init(frame: .zero)
            style()
            layout()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func style(){
            self.spacing = 10
            self.axis = .horizontal
        }
        
        private func layout(){
            self.addArrangedSubview(titleLabel)
            self.addArrangedSubview(infoLabel)
            
            titleLabel.snp.makeConstraints{
                $0.width.equalTo(47)
            }
        }
        
        func setInfo(value: String){
            infoLabel.text = value
        }
        
    }
}

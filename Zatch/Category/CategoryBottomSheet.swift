//
//  CategoryBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/09.
//

import UIKit
import MaterialComponents
import SnapKit
import FlexLayout
import PinLayout


class CategoryBottomSheet: UIViewController {
    
    //MARK: - Properties
    
    let titleLabel = UILabel()
    let flexContainer = UIView()
    
    let categoryData: [String] = ["음식|조리","음식|비조리","생활용품","가구/인테리어","디지털기기","잡화","의류","뷰티/미용","도서/문구류",
                                  "문화생활","게임/취미","스포츠/레저","반려동물","식물/원예","차량용품","기타물품"]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.view.backgroundColor = .white

        setUpValue()
        setUpView()
        setUpConstraint()
        
    }
    
    override func viewDidLayoutSubviews() {
        flexContainer.pin.layout()
        flexContainer.flex.layout()
    }
    
    //MARK: - ViewSetting

    func setUpValue(){
        
        titleLabel.text = "카테고리"
        titleLabel.textColor = .black85
        titleLabel.font = UIFont.pretendard(size: 16, family: .Bold)
    
    }
    
    func setUpView(){
        
        self.view.addSubview(titleLabel)
        self.view.addSubview(flexContainer)
    
    }
    
    func setUpConstraint(){
        
        self.titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
        
        self.flexContainer.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(36)
            make.bottom.equalToSuperview().offset(-16)
            make.width.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        let buttonWidth = (view.frame.width - 40) / 4
        print(buttonWidth)
        
        flexContainer.flex.direction(.row).define { flex in
            for i in categoryData{
                let button = CategoryButtonView()
                button.snp.makeConstraints{ make in
                    make.width.equalTo(buttonWidth)
                    button.categoryImage.snp.makeConstraints{ make in
                        make.height.equalTo(buttonWidth-20)
                    }
                }
                button.categoryText.text = i
                button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectCategoryItem)))
                flex.addItem(button).marginBottom(16)
            }
        }
        
    }
    
    //MAKR: - Action
    
    @objc
    func selectCategoryItem(){
        
    }
    
}

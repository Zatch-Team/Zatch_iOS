//
//  CategoryBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/09.
//

import UIKit
import SnapKit


class CategoryBottomSheet: UIViewController {
    
    //MARK: - Properties
    
    let titleLabel = UILabel()
    let flexContainer = UIView()
    
    let categoryData: [String] = ["음식|조리","음식|비조리","생활용품","가구/인테리어","디지털기기","잡화","의류","뷰티/미용","도서/문구류",
                                  "문화생활","게임/취미","스포츠/레저","반려동물","식물/원예","차량용품","기타물품"]
    
    var buttonList: [CategoryButtonView] = []
    
    var categorySelect : ((_ category: String) -> Void)?
    
    let label = UILabel()
    
    let label1 = UILabel()
    
    let label2 = UILabel()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.view.backgroundColor = .white

        setUpValue()
        setUpView()
        setUpConstraint()
        
    }
    
    //MARK: - ViewSetting

    func setUpValue(){
        
        titleLabel.text = "카테고리"
        titleLabel.textColor = .black85
        titleLabel.font = UIFont.pretendard(size: 16, family: .Bold)
        
        label.text = "fuckck"
        label.backgroundColor = .blue
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectCategoryItem)))
        
        label1.text = "fuckck"
        label1.backgroundColor = .purple
        label1.isUserInteractionEnabled = true
        label1.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectCategoryItem)))
        
        label2.text = "fuckck"
        label2.backgroundColor = .red
        label2.isUserInteractionEnabled = true
        label2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectCategoryItem)))
    
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
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top).offset(-16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        setUpCategoryButton()
        
//        flexContainer.flex.addItem().direction(.row).wrap(.wrap).define { flex in
//            buttonList.forEach{ button in
//                print(button.categoryText.text)
//                flex.addItem(button).marginBottom(16)
//            }
//        }
        
//        flexContainer.flex.addItem().direction(.row).define{flex in
//
//            flex.addItem(label)
//            flex.addItem(label1)
//            flex.addItem(label2)
//        }
        
    }
    
    func setUpCategoryButton(){
        categoryData.forEach{ data in
            
            let button = CategoryButtonView()
            
            let buttonWidth = (view.frame.width - 40) / 4
            
            button.categoryText.text = data
            
            button.snp.makeConstraints{ make in
                make.width.equalTo(buttonWidth)
                button.categoryImage.snp.makeConstraints{ make in
                    make.height.equalTo(buttonWidth-20)
                }
            }
//            button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectCategoryItem(_:))))
            buttonList.append(button)
        }
    }
    
    //MAKR: - Action
    
    @objc
    func selectCategoryItem(_ gesture: UITapGestureRecognizer){
        
        guard let category = (gesture.view as? UILabel)?.text else{
            fatalError("category label error")
        }
        
        self.categorySelect!(category)
        
        dismiss(animated: true, completion: nil)
        
    }
    
}

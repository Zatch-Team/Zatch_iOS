//
//  SearchResultViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    //MARK: UIComponent
    
    let backButton = NavigationBackButton()
    let topView = UIView()
    let myZatch = UILabel()
    let wantZatch = UILabel()
    let exchangeImage = UIImageView()
    let myCategoryButton = SearchCategoryDot()
    let wantCategoryButton = SearchCategoryDot()
    let townSelected = UILabel()
    let searchFilter = UILabel()
    let tableView = UITableView()
    let myStackView = UIStackView()
    let wantStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        
        backButton.target = self
        backButton.action = #selector(popNavigationVC)
        self.navigationItem.setLeftBarButton(backButton, animated: true)
        
        setUpValue()
        setUpView()
        setUpConstraint()
        
    }
    
    func setUpValue(){
        
        myZatch.text = "생수"
        myZatch.textAlignment = .right
        myZatch.textColor = .black85
        myZatch.font = UIFont.pretendard(size: 16, family: .Bold)
        
        wantZatch.text = "라면"
        wantZatch.textColor = .black85
        wantZatch.font = UIFont.pretendard(size: 16, family: .Bold)
        
        exchangeImage.image = UIImage(named: "exchange_vertical")
        
        myStackView.axis = .vertical
        myStackView.spacing = 12
        
        wantStackView.axis = .vertical
        wantStackView.spacing = 12
    }

    func setUpView(){

        self.view.addSubview(topView)
        
        self.topView.addSubview(myStackView)
        self.topView.addSubview(exchangeImage)
        self.topView.addSubview(wantStackView)
        
        self.myStackView.addArrangedSubview(myCategoryButton)
        self.myStackView.addArrangedSubview(myZatch)
    
        self.wantStackView.addArrangedSubview(wantCategoryButton)
        self.wantStackView.addArrangedSubview(wantZatch)
        
    }
    
    func setUpConstraint(){
     
        self.topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(116)
            make.width.equalToSuperview()
        }
    
        self.exchangeImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.myStackView.snp.makeConstraints { make in
            make.trailing.equalTo(exchangeImage.snp.leading).offset(-12)
            make.bottom.equalTo(exchangeImage)
        }

        self.wantStackView.snp.makeConstraints { make in
            make.leading.equalTo(exchangeImage.snp.trailing).offset(12)
            make.bottom.equalTo(exchangeImage)
        }
        
    }
    
    //MARK: Action
    @objc
    func popNavigationVC(){
        self.navigationController?.popViewController(animated: true)
    }

}

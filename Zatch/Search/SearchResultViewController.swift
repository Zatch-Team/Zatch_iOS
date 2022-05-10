//
//  SearchResultViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit
import MaterialComponents

class SearchResultViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: UIComponent
    
    let backButton = NavigationBackButton()
    let topView = UIView()
    let separateLine = UIView()
    let separateRectangle = UIView()
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
        
        self.navigationItem.setLeftBarButton(backButton, animated: true)
        
        setUpValue()
        setUpView()
        setUpConstraint()
        setUpAction()
        
    }
    
    func setUpValue(){
        
        myZatch.text = "생수"
        myZatch.textAlignment = .right
        myZatch.textColor = .black85
        myZatch.font = UIFont.pretendard(size: 16, family: .Bold)
        myZatch.isUserInteractionEnabled = true
        
        wantZatch.text = "라면"
        wantZatch.textColor = .black85
        wantZatch.font = UIFont.pretendard(size: 16, family: .Bold)
        wantZatch.isUserInteractionEnabled = true
        
        exchangeImage.image = UIImage(named: "exchange_vertical")
        
        myStackView.axis = .vertical
        myStackView.spacing = 12
        
        wantStackView.axis = .vertical
        wantStackView.spacing = 12
        
        separateLine.backgroundColor = .black10
        separateRectangle.backgroundColor = .black5
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.allowsSelection = false
        tableView.register(ResultTableViewCell.self, forCellReuseIdentifier: "ResultTableViewCell")
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
        
        self.view.addSubview(tableView)
        self.view.addSubview(separateLine)
        self.view.addSubview(separateRectangle)
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
        
        self.separateLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        self.separateRectangle.snp.makeConstraints{ make in
            make.height.equalTo(8)
            make.top.equalTo(separateLine.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        self.tableView.snp.makeConstraints{ make in
            make.top.equalTo(separateRectangle.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    func setUpAction(){
        
        backButton.target = self
        backButton.action = #selector(popNavigationVC)
        
        myZatch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openProductBottomSheet)))
        
        wantZatch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openProductBottomSheet)))
        
//        let categoryTapGesture = UITapGestureRecognizer(target: self, action: #selector(openCategoryBottomSheet))
        myCategoryButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCategoryBottomSheet)))
        wantCategoryButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCategoryBottomSheet)))

    }
    
    //MARK: Action
    
    @objc
    func popNavigationVC(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func openProductBottomSheet(recognizer: UITapGestureRecognizer){
        let bottoSheetVC = MDCBottomSheetController(contentViewController: MyZatchBottomSheet())
        present(bottoSheetVC, animated: true, completion: nil)
    }
    
    @objc
    func openCategoryBottomSheet(recognizer: UITapGestureRecognizer){
        
        let vc = CategoryBottomSheet()
        
        vc.categorySelect = { category in
            print(category)
            (recognizer.view as? SearchCategoryDot)?.isChecked = true
        }
        
        let bottoSheetVC = MDCBottomSheetController(contentViewController: vc)
        
        present(bottoSheetVC, animated: true, completion: nil)
    }

}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
}

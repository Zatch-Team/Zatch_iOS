//
//  SearchResultViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit

class ResultSearchViewController: BaseViewController, UIGestureRecognizerDelegate {
    
    //MARK: - Properties
    var myZatchIndex: Int?
    var wantZatchIndex: Int?
    
    //MARK: UIComponent
    
    let topView = UIView()
    
    let separateLine = UIView().then{
        $0.backgroundColor = .black10
    }
    
    let separateRectangle = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let myStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .trailing
        $0.spacing = 14
    }
    
    let myCategoryButton = SearchCateogryDotButton()
    
    lazy var myZatch = UILabel().then{
        $0.numberOfLines = 1
        $0.textAlignment = .right
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openMyZatchBottomSheet)))
    }
    
    let wantStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 14
    }
    
    let wantCategoryButton = SearchCateogryDotButton()
    
    lazy var wantZatch = UILabel().then{
        $0.numberOfLines = 1
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openWantZatchBottomSheet)))
    }
    
    let exchangeImage = UIImageView().then{
        $0.image = UIImage(named: "exchange_vertical")
    }
    
    let townFrame = UIStackView().then{
        $0.spacing = 4
        $0.axis = .horizontal
    }
    let townSelectedLabel = UILabel().then{
        $0.text = "홍제동"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
    }
    let townSelectArrow = UIImageView().then{
        $0.image = UIImage(named: "arrow_down")
    }
    
    let searchFrame = UIStackView().then{
        $0.spacing = 4
        $0.axis = .horizontal
    }
    let searchFilterLabel = UILabel().then{
        $0.text = "검색 필터"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
    }
    let searchFilterImage = UIImageView().then{
        $0.image = UIImage(named: "search_filter")
    }
    
    let tableView = UITableView().then{
        $0.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        $0.register(ResultTableViewCell.self, forCellReuseIdentifier: "ResultTableViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        setUpView()
        setUpConstraint()
        setUpAction()
        
    }
    
    func setUpAction(){
        
    
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
    func openMyZatchBottomSheet(recognizer: UITapGestureRecognizer){
        let bottomSheet = MyZatchBottomSheet()
        bottomSheet.currentTag = myZatchIndex
        
        bottomSheet.selectCompleteHandelr = { text, index in
            self.myZatch.text = text
            self.myZatchIndex = index
        }
        
        bottomSheet.loadViewIfNeeded()
        present(bottomSheet, animated: true, completion: nil)
    }
    
    @objc
    func openWantZatchBottomSheet(recognizer: UITapGestureRecognizer){
        let bottomSheet = WantZatchBottomSheet()
        bottomSheet.currentTag = wantZatchIndex
        
        bottomSheet.selectCompleteHandelr = { text, index in
            self.wantZatch.text = text
            self.wantZatchIndex = index
        }
        bottomSheet.loadViewIfNeeded()
        present(bottomSheet, animated: true, completion: nil)
    }
    
    @objc
    func openCategoryBottomSheet(recognizer: UITapGestureRecognizer){
        
        let vc = CategoryBottomSheet()
        
//        vc.categorySelect = { category in
//            print(category)
//            (recognizer.view as? SearchCategoryDot)?.isChecked = true
//        }
        
//        let bottoSheetVC = MDCBottomSheetController(contentViewController: vc)
        
        vc.loadViewIfNeeded()
        present(vc, animated: true, completion: nil)
    }

}

extension ResultSearchViewController: UITableViewDelegate, UITableViewDataSource{
    
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

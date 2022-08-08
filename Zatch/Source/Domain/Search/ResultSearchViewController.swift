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
    
    lazy var myCategoryButton = SearchCateogryDotButton().then{
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCategoryBottomSheet)))
    }
    
    lazy var myZatch = UILabel().then{
        $0.numberOfLines = 1
        $0.textAlignment = .right
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openMyZatchBottomSheet)))
        $0.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(textFieldDidPressedLong)))
    }
    
    lazy var myZatchTextField = UITextField().then{
        $0.isHidden = true
        $0.textAlignment = .center
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.addPadding()
        $0.tintColor = .black10
        $0.returnKeyType = .done
        
        $0.layer.cornerRadius = 14
        $0.backgroundColor = .white
        $0.layer.shadowRadius = 5.0
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.masksToBounds = false
    }
    
    let wantStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = 14
    }
    
    lazy var wantCategoryButton = SearchCateogryDotButton().then{
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCategoryBottomSheet)))
    }
    
    lazy var wantZatch = UILabel().then{
        $0.numberOfLines = 1
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.isUserInteractionEnabled = true
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openWantZatchBottomSheet)))
        $0.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(textFieldDidPressedLong)))
    }
    
    lazy var wantZatchTextField = UITextField().then{
        $0.isHidden = true
        $0.textAlignment = .center
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.addPadding()
        $0.tintColor = .black10 //cursor 색상
        $0.returnKeyType = .done
        
        $0.layer.cornerRadius = 14
        $0.backgroundColor = .white
        $0.layer.shadowRadius = 5.0
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.masksToBounds = false
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

        myZatchTextField.delegate = self
        wantZatchTextField.delegate = self
        
        setUpView()
        setUpConstraint()
    }
    
    //TextField 입력 끝나거나 취소됐을 경우
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        myZatchTextField.isHidden = true
        wantZatchTextField.isHidden = true
        
        myZatch.isHidden = false
        wantZatch.isHidden = false
        
        self.view.endEditing(true)
    }
    
    //MARK: Action
    
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
        
        vc.categorySelectHandler = { category in
            print(category)
            (recognizer.view as? SearchCateogryDotButton)?.isSelected = true
        }
        
        vc.loadViewIfNeeded()
        present(vc, animated: true, completion: nil)
    }
    
    @objc
    func textFieldDidPressedLong(_ recognizer : UIGestureRecognizer){
        
        //기존 입력값 초기화
        myZatchTextField.text = nil
        wantZatchTextField.text = nil
        
        myZatchTextField.placeholder = myZatch.text
        wantZatchTextField.placeholder = wantZatch.text
        
        myZatchTextField.setPlaceholderColor(.black10)
        wantZatchTextField.setPlaceholderColor(.black10)
        
        myZatchTextField.isHidden = false
        wantZatchTextField.isHidden = false
        
        myZatch.isHidden = true
        wantZatch.isHidden = true
        
        //커서 올리기
        if(recognizer.view == wantZatch){
            wantZatchTextField.becomeFirstResponder()
        }else{
            myZatchTextField.becomeFirstResponder()
        }
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

extension ResultSearchViewController: UITextFieldDelegate{
    
    //return 키 클릭시 호출 메서드
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        myZatchTextField.isHidden = true
        wantZatchTextField.isHidden = true
        
        myZatch.isHidden = false
        wantZatch.isHidden = false
        
        if(textField == myZatchTextField){
            myZatch.text = myZatchTextField.text
        }else{
            wantZatch.text = wantZatchTextField.text
        }
        
        self.view.endEditing(true)
        return true
    }
}

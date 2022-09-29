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
    
    var resultData: [String] = []
    
    lazy var mainView = ResultSearchView().then{
        $0.myCategoryButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCategoryBottomSheet)))
        $0.myZatch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openMyZatchBottomSheet)))
        $0.myZatch.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(textFieldDidPressedLong)))
        
        $0.wantCategoryButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCategoryBottomSheet)))
        $0.wantZatch.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openWantZatchBottomSheet)))
        $0.wantZatch.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(textFieldDidPressedLong)))
        
        $0.townFrame.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(townFrameDidClicked)))
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    
        setUpDelegate()
        
        
        //api 연동시 위치 변경시키기
//        if(resultData.isEmpty){
//            emptyResultView.isHidden = false
//        }else{
        mainView.emptyResultView.isHidden = true
//        }
         
    }
    
    //TextField 입력 끝나거나 취소됐을 경우
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        mainView.myZatchTextField.isHidden = true
        mainView.wantZatchTextField.isHidden = true
        
        mainView.myZatch.isHidden = false
        mainView.wantZatch.isHidden = false
        
        self.view.endEditing(true)
    }
    
    //MARK: - Helper
    func setUpDelegate(){
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self

        mainView.myZatchTextField.delegate = self
        mainView.wantZatchTextField.delegate = self
        
    }
    
    //MARK: Action
    
    @objc
    func openMyZatchBottomSheet(recognizer: UITapGestureRecognizer){
        let bottomSheet = MyZatchBottomSheet()
        bottomSheet.currentTag = myZatchIndex
        
        bottomSheet.selectCompleteHandelr = { text, index in
            self.mainView.myZatch.text = text
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
            self.mainView.wantZatch.text = text
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
            (recognizer.view as? ResultSearchView.SearchCateogryDotButton)?.isSelected = true
        }
        
        vc.loadViewIfNeeded()
        present(vc, animated: true, completion: nil)
    }
    
    @objc
    func textFieldDidPressedLong(_ recognizer : UIGestureRecognizer){
        
        //기존 입력값 초기화
        mainView.myZatchTextField.text = nil
        mainView.wantZatchTextField.text = nil
        
        mainView.myZatchTextField.placeholder = mainView.myZatch.text
        mainView.wantZatchTextField.placeholder = mainView.wantZatch.text
        
        mainView.myZatchTextField.setPlaceholderColor(.black10)
        mainView.wantZatchTextField.setPlaceholderColor(.black10)
        
        mainView.myZatchTextField.isHidden = false
        mainView.wantZatchTextField.isHidden = false
        
        mainView.myZatch.isHidden = true
        mainView.wantZatch.isHidden = true
        
        //커서 올리기
        if(recognizer.view == mainView.wantZatch){
            mainView.wantZatchTextField.becomeFirstResponder()
        }else{
            mainView.myZatchTextField.becomeFirstResponder()
        }
    }
    
    @objc
    func townFrameDidClicked(){
        let vc = TownSettingBottomSheet()
        
        vc.townSelectHandelr = { town in
            print(town)
//            (recognizer.view as? SearchCateogryDotButton)?.isSelected = true
        }
        
        vc.loadViewIfNeeded()
        present(vc, animated: true, completion: nil)
    }

}

extension ResultSearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ResultTableViewCell", for: indexPath) as? ResultTableViewCell else{ fatalError() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ResultSearchViewController: UITextFieldDelegate{
    
    //return 키 클릭시 호출 메서드
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        mainView.myZatchTextField.isHidden = true
        mainView.wantZatchTextField.isHidden = true
        
        mainView.myZatch.isHidden = false
        mainView.wantZatch.isHidden = false
        
        if(textField == mainView.myZatchTextField){
            mainView.myZatch.text = mainView.myZatchTextField.text
        }else{
            mainView.wantZatch.text = mainView.wantZatchTextField.text
        }
        
        self.view.endEditing(true)
        return true
    }
}

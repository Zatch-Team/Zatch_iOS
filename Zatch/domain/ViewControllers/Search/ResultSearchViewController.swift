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
        $0.myZatchFrame.categortBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCategoryBottomSheet)))
        $0.myZatchFrame.productLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openMyZatchBottomSheet)))
        $0.myZatchFrame.productLabel.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(textFieldDidPressedLong)))
        
        $0.wantZatchFrame.categortBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCategoryBottomSheet)))
        $0.wantZatchFrame.productLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openWantZatchBottomSheet)))
        $0.wantZatchFrame.productLabel.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(textFieldDidPressedLong)))
        
        $0.townFrame.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(townFrameDidClicked)))
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(88)
            $0.leading.trailing.bottom.equalToSuperview()
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

        mainView.myZatchFrame.productTextField.isHidden = true
        mainView.wantZatchFrame.productTextField.isHidden = true
        
        mainView.myZatchFrame.productLabel.isHidden = false
        mainView.wantZatchFrame.productLabel.isHidden = false
        
        self.view.endEditing(true)
    }
    
    //MARK: - Helper
    func setUpDelegate(){
        
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self

        mainView.myZatchFrame.productTextField.delegate = self
        mainView.wantZatchFrame.productTextField.delegate = self
        
    }
    
    //MARK: Action
    
    @objc
    func openMyZatchBottomSheet(recognizer: UITapGestureRecognizer){
        let bottomSheet = MyZatchBottomSheet()
        bottomSheet.currentTag = myZatchIndex
        
        bottomSheet.selectCompleteHandelr = { text, index in
            self.mainView.myZatchFrame.productLabel.text = text
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
            self.mainView.wantZatchFrame.productLabel.text = text
            self.wantZatchIndex = index
        }
        bottomSheet.loadViewIfNeeded()
        present(bottomSheet, animated: true, completion: nil)
    }
    
    @objc
    func openCategoryBottomSheet(recognizer: UITapGestureRecognizer){
        
        let vc = CategoryBottomSheet(type: .Zatch)
        
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
        
        mainView.myZatchFrame.productTextField.text = nil
        mainView.wantZatchFrame.productTextField.text = nil

        mainView.myZatchFrame.productTextField.placeholder = mainView.myZatchFrame.productLabel.text
        mainView.wantZatchFrame.productTextField.placeholder = mainView.wantZatchFrame.productLabel.text

        mainView.myZatchFrame.productTextField.setPlaceholderColor(.black10)
        mainView.wantZatchFrame.productTextField.setPlaceholderColor(.black10)

        mainView.myZatchFrame.productTextField.isHidden = false
        mainView.wantZatchFrame.productTextField.isHidden = false

        mainView.myZatchFrame.productLabel.isHidden = true
        mainView.wantZatchFrame.productLabel.isHidden = true

        //커서 올리기
        if(recognizer.view == mainView.wantZatchFrame.productLabel){
            mainView.wantZatchFrame.productTextField.becomeFirstResponder()
        }else{
            mainView.myZatchFrame.productTextField.becomeFirstResponder()
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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyZatchTableViewCell", for: indexPath) as? MyZatchTableViewCell else{ fatalError() }
        cell.addHeartToCell(color: "yellow")
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
        
        mainView.myZatchFrame.productTextField.isHidden = true
        mainView.wantZatchFrame.productTextField.isHidden = true
        
        mainView.myZatchFrame.productLabel.isHidden = false
        mainView.wantZatchFrame.productLabel.isHidden = false
        
        if(textField == mainView.myZatchFrame.productTextField){
            mainView.myZatchFrame.productLabel.text = mainView.myZatchFrame.productTextField.text
        }else{
            mainView.wantZatchFrame.productLabel.text = mainView.wantZatchFrame.productTextField.text
        }
        
        self.view.endEditing(true)
        return true
    }
}

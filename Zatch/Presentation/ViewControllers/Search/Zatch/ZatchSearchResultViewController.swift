//
//  SearchResultViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit

class ZatchSearchResultViewController: BaseViewController<BaseHeaderView, ZatchSearchResultView>, UIGestureRecognizerDelegate {
    
    //MARK: - Properties
    
    private var myZatchIndex: Int?
    private var wantZatchIndex: Int?
    private var resultData = [String](){
        didSet{
            if(resultData.isEmpty){
                mainView.emptyResultView.isHidden = false
            }else{
                mainView.emptyResultView.isHidden = true
            }
        }
    }
    
    init(){
        super.init(headerView: BaseHeaderView(), mainView: ZatchSearchResultView())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func initialize() {
        
        super.initialize()
        
        setUpDelegate()
        
        mainView.myZatchFrame.categortBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCategoryBottomSheet)))
        mainView.myZatchFrame.productLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openMyZatchBottomSheet)))
        mainView.myZatchFrame.productLabel.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(textFieldDidPressedLong)))
        
        mainView.wantZatchFrame.categortBtn.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openCategoryBottomSheet)))
        mainView.wantZatchFrame.productLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openWantZatchBottomSheet)))
        mainView.wantZatchFrame.productLabel.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(textFieldDidPressedLong)))
        
        mainView.townFrame.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(townFrameDidClicked)))
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
    
    @objc func openMyZatchBottomSheet(recognizer: UITapGestureRecognizer){
        let bottomSheet = MyZatchSheetViewController().show(in: self)
        bottomSheet.currentTag = myZatchIndex
        bottomSheet.selectCompleteHandelr = { text, index in
            self.mainView.myZatchFrame.productLabel.text = text
            self.myZatchIndex = index
        }
    }
    
    @objc func openWantZatchBottomSheet(recognizer: UITapGestureRecognizer){
        let bottomSheet = WantZatchSheetViewController().show(in: self)
        bottomSheet.currentTag = wantZatchIndex
        bottomSheet.selectCompleteHandelr = { text, index in
            self.mainView.wantZatchFrame.productLabel.text = text
            self.wantZatchIndex = index
        }
    }
    
    @objc func openCategoryBottomSheet(recognizer: UITapGestureRecognizer){
        let vc = CategorySheetViewController(service: .Zatch).show(in: self)
        vc.completion = { category in
            print(category)
            (recognizer.view as? ZatchSearchResultView.SearchCateogryDotButton)?.isSelected = true
        }
    }
    
    @objc func textFieldDidPressedLong(_ recognizer : UIGestureRecognizer){
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
    
    @objc func townFrameDidClicked(){
        let vc = TownSettingSheetViewController().show(in: self)
        vc.completion = { town in
            print(town)
//            (recognizer.view as? SearchCateogryDotButton)?.isSelected = true
        }
    }

}

extension ZatchSearchResultViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: MyZatchTableViewCell.self)
        cell.addHeartToCell(color: "yellow")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ZatchDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ZatchSearchResultViewController: UITextFieldDelegate{
    
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

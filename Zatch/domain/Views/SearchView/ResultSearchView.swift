//
//  ResultSearchView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/29.
//

import UIKit

class ResultSearchView: UIView {
    
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
    
    lazy var myCategoryButton = SearchCateogryDotButton()
    
    lazy var myZatch = UILabel().then{
        $0.numberOfLines = 1
        $0.textAlignment = .right
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.isUserInteractionEnabled = true
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
    
    lazy var wantCategoryButton = SearchCateogryDotButton()
    
    lazy var wantZatch = UILabel().then{
        $0.numberOfLines = 1
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.isUserInteractionEnabled = true
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
    
    lazy var townFrame = UIStackView().then{
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
    
    lazy var tableView = UITableView().then{
        $0.separatorStyle = .none
        
        $0.register(ResultTableViewCell.self, forCellReuseIdentifier: "ResultTableViewCell")
    }
    
    let emptyResultView = ResultEmptyTableViewCell()

    override init(frame: CGRect){
        super.init(frame: .zero)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){

        self.addSubview(topView)
        
        self.topView.addSubview(myStackView)
        self.topView.addSubview(exchangeImage)
        self.topView.addSubview(wantStackView)
        
        self.myStackView.addArrangedSubview(myCategoryButton)
        self.myStackView.addArrangedSubview(myZatch)
    
        self.wantStackView.addArrangedSubview(wantCategoryButton)
        self.wantStackView.addArrangedSubview(wantZatch)
        
        self.topView.addSubview(myZatchTextField)
        self.topView.addSubview(wantZatchTextField)
        
        self.topView.addSubview(townFrame)
        townFrame.addArrangedSubview(townSelectedLabel)
        townFrame.addArrangedSubview(townSelectArrow)
        
        self.topView.addSubview(searchFrame)
        searchFrame.addArrangedSubview(searchFilterImage)
        searchFrame.addArrangedSubview(searchFilterLabel)
        
        self.addSubview(separateLine)
        self.addSubview(separateRectangle)
        
        self.addSubview(tableView)
        self.addSubview(emptyResultView)
    }
    
    func setUpConstraint(){
     
        self.topView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(88)
            make.height.equalTo(116)
            make.width.equalToSuperview()
        }
    
        self.exchangeImage.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(36)
        }
        
        self.myStackView.snp.makeConstraints { make in
            make.trailing.equalTo(exchangeImage.snp.leading).offset(-12)
            make.bottom.equalTo(exchangeImage)
            make.top.equalToSuperview().offset(8)
            make.leading.equalToSuperview().offset(20)
        }
        
        self.myZatch.snp.makeConstraints{ make in
            make.height.equalTo(20)
            make.leading.trailing.equalToSuperview()
        }
        
        self.myZatchTextField.snp.makeConstraints{ make in
            make.height.equalTo(32)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(exchangeImage.snp.leading).offset(-12)
            make.top.equalTo(myCategoryButton.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-52)
        }

        self.wantStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(exchangeImage.snp.trailing).offset(12)
            make.bottom.equalTo(exchangeImage)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        self.wantZatch.snp.makeConstraints{ make in
            make.height.equalTo(20)
            make.leading.trailing.equalToSuperview()
        }
        
        self.wantZatchTextField.snp.makeConstraints{ make in
            make.height.equalTo(32)
            make.trailing.equalToSuperview().offset(-20)
            make.leading.equalTo(exchangeImage.snp.trailing).offset(12)
            make.top.equalTo(wantCategoryButton.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-52)
        }
        
        self.townFrame.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        self.townSelectArrow.snp.makeConstraints{ make in
            make.height.width.equalTo(20)
        }
        
        self.searchFrame.snp.makeConstraints{ make in
            make.trailing.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        self.searchFilterImage.snp.makeConstraints{ make in
            make.height.width.equalTo(20)
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
        
        self.emptyResultView.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalTo(tableView)
        }
        
    }
    
}

extension ResultSearchView{
    
    class SearchCateogryDotButton: UIButton {
        
        //MARK: - LifeCycle
        override init(frame: CGRect) {
            super.init(frame: .zero)
            
            self.setImage(UIImage(named: "search_dot"), for: .normal)
            self.setImage(UIImage(named: "search_dot_checked"), for: .selected)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
}

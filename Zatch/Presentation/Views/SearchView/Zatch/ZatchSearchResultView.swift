//
//  ResultSearchView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/29.
//

import UIKit

class ZatchSearchResultView: BaseView {
    
    private let topView = UIView()
    private let separateLine = ZatchComponent.BorderLine(color: .black10, height: 1)
    private let separateSection = ZatchComponent.BorderLine(color: .black5, height: 8)
    
    let myZatchFrame = SearchFieldFrame(alignment: .trailing)
    let wantZatchFrame = SearchFieldFrame(alignment: .leading)
    let exchangeImage = UIImageView().then{
        $0.image = Image.exchange
    }

    let townFrame = ZatchComponent.LettersAndArrowView().then{
        $0.setTitle("홍제동")
    }
    let searchFrame = ZatchComponent.FilterView()

    
    let tableView = UITableView().then{
        $0.register(cellType: MyZatchTableViewCell.self)
    }
    
    let emptyResultView = ResultEmptyTableViewCell().then{
        $0.isHidden = true
    }
    
    override func hierarchy(){

        self.addSubview(topView)
        self.addSubview(separateLine)
        self.addSubview(separateSection)
        self.addSubview(tableView)
        self.addSubview(emptyResultView)
        
        self.topView.addSubview(exchangeImage)
        self.topView.addSubview(myZatchFrame)
        self.topView.addSubview(wantZatchFrame)
        self.topView.addSubview(townFrame)
        self.topView.addSubview(searchFrame)
    }
    
    override func layout(){
     
        topView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.height.equalTo(116)
            $0.width.equalToSuperview()
        }
        exchangeImage.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(38)
            
            $0.centerY.equalTo(myZatchFrame.productLabel)
            $0.centerY.equalTo(wantZatchFrame.productLabel)
            $0.centerY.equalTo(myZatchFrame.productTextField)
            $0.centerY.equalTo(wantZatchFrame.productTextField)
        }
        myZatchFrame.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(11)
            $0.trailing.equalTo(exchangeImage.snp.leading).offset(-12)
        }
        wantZatchFrame.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-11)
            $0.leading.equalTo(exchangeImage.snp.trailing).offset(12)
        }
        townFrame.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(24)
            $0.bottom.equalToSuperview().offset(-14)
        }
        searchFrame.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-14)
        }
        separateLine.snp.makeConstraints{
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        separateSection.snp.makeConstraints{
            $0.top.equalTo(separateLine.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(separateSection.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        emptyResultView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalTo(tableView)
        }
        
    }
    
}

extension ZatchSearchResultView{
    
    class SearchCateogryDotButton: UIButton {
        
        //MARK: - LifeCycle
        override init(frame: CGRect) {
            super.init(frame: .zero)
            initialize()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func initialize(){
            style()
            layout()
        }
        
        private func style(){
            self.setImage(Image.searchDot, for: .normal)
            self.setImage(Image.searchDotChecked, for: .selected)
        }
        
        private func layout(){
            self.snp.makeConstraints{
                $0.width.equalTo(36)
                $0.height.equalTo(18)
            }
        }
        
    }
    
    class SearchFieldFrame: UIView{
        
        let categortBtn = SearchCateogryDotButton()
        
        let productLabel = UILabel().then{
            $0.text = "생수"
            $0.numberOfLines = 1
            $0.textAlignment = .right
            $0.textColor = .black85
            $0.setTypoStyleWithSingleLine(typoStyle: .bold20)
            $0.isUserInteractionEnabled = true
        }
        let stackView = UIStackView().then{
            $0.spacing = 6
            $0.axis = .vertical
        }
        
        let productTextField = UITextField().then{
            $0.isHidden = true
            $0.textAlignment = .center
            $0.textColor = .black85
            $0.font = UIFont.pretendard(size: 20, family: .Bold)
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
        
        init(alignment: UIStackView.Alignment){
            
            super.init(frame: .zero)
            
            stackView.alignment = alignment
            
            self.addSubview(stackView)
            self.addSubview(productTextField)
            
            stackView.addArrangedSubview(categortBtn)
            stackView.addArrangedSubview(productLabel)
            
            stackView.snp.makeConstraints{
                $0.top.equalToSuperview().offset(12)
                $0.leading.trailing.equalToSuperview()
            }
            
            productTextField.snp.makeConstraints{
                $0.top.equalTo(categortBtn.snp.bottom).offset(6)
                $0.height.equalTo(32)
                $0.bottom.equalToSuperview()
            }
            
            if(alignment == .trailing){
                productTextField.snp.makeConstraints{
                    $0.trailing.equalToSuperview()
                    $0.leading.equalToSuperview().offset(24)
                }
            }else{
                productTextField.snp.makeConstraints{
                    $0.leading.equalToSuperview()
                    $0.trailing.equalToSuperview().offset(-24)
                }
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
}


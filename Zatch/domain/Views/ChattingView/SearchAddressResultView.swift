//
//  SearchAddressResultView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit

class SearchAddressResultView: UIView {
    
    let searchImage = UIImageView().then{
        $0.image = UIImage(named: "search")
        $0.setImageTintColor(.zatchPurple)
    }
    
    let searchTextField = UITextField().then{
        $0.placeholder = "이름(동,면,읍)으로 검색"
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.purple40.cgColor
        $0.layer.borderWidth = 1.5
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
        $0.font = UIFont.pretendard(size: 15, family: .Medium)
        $0.addPadding(left: 40, right: 6)
    }
    
    let myLocationFrame = UIStackView().then{
        $0.spacing = 4
        $0.axis = .horizontal
        $0.alignment = .center
    }
    
    let myLocationImage = UIImageView().then{
        $0.image = UIImage(named: "my_spot")
    }
    
    let myLocationLabel = UILabel().then{
        $0.text = "내 위치로 설정"
        $0.textAlignment = .center
        $0.textColor = .black85
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    var tableView: UITableView!

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setInitSetting()
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SearchAddressResultView{
    
    func setInitSetting(){
        tableView = UITableView().then{
            $0.separatorStyle = .none
        }
    }
    
    func setUpView(){
        
        self.addSubview(searchTextField)
        self.addSubview(myLocationFrame)
        self.addSubview(borderLine)
        self.addSubview(tableView)
        
        searchTextField.addSubview(searchImage)
        
        myLocationFrame.addArrangedSubview(myLocationImage)
        myLocationFrame.addArrangedSubview(myLocationLabel)
    
    }
    
    func setUpConstraint(){
        
        searchImage.snp.makeConstraints{ make in
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-12)
        }
        
        searchTextField.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(44)
        }
        
        myLocationFrame.snp.makeConstraints{ make in
            make.top.equalTo(searchTextField.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(20)
            make.height.equalTo(myLocationImage)
        }
        
        myLocationImage.snp.makeConstraints{ make in
            make.width.height.equalTo(20)
            make.top.bottom.leading.equalToSuperview()
        }
        
        borderLine.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(8)
            make.top.equalTo(myLocationFrame.snp.bottom).offset(16)
        }
        
        tableView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(borderLine.snp.bottom)
        }
        
        tableView.backgroundColor = .red
    }
}

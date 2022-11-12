//
//  ProductInputUIView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/18.
//

import UIKit

class ProductInputTextFieldTabeViewCell: BaseTableViewCell {
    
    //MARK: - Properties
    
    static let cellIdentifier = "productInputCell"
    
    //MARK: - UI
    
    let boundaryLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let productNameTextField = UITextField().then{
        $0.font = UIFont.pretendard(family: .Medium)
        $0.placeholder = "상품 이름을 입력해주세요."
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.productNameTextField.delegate = nil
    }
    
    func setUpView(){
        baseView.addSubview(boundaryLine)
        baseView.addSubview(productNameTextField)
    }
    
    func setUpConstraint(){
        
        baseView.snp.makeConstraints{ make in
            make.height.equalTo(41)
        }
    
        baseView.snp.updateConstraints{ make in
            make.top.equalToSuperview().offset(12)
        }
        
        boundaryLine.snp.makeConstraints{ make in
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        productNameTextField.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(36)
            make.centerY.equalToSuperview()
        }
    }

}

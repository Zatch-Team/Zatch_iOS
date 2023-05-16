//
//  ProductInputUIView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/18.
//

import UIKit
import RxSwift
import RxCocoa

class TextFieldTabeViewCell: BaseTableViewCell {
    
    enum Information{
        case product
        case question
    }
    
    var informationType: Information?{
        didSet{
            textField.placeholder = informationType?.placeholder
        }
    }

    var textObservable: Observable<String>!{
        textField.rx.text.orEmpty.asObservable()
    }
    
    //MARK: - UI
    
    private let boundaryLine = UIView().then{
        $0.backgroundColor = .black5
    }
    private let textField = UITextField().then{
        $0.font = UIFont.pretendard(family: .Medium)
    }
    
    override func hierarchy(){
        super.hierarchy()
        baseView.addSubview(boundaryLine)
        baseView.addSubview(textField)
    }
    
    override func layout(){
        super.layout()
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
        
        textField.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(36)
            make.centerY.equalToSuperview()
        }
    }
}

extension TextFieldTabeViewCell.Information{
    var placeholder: String{
        switch self{
        case .product:      return "상품 이름을 입력해주세요."
        case .question:     return "제목을 입력해주세요."
        }
    }
}

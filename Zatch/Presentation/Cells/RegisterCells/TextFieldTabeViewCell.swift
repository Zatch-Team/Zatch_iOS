//
//  ProductInputUIView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/18.
//

import UIKit
import RxSwift
import RxCocoa

class TextFieldTabeViewCell: BaseTableViewCell, DefaultObservable {
    
    enum CellType{
        case myProduct
        case firstPriority
        case secondPriority
        case thirdPriority
        case question
    }
    
    var informationType: CellType!{
        didSet{
            textField.placeholder = informationType.placeholder
        }
    }
    let disposeBag = DisposeBag()
    private let registerManager = ZatchRegisterRequestManager.shared
    
    //MARK: - UI
    
    private let boundaryLine = UIView().then{
        $0.backgroundColor = .black5
    }
    private let textField = UITextField().then{
        $0.font = UIFont.pretendard(family: .Medium)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func bind(){
        let input: Observable<String> = textField.rx.text.orEmpty.asObservable()
        input.asDriver(onErrorJustReturn: "")
            .drive{
                self.registerManager.productName = $0
            }.disposed(by: disposeBag)
    }

}

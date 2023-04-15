//
//  ProductIsOpenTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/10.
//

import Foundation
import RxSwift
import RxCocoa

class ProductIsOpenTableViewCell: BaseTableViewCell, DefaultObservable {
    
    let disposeBag = DisposeBag()
    var delegate: RegisterFirstInfoDelegate!
    
    private lazy var selectRadioButton: ZatchComponent.FilledTag = unOpenRadioButton{
        willSet{
            selectRadioButton.isDisabled = true
        }
        didSet{
            selectRadioButton.isDisabled = false
        }
    }

    private let titleLabel = UILabel().then{
        $0.text = "개봉상태"
        $0.textColor = .black
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    private let tagStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    private let unOpenRadioButton = ZatchComponent.Tag.filled(color: .purple, configuration: .height20).then{
        $0.setTitle(Register.ProductOpenState.unopen.title)
    }
    private let openRadioButton = ZatchComponent.Tag.filled(color: .purple, configuration: .height20).then{
        $0.setTitle(Register.ProductOpenState.open.title)
        $0.isDisabled = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hierarchy() {
        super.hierarchy()
        
        baseView.addSubview(titleLabel)
        baseView.addSubview(tagStackView)
        
        tagStackView.addArrangedSubview(unOpenRadioButton)
        tagStackView.addArrangedSubview(openRadioButton)
        
    }
    
    override func layout() {
        
        super.layout()
        
        baseView.snp.updateConstraints{
            $0.top.equalToSuperview().offset(10)
        }
        
        baseView.snp.makeConstraints{
            $0.height.equalTo(37)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(36)
            make.centerY.equalToSuperview()
        }
        
        tagStackView.snp.makeConstraints{ make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(titleLabel.snp.trailing).offset(20)
        }
    }
    
    func bind() {
        unOpenRadioButton.rx.tapGesture()
            .when(.recognized)
            .bind(onNext: { [weak self] in
                self?.changetOpenState(recognizer: $0, state: Register.ProductOpenState.unopen.rawValue)
            }).disposed(by: disposeBag)
        
        openRadioButton.rx.tapGesture()
            .when(.recognized)
            .bind(onNext: { [weak self] in
                self?.changetOpenState(recognizer: $0, state: Register.ProductOpenState.open.rawValue)
            }).disposed(by: disposeBag)
    }

    private func changetOpenState(recognizer: UITapGestureRecognizer, state: Int){
        if let view = recognizer.view as? ZatchComponent.FilledTag{
            selectRadioButton = view
            delegate.changeIsOpenState(state)
        }
    }
}

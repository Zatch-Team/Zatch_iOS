//
//  ProductIsOpenTableViewCell.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/10.
//

import Foundation
import RxSwift

class ProductIsOpenTableViewCell: BaseTableViewCell, DefaultObservable {
    
    let disposeBag = DisposeBag()
    let registerManager = ZatchRegisterRequestManager.shared
    
    let titleLabel = UILabel().then{
        $0.text = "개봉상태"
        $0.textColor = .black
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
    }
    let tagStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .horizontal
    }
    let unOpenRadioButton = ZatchComponent.PurlpleTag(configuration: .height20).then{
        $0.setTitle("미개봉")
    }
    let openRadioButton = ZatchComponent.PurlpleTag(configuration: .height20).then{
        $0.setTitle("개봉")
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
                self?.registerManager.isOpen = false
                self?.changeTagState(recognizer: $0)
            }).disposed(by: disposeBag)
        
        openRadioButton.rx.tapGesture()
            .when(.recognized)
            .bind(onNext: { [weak self] in
                self?.registerManager.isOpen = true
                self?.changeTagState(recognizer: $0)
            }).disposed(by: disposeBag)
    }
    
    private func changeTagState(recognizer: UITapGestureRecognizer){
        
        guard let selectTag = recognizer.view as? ZatchComponent.PurlpleTag,
              let willDisabledTag = tagStackView.viewWithTag(ViewTag.normal) as? ZatchComponent.PurlpleTag else { return }
        
        willDisabledTag.isDisabled = true
        selectTag.isDisabled = false
    }
}

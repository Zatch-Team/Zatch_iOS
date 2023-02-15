//
//  MyZatchTableViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/13.
//

import UIKit
import RxSwift
import RxCocoa

class ZatchTableViewCell: BaseTableViewCell, DefaultObservable {
    
    var disposeBag = DisposeBag()
    private let viewModel = ZatchTableViewCellViewModel()
    
    // 재치 내용
    private let zatchImage = UIImageView().then{
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 4
    }
    private let zatchStackView = UIStackView().then{
        $0.spacing = 4
        $0.axis = .vertical
        $0.alignment = .leading
    }
    private let myZatchName = UILabel().then{
        $0.text = "삼다수 생수 1L"
        $0.font = UIFont.pretendard(size: 17, family: .Bold)
    }
    private let tradeImageView = UIImageView().then{
        $0.image = Image.exchangeVerticalSilver
    }
    private let otherZatchName = UILabel().then{
        $0.text = "신라면 3봉"
        $0.font = UIFont.pretendard(size: 17, family: .Bold)
    }
    
    private let nicknameAndTownLabel = UILabel().then{
        $0.text = "냥냥이 · 불광동"
        $0.setTypoStyleWithSingleLine(typoStyle: .regular14_18)
    }

    private let countInformationStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 8
    }
    private let heartCountView = IconAndNumberView(icon: Image.profileEmptyHeart).then{
        $0.setNumber(count: 15)
    }
    private let chatCountView = IconAndNumberView(icon: Image.profileChat).then{
        $0.setNumber(count: 2)
    }
    private let borderLine = ZatchComponent.BorderLine(color: .black5, height: 1.5)

    private lazy var heartButton = UIButton().then{
        $0.setImage(Image.heartPurple, for: .selected)
        $0.setImage(Image.heartSilver, for: .normal)
    }
    
    //MARK: - Override
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        bind()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hierarchy() {
        
        super.hierarchy()
        
        baseView.addSubview(zatchImage)
        baseView.addSubview(zatchStackView)
        baseView.addSubview(nicknameAndTownLabel)
        baseView.addSubview(countInformationStackView)
        baseView.addSubview(heartButton)
        baseView.addSubview(borderLine)
        
        zatchStackView.addArrangedSubview(myZatchName)
        zatchStackView.addArrangedSubview(tradeImageView)
        zatchStackView.addArrangedSubview(otherZatchName)
        
        countInformationStackView.addArrangedSubview(heartCountView)
        countInformationStackView.addArrangedSubview(chatCountView)
    }
    
    override func layout() {
        
        super.layout()
        
        zatchImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(108)
        }
        
        nicknameAndTownLabel.snp.makeConstraints {
            $0.leading.equalTo(zatchImage.snp.trailing).offset(16)
            $0.bottom.equalToSuperview().offset(-20)
        }
        countInformationStackView.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-24)
            $0.bottom.equalToSuperview().offset(-20)
        }
        heartButton.snp.makeConstraints {
            $0.width.height.equalTo(28)
            $0.trailing.top.equalToSuperview().inset(20)
        }
        borderLine.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(16)
            $0.centerX.bottom.equalToSuperview()
        }
    }
    
    func bind() {
        
        let input = ZatchTableViewCellViewModel.Input(heartState: heartButton.rx.isSelected.asObservable())
        _ = viewModel.transform(input)
        
        heartButton.rx.tap
            .map{
                !self.heartButton.isSelected
            }.asDriver(onErrorJustReturn: false)
            .drive(heartButton.rx.isSelected)
            .disposed(by: disposeBag)
    }
    
    func bindingData(){
        
    }
}

extension ZatchTableViewCell{
    
    class IconAndNumberView: UIStackView{
        private let iconImage = UIImageView()
        private let numberLabel = UILabel().then{
            $0.setTypoStyleWithSingleLine(typoStyle: .medium15_19)
            $0.textColor = .black20
        }
        
        init(icon: UIImage){
            self.iconImage.image = icon
            super.init(frame: .zero)
            initialize()
        }
        
        required init(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func initialize(){
            self.spacing = 4
            self.axis = .horizontal
            hierarchy()
            layout()
        }
        
        private func hierarchy(){
            self.addArrangedSubview(iconImage)
            self.addArrangedSubview(numberLabel)
        }
        
        private func layout(){
            iconImage.snp.makeConstraints{
                $0.width.height.equalTo(20)
            }
        }
        
        func setNumber(count: Int){
            numberLabel.text = "\(count)"
        }
    }
}

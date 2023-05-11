//
//  MainCollectionViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit
import RxSwift

class MainZatchCollectionViewCell: BaseCollectionViewCell, DefaultObservable {
    
    static let cellSize = CGSize(width: 136, height: 251)
    
    var dataType: MainViewController.ZatchDataType!
    var viewModel: ZatchLikeViewModelInterface!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let disposeBag = DisposeBag()
    
    //MARK: - UI
    
    private let image = UIImageView().then{
        $0.backgroundColor = .black5
        $0.layer.cornerRadius = 8
        $0.contentMode = .scaleAspectFill
    }

    private let title = UILabel().then{
        $0.text = "2022년 호랑이의 해 기념 호랑이 몰랑이 세트"
        $0.setTypoStyleWithMultiLine(typoStyle: .bold15)
        $0.numberOfLines = 3
        $0.textColor = .black85
    }

    private let locationAndTimeLabel = UILabel().then{
        $0.text = "location · time"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold12)
        $0.numberOfLines = 1
        $0.textColor = .black20
    }
    
    private let stackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 0
    }

    private let label = UILabel().then{
        $0.text = "교환을 원하는 재치"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold12)
        $0.numberOfLines = 0
        $0.textColor = .black85
    }

    private let zatchItem = UILabel().then{
        $0.text = "몰랑이 피규어몰랑이피규어"
        $0.setTypoStyleWithSingleLine(typoStyle: .bold15)
        $0.numberOfLines = 1
        $0.textColor = .zatchPurple
    }
    
    private let heart = UIButton().then{
        $0.setImage(Image.heartSilver, for: .normal)
        $0.setImage(Image.heartPurple, for: .selected)
    }
    
    override func hierarchy() {
        super.hierarchy()
        
        baseView.addSubview(image)
        baseView.addSubview(title)
        baseView.addSubview(locationAndTimeLabel)
        baseView.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(zatchItem)
        baseView.addSubview(heart)
    }

    override func layout() {
        
        super.layout()
        
        image.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(112)
        }
        title.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(image.snp.bottom).offset(16)
            $0.height.equalTo(63)
        }
        locationAndTimeLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(title.snp.bottom).offset(2)
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(locationAndTimeLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(32)
        }
        heart.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.top.equalTo(stackView).offset(4)
            make.trailing.equalToSuperview()
        }
    }
    
    func bind() {
        heart.rx.tap
            .map{ [weak self] in
                self?.getCurrentHeartStateAndCellIndex()
            }.compactMap{
                $0
            }.subscribe{ [weak self] in
                self?.fetchHeartState(info: $0)
            }.disposed(by: disposeBag)
    }
    
    private func getCurrentHeartStateAndCellIndex() -> (Bool, Int)?{
        guard let indexPath = indexPath else { return nil }
        return (heart.isSelected, indexPath.row)
    }
    
    private func fetchHeartState(info: (state: Bool, index: Int)){
        switch dataType {
        case .around:       viewModel.changeAroundZatchState(info.state, index: info.index)
        case .popular:      viewModel.changePopularZatchState(info.state, index: info.index)
        case .none:         fatalError()
        }
    }
}

//
//  MainCollectionViewCell.swift
//  Zatch
//
//  Created by gomin on 2022/09/06.
//

import UIKit
import RxSwift

class MainZatchCollectionViewCell: BaseCollectionViewCell, DefaultObservable {
    
    //MARK: - Properties
    
    // 아이템 이미지
    let image = UIImageView().then{
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 8
    }
    // 아이템 이름
    let title = UILabel().then{
        $0.text = "title"
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
        $0.numberOfLines = 1
        $0.textColor = .black
    }
    // 위치
    let location = UILabel().then{
        $0.text = "location"
        $0.font = UIFont.pretendard(size: 10, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .lightGray
    }
    // 시간 (몇 시간 전)
    let time = UILabel().then{
        $0.text = "time"
        $0.font = UIFont.pretendard(size: 10, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .lightGray
    }
    let stackView = UIStackView().then{
        $0.axis = .vertical
        $0.spacing = 0
    }
    // '교환을 원하는 재치' (라벨)
    let label = UILabel().then{
        $0.text = "교환을 원하는 재치"
        $0.font = UIFont.pretendard(size: 10, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .black
    }
    // 교환을 원하는 아이템
    let zatchItem = UILabel().then{
        $0.text = "Item"
        $0.font = UIFont.pretendard(size: 13, family: .Bold)
        $0.numberOfLines = 0
        $0.textColor = .zatchPurple
    }
    // 하트
    let heart = UIButton().then{
        // state별로 이미지 설정
        $0.setImage(Image.heartSilver, for: .normal)
        $0.setImage(Image.heartPurple, for: .selected)
    }
    
    let disposeBag = DisposeBag()
    let viewModel = MainZatchCollectionViewCellViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hierarchy() {
        super.hierarchy()
        
        baseView.addSubview(image)
        baseView.addSubview(title)
        baseView.addSubview(location)
        baseView.addSubview(time)
        baseView.addSubview(stackView)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(zatchItem)
        baseView.addSubview(heart)
    }

    override func layout() {
        super.layout()
        
        image.snp.makeConstraints { make in
            make.width.equalTo(124)
            make.height.equalTo(120)
            make.leading.trailing.top.equalToSuperview()
        }
        title.snp.makeConstraints { make in
            make.leading.equalTo(image.snp.leading)
            make.trailing.equalTo(image.snp.trailing)
            make.top.equalTo(image.snp.bottom).offset(12)
        }
        location.snp.makeConstraints { make in
            make.leading.equalTo(title.snp.leading)
            make.top.equalTo(title.snp.bottom).offset(4)
        }
        time.snp.makeConstraints { make in
            make.centerY.equalTo(location)
            make.leading.equalTo(location.snp.trailing).offset(4)
        }
        stackView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().offset(-18)
        }
        heart.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.top.equalTo(stackView)
            make.trailing.equalToSuperview()
        }
    }
    
    func bind() {
        
        let input = MainZatchCollectionViewCellViewModel.Input(heartTap: heart.rx.tap,
                                                               heartState: heart.rx.isSelected)
        
        let output = viewModel.transform(input: input)
        output.isHeartSelected
            .drive(onNext: { state in
                self.heart.isSelected = state
            }).disposed(by: disposeBag)
        
    }
}

extension Reactive where Base: UIControl {
  public var isSelected: Observable<Bool> {
    self.base.rx.methodInvoked(#selector(setter: self.base.isSelected))
      .compactMap { $0.first as? Bool }
      .startWith(self.base.isSelected)
      .distinctUntilChanged()
      .share()
  }
}

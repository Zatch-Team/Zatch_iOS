//
//  FilterView.swift
//  Zatch
//
//  Created by 박소윤 on 2023/02/09.
//

import Foundation


extension ZatchComponent{
    
    class FilterView: BaseView{
        
        var isActivate = false {
            didSet{
                isActivate ? setActivateState() : setNormalState()
            }
        }
        
        private let stackView = UIStackView().then{
            $0.spacing = 4
            $0.axis = .horizontal
        }
        private let filterImage = UIImageView()
        private let filterLabel = UILabel().then{
            $0.text = "검색 필터"
            $0.setTypoStyleWithSingleLine(typoStyle: .medium12)
        }
        
        override func style() {
            setNormalState()
        }
        
        override func hierarchy() {
            self.addSubview(stackView)
            stackView.addArrangedSubview(filterImage)
            stackView.addArrangedSubview(filterLabel)
        }
        
        override func layout() {
            stackView.snp.makeConstraints{
                $0.top.leading.trailing.bottom.equalToSuperview()
            }
            filterImage.snp.makeConstraints{
                $0.width.height.equalTo(20)
            }
        }
        
        private func setActivateState(){
            filterImage.image = Image.searchFilter.withTintColor(.zatchPurple)
            filterLabel.textColor = .zatchPurple
        }
        
        private func setNormalState(){
            filterImage.image = Image.searchFilter.withTintColor(.black85)
            filterLabel.textColor = .black85
        }
    }
}

//
//  SearchAddressView.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit

class SearchAddressView: UIView {
    
    let searchTextField = LocationSearchTextField()
    
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
    
    //검색 TIP View
    let searchTipView = UIView().then{
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = UIColor.black10.cgColor
        $0.layer.borderWidth = 1
    }
    
    let searchTipTitle = UILabel().then{
        $0.text = "검색 TIP"
        $0.textColor = .black
        $0.font = UIFont.pretendard(size: 14, family: .Bold)
    }
    
    let tipLabelFrame = UIStackView().then{
        $0.spacing = 7
        $0.axis = .vertical
        $0.alignment = .leading
    }
    
    let firstTipLabel = TipLabel().then{
        $0.text = "• 도로명+건물번호"
    }
    
    let secondTipLabel = TipLabel().then{
        $0.text = "• 지역명+번지"
    }
    
    let thirdTipLabel = TipLabel().then{
        $0.text = "• 건물명+아파트명"
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: .zero)
        
        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SearchAddressView{
    
    class TipLabel: UILabel{
        
        override init(frame: CGRect) {
            super.init(frame: .zero)
            
            self.font = UIFont.pretendard(size: 13, family: .Regular)
            self.textColor = .black85
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    func setUpView(){
        
        self.addSubview(searchTextField)
        self.addSubview(myLocationFrame)
        self.addSubview(searchTipView)
        
        myLocationFrame.addArrangedSubview(myLocationImage)
        myLocationFrame.addArrangedSubview(myLocationLabel)
        
        searchTipView.addSubview(searchTipTitle)
        searchTipView.addSubview(tipLabelFrame)
        
        tipLabelFrame.addArrangedSubview(firstTipLabel)
        tipLabelFrame.addArrangedSubview(secondTipLabel)
        tipLabelFrame.addArrangedSubview(thirdTipLabel)
    }
    
    func setUpConstraint(){
        
        searchTextField.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
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
        
        searchTipView.snp.makeConstraints{ make in
            make.top.equalTo(myLocationFrame.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(tipLabelFrame.snp.height).offset(49)
        }
        
        searchTipTitle.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(24)
        }
        
        tipLabelFrame.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.top.equalTo(searchTipTitle.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}

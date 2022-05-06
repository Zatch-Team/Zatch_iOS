//
//  MyZatchBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/04.
//

import UIKit
import MaterialComponents.MaterialBottomSheet
import SnapKit
import PinLayout
import FlexLayout
import MaterialComponents

//enum SearchBS{
//    case Find
//    case Register
//}

enum SearchBS: String{
    case Find = "내가 찾는 재치"
    case Register = "내가 등록한 재치"
}

class MyZatchBottomSheet: ViewController {
    
    let titleLabel = UILabel()
    let flexContainer = UIView()
    
    let zatchData : [String] = ["타이머","안경닦이","호랑이 인형","램프","2022 달력", "미니 가습기","마우스 패드"]
    var bsType: SearchBS = SearchBS.Find

    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.view.backgroundColor = .white
        setUpView()
        setUpValue()
        setUpConstraint()
    }
    
    private func setUpValue(){
        titleLabel.text = SearchBS.Register.rawValue
        titleLabel.textColor = .black85
        titleLabel.font = UIFont.pretendard(size: 16, family: .Bold)
        
        flexContainer.flex.wrap(.wrap).direction(.row).define { flex in
            for i in zatchData{
                let button = SearchBSButton(bsType)
                button.setTitle(i, for: .normal)
                button.addTarget(self, action: #selector(selectItem), for: .touchUpInside)
                flex.addItem(button).marginEnd(8).marginBottom(16)
            }
        }
    }
    
    private func setUpView(){
        self.view.addSubview(titleLabel)
        self.view.addSubview(flexContainer)
    }
    
    private func setUpConstraint(){
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(24)
            make.centerX.equalToSuperview()
        }
        
        flexContainer.snp.makeConstraints{ make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-30)
        }
    }
    
    override func viewDidLayoutSubviews() {
        flexContainer.pin.layout()
        flexContainer.flex.layout()
    }
    
    //MARK: - Action
    @objc
    func selectItem(){
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

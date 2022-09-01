//
//  TimePickerAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/01.
//

import UIKit

class TimePickerAlertViewController: BasicAlertViewController {
    
    var timeArray : [Int] = []
    
    let titleLabel = UILabel().then{
        $0.text = "약속시간"
        $0.font = UIFont.pretendard(size: 14, family: .Bold)
        $0.textColor = .black85
    }
    
    let timePicker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func setUpView() {
        
        super.setUpView()
        
        super.containerView.addSubview(titleLabel)
        super.containerView.addSubview(timePicker)
    }
    
    override func setUpConstraint() {
        
        super.setUpConstraint()
        
        containerView.snp.updateConstraints{ make in
            make.leading.equalToSuperview().offset(24)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(16)
        }
        
        timePicker.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(44)
            make.leading.equalToSuperview().offset(36)
            make.trailing.equalToSuperview().offset(-36)
            make.height.equalTo(130)
            make.bottom.equalTo(super.btnStackView.snp.top).offset(-20)
        }
        
        btnStackView.snp.updateConstraints{ make in
            make.bottom.equalToSuperview().offset(-23)
        }
    }

}

extension TimePickerAlertViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return component == 0 ? 24 : 60
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 36
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let title = "\(row)"
        
        let label = UILabel().then{ //DatePicker Label 기본 UI 설정
            $0.text = title
            $0.textAlignment = .center
            $0.font = UIFont.pretendard(size: 18, family: .Medium)
            $0.textColor = .black45
        }
        
        if(timeArray[component] == row || (row == 15 && component == 0)){ //DatePicker Label select UI 설정
            label.font = UIFont.pretendard(size: 18, family: .Bold)
            label.textColor = .black85
        }
        
        return label
    }
    
}

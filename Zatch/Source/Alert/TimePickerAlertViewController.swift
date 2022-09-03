//
//  TimePickerAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/01.
//

import UIKit

class TimePickerAlertViewController: PickerAlertViewController {
    
    //MARK: - Properties
    /*
     0: hour
     1: minute
     */
    var timeArray : [Int] = [0,0]
    
    //MARK: - UI
    
    let pickerStackView = UIStackView().then{
        $0.spacing = 18
        $0.axis = .horizontal
    }
    
    let hourPicker = UIPickerView()
    let minutePicker = UIPickerView()
    let columnLabel = UILabel().then{
        $0.text = ":"
        $0.font = UIFont.pretendard(size: 18, family: .Bold)
        $0.textColor = .black85
        $0.textAlignment = .center
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        super.titleLabel.text = "약속시간"
    }
    
    override func setUpView() {
        
        super.setUpView()
        
        super.containerView.addSubview(titleLabel)
        super.containerView.addSubview(pickerStackView)
        
        pickerStackView.addArrangedSubview(hourPicker)
        pickerStackView.addArrangedSubview(columnLabel)
        pickerStackView.addArrangedSubview(minutePicker)
    }
    
    override func setUpConstraint() {
        
        super.setUpConstraint()
        
        pickerStackView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(98)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(44)
            make.bottom.equalToSuperview().offset(-68)
            make.height.equalTo(130)
            make.bottom.equalTo(super.btnStackView.snp.top).offset(-20)
        }
        
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(14)
            make.leading.equalToSuperview().offset(16)
        }
        
        hourPicker.snp.makeConstraints{ make in
            make.top.bottom.equalToSuperview()
        }
        
        columnLabel.snp.makeConstraints{ make in
            make.width.equalTo(9)
        }
        
        minutePicker.snp.makeConstraints{ make in
            make.width.equalTo(hourPicker)
            make.top.bottom.equalToSuperview()
        }
        
        btnStackView.snp.updateConstraints{ make in
            make.bottom.equalToSuperview().offset(-23)
        }
    }
    
    override func okBtnDidClicked() {
        
        self.pickerHandler!(timeArray)
        
        super.okBtnDidClicked()
    }
    
    func setPickerInitSetting(){
        hourPicker.delegate = self
        hourPicker.dataSource = self
        
        minutePicker.delegate = self
        minutePicker.dataSource = self
    }

}

extension TimePickerAlertViewController : UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerView == hourPicker ? 24 : 60
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 36
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let title: String!
        if(pickerView == minutePicker && row < 10 ){
            title = "0\(row)"
        }else{
            title = "\(row)"
        }
        
        let label = UILabel().then{ //DatePicker Label 기본 UI 설정
            $0.text = title
            $0.textAlignment = .center
            $0.font = UIFont.pretendard(size: 18, family: .Medium)
            $0.textColor = .black45
        }
        
//        if(timeArray[component] == row || (row == 15 && component == 0)){ //DatePicker Label select UI 설정
//            label.font = UIFont.pretendard(size: 18, family: .Bold)
//            label.textColor = .black85
//        }
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let select = pickerView.view(forRow: row, forComponent: component) as! UILabel
        select.font = UIFont.pretendard(size: 18, family: .Bold)
        select.textColor = .black85
        
        let component = pickerView == hourPicker ? 0 : 1
        timeArray[component] = row
    }
    
}

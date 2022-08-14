//
//  DatePicerAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/14.
//

import UIKit

class DatePicerAlertViewController: BasicAlertViewController {
    
    //MARK: - Properties
    
    var todayDateArray : [Int]! = []
    
    //MARK: - UI
    
    let titleLabel = UILabel().then{
        $0.text = "구매일자"
        $0.font = UIFont.pretendard(size: 14, family: .Bold)
        $0.textColor = .black85
    }
    
    let datePicker = UIPickerView()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        let todayDate = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy"
        let year = Int(formatter.string(from: todayDate))
        todayDateArray.append(year!)
        
        formatter.dateFormat = "M"
        let month =  Int(formatter.string(from: todayDate))
        todayDateArray.append(month!)
        
        formatter.dateFormat = "d"
        let date =  Int(formatter.string(from: todayDate))
        todayDateArray.append(date!)
        
        
        super.viewDidLoad()

        removeSuperView()
        setUpInitSetting()
    }
    
    override func setUpView() {
        
        super.setUpView()
        
        super.containerView.addSubview(titleLabel)
        super.containerView.addSubview(datePicker)
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
        
        datePicker.snp.makeConstraints{ make in
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
    
    func removeSuperView(){
        super.messageLabel.removeFromSuperview()
    }
    
    func setUpInitSetting(){
        datePicker.delegate = self
        datePicker.dataSource = self
        
        //datepicker 초기값 설정
        datePicker.selectRow(15, inComponent: 0, animated: false)
        datePicker.selectRow(todayDateArray[1], inComponent: 1, animated: false)
        datePicker.selectRow(todayDateArray[2], inComponent: 2, animated: false)
    }

}

extension DatePicerAlertViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        switch component {
        case 0, 2:
            return 31
        case 1:
            return 12
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        switch component {
        case 0:
            return 96
        case 1:
            return 72
        case 2:
            return 76
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let title: String!
        
        switch component{
        case 0:
            let yearValue = row - 15 + todayDateArray[0]
            title =  "\(yearValue)년"
        case 1:
            title = "\(row+1)월"
        case 2:
            title = "\(row+1)일"
        default:
            return UIView()
        }
        
        let label = UILabel().then{
            $0.text = title
            $0.textAlignment = .center
            $0.font = UIFont.pretendard(size: 18, family: .Medium)
            $0.textColor = .black45
        }
        
        if(todayDateArray[component] == row || (row == 15 && component == 0)){
            label.font = UIFont.pretendard(size: 18, family: .Bold)
            label.textColor = .black85
        }
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let select = pickerView.view(forRow: row, forComponent: component) as! UILabel
        select.font = UIFont.pretendard(size: 18, family: .Bold)
        select.textColor = .black85
    }
    
}

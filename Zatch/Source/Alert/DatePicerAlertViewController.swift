//
//  DatePicerAlertViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/14.
//

import UIKit

class DatePicerAlertViewController: PickerAlertViewController {
    
    //MARK: - Properties
    
    /*
     index =
     0: year
     1: month
     2: date
     */
    var year: Int!
    var dateArray : [Int] = []
    
    //MARK: - UI
    
    let datePicker = UIPickerView()

    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        let todayDate = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy"
        year = Int(formatter.string(from: todayDate))
        dateArray.append(year!)
        
        formatter.dateFormat = "M"
        let month = Int(formatter.string(from: todayDate))! - 1
        dateArray.append(month)
        
        formatter.dateFormat = "d"
        let date =  Int(formatter.string(from: todayDate))! - 1
        dateArray.append(date)
        
        super.viewDidLoad()

        setPickerInitSetting()
    }
    
    //MARK: - Helper
    
    override func setUpView() {
        
        super.setUpView()

        super.containerView.addSubview(datePicker)
    }
    
    override func setUpConstraint() {
        
        super.setUpConstraint()
        
        datePicker.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(44)
            make.leading.equalToSuperview().offset(36)
            make.trailing.equalToSuperview().offset(-36)
            make.height.equalTo(130)
            make.bottom.equalTo(super.btnStackView.snp.top).offset(-20)
        }
    }
    
    func setPickerInitSetting(){
        datePicker.delegate = self
        datePicker.dataSource = self
        
        //datepicker 초기값 설정
        datePicker.selectRow(15, inComponent: 0, animated: false)
        datePicker.selectRow(dateArray[1], inComponent: 1, animated: false)
        datePicker.selectRow(dateArray[2], inComponent: 2, animated: false)
    }
    
    override func okBtnDidClicked() {
        
        super.pickerHandler!(dateArray)
        
        super.okBtnDidClicked()
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
            let yearValue = row - 15 + dateArray[0]
            title =  "\(yearValue)년"
        case 1:
            title = "\(row+1)월"
        case 2:
            title = "\(row+1)일"
        default:
            return UIView()
        }
        
        let label = UILabel().then{ //DatePicker Label 기본 UI 설정
            $0.text = title
            $0.textAlignment = .center
            $0.font = UIFont.pretendard(size: 18, family: .Medium)
            $0.textColor = .black45
        }
        
        if(dateArray[component] == row || (row == 15 && component == 0)){ //DatePicker Label select UI 설정
            label.font = UIFont.pretendard(size: 18, family: .Bold)
            label.textColor = .black85
        }
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let select = pickerView.view(forRow: row, forComponent: component) as! UILabel
        select.font = UIFont.pretendard(size: 18, family: .Bold)
        select.textColor = .black85
        
        dateArray[component] = component == 0 ? row - 15 + year : row
    }
    
}

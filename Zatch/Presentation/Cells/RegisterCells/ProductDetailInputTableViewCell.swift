//
//  FirstProductInfoTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/28.
//

import UIKit

class ProductDetailInputTableViewCell: BaseTableViewCell {
    
    //MARK: - Properties
    
    var viewController: ZatchRegisterFirstViewController!

    //MARK: - UI
    
    let tableView = UITableView().then{
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        
        $0.register(cellType: ProductQuantityUIView.self)
        $0.register(cellType: ProductDateChoiceUIView.self)
        $0.register(cellType: ProductDateChoiceUIView.self)
        $0.register(cellType: ProductOpenUIView.self)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(tableView)
    }
    
    override func layout() {
        super.layout()
        tableView.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(286)
        }
    }
    
    private func initialize(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
}

extension ProductDetailInputTableViewCell: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductQuantityUIView.self)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductDateChoiceUIView.self)
            cell.titleLabel.text = "구매일자"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductDateChoiceUIView.self)
            cell.titleLabel.text = "유통기한"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductOpenUIView.self)
            return cell
        default:
            fatalError()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let title: String!
        
        switch indexPath.row{
        case 1:
            title = "구매일자"
        case 2:
            title = "유통기한"
        default:
            return
        }
        
        let vc = DatePickerAlertViewController()
        vc.titleLabel.text = title
        vc.pickerHandler = { array in
            guard let cell = tableView.cellForRow(at: indexPath) as? ProductDateChoiceUIView else { return }
            cell.yearTextField.text = String (array[0])
            cell.monthTextField.text = String (array[1] + 1)
            cell.dateTextField.text = String (array[2] + 1)
            
//            if(indexPath.row == 1){
//                self.viewController.registerManager.buyDate = "\(array[0])/\(array[1] + 1)/\(array[2] + 1)"
//            }else{
//                self.viewController.registerManager.endDate = "\(array[0])/\(array[1] + 1)/\(array[2] + 1)"
//            }
        }
        _ = vc.show(in: viewController)
    }

    
    
}

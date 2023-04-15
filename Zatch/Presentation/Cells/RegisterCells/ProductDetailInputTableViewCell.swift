//
//  FirstProductInfoTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/28.
//

import UIKit
//TODO: WILL DELETE
class ProductDetailInputTableViewCell: BaseTableViewCell {
    
    enum ProductDate: String{
        case buy = "구매일자"
        case end = "유통기한"
    }
    
    //MARK: - Properties
    
    var delegate: RegisterCellDelegate!
    private let buyDateCellIndex: IndexPath = [0,1]
    private let endDateCellIndex: IndexPath = [0,2]

    //MARK: - UI
    
    let tableView = UITableView().then{
        $0.isScrollEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
        
        $0.register(cellType: ProductQuantityTableViewCell.self)
        $0.register(cellType: ProductDateChoiceTableViewCell.self)
        $0.register(cellType: ProductDateChoiceTableViewCell.self)
        $0.register(cellType: ProductIsOpenTableViewCell.self)
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
    
    override func initialize(){
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
            return tableView.dequeueReusableCell(for: indexPath, cellType: ProductQuantityTableViewCell.self)
        case 1:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductDateChoiceTableViewCell.self)
//                .then{
//                $0.setTitle(type: .buy)
//            }
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductDateChoiceTableViewCell.self)
//                .then{
//                $0.setTitle(type: .end)
//            }
            return cell
        case 3:
            return tableView.dequeueReusableCell(for: indexPath, cellType: ProductIsOpenTableViewCell.self)
        default:
            return BaseTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getDateType(indexPath: indexPath){
            let cell = tableView.cellForRow(at: indexPath, cellType: ProductDateChoiceTableViewCell.self)
            
            delegate.datePickerWillShow(dateType: $0, cell: cell)
        }
    }
    
    private func getDateType(indexPath: IndexPath, closure: (ProductDate) -> Void){
        switch indexPath{
        case buyDateCellIndex:
            closure(.buy)
            return
        case endDateCellIndex:
            closure(.end)
            return
        default:
            return
        }
    }
}

//extension ProductDetailInputTableViewCell.ProductDate{
//    func update(date: String){
//        switch self{
//        case .buy:  ZatchRegisterRequestManager.shared.buyDate = date
//            return
//        case .end:  ZatchRegisterRequestManager.shared.endDate = date
//            return
//        }
//    }
//}

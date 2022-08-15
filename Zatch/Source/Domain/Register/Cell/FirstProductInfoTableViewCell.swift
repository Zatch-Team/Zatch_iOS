//
//  FirstProductInfoTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/28.
//

import UIKit

class FirstProductInfoTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let cellIdentifier = "firstProductCell"
    
    var navigationController: UINavigationController!
    
    //MARK: - UI
    
    var tableView: UITableView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tableView = UITableView().then{
            
            $0.separatorStyle = .none
            $0.isScrollEnabled = true
            $0.showsVerticalScrollIndicator = false
            
            $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
            
            $0.dataSource = self
            $0.delegate = self
            
            $0.register(ProductQuantityUIView.self, forCellReuseIdentifier: ProductQuantityUIView.cellIdentifier)
            $0.register(ProductDateChoiceUIView.self, forCellReuseIdentifier: ProductDateChoiceUIView.cellIdentifier)
            $0.register(ProductDateChoiceUIView.self, forCellReuseIdentifier: ProductDateChoiceUIView.cellIdentifier)
            $0.register(ProductOpenUIView.self, forCellReuseIdentifier: ProductOpenUIView.cellIdentifier)
        }
        
        self.contentView.addSubview(tableView)
        
        tableView.snp.makeConstraints{ make in
            make.top.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(286)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FirstProductInfoTableViewCell: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductQuantityUIView.cellIdentifier, for: indexPath)
                    as? ProductQuantityUIView else{ fatalError("cell indexing error") }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductDateChoiceUIView.cellIdentifier, for: indexPath)
                    as? ProductDateChoiceUIView else{ fatalError("cell indexing error") }
            cell.titleLabel.text = "구매일자"
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductDateChoiceUIView.cellIdentifier, for: indexPath)
                    as? ProductDateChoiceUIView else{ fatalError("cell indexing error")}
            cell.titleLabel.text = "유통기한"
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductOpenUIView.cellIdentifier, for: indexPath)
                    as? ProductOpenUIView else{ fatalError("cell indexing error")}
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
        
        let vc = DatePicerAlertViewController(message: nil)
        vc.titleLabel.text = title
        
        vc.datePickerHandler = { array in
            guard let cell = tableView.cellForRow(at: indexPath) as? ProductDateChoiceUIView else { return }
            cell.yearTextField.text = String (array[0])
            cell.monthTextField.text = String (array[1] + 1)
            cell.dateTextField.text = String (array[2] + 1)
        }
        
        vc.modalPresentationStyle = .overFullScreen
        self.navigationController.present(vc, animated: false, completion: nil)
    }

    
    
}

//
//  FirstProductInfoTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/28.
//

import UIKit

class FirstProductInfoTableViewCell: UITableViewCell {
    
    let tableView = UITableView().then{
        
        $0.separatorStyle = .none
        $0.allowsSelection = false
        
        $0.register(ProductQuantityUIView.self, forCellReuseIdentifier: "quantityCell")
        $0.register(ProductDateChoiceUIView.self, forCellReuseIdentifier: "buyDateCell")
        $0.register(ProductDateChoiceUIView.self, forCellReuseIdentifier: "endDateCell")
        $0.register(ProductOpenUIView.self, forCellReuseIdentifier: "openCell")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "quantityCell", for: indexPath) as? ProductQuantityUIView else{
                fatalError("cell indexing error")
            }
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "buyDateCell", for: indexPath) as? ProductDateChoiceUIView else{
                fatalError("cell indexing error")
            }
            cell.titleLabel.text = "구매일자"
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "endDateCell", for: indexPath) as? ProductDateChoiceUIView else{
                fatalError("cell indexing error")
            }
            cell.titleLabel.text = "유통기한"
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "openCell", for: indexPath) as? ProductOpenUIView else{
                fatalError("cell indexing error")
            }
            return cell
        default:
            fatalError("cell indexing error")
        }
    }

    
    
}

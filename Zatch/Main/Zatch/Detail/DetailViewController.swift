//
//  DetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    let backTableView = UITableView().then{
        $0.separatorStyle = .none
    }
    
    let bottomView = BottomFixView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setUpConstraint()
        setUpValue()
        
        backTableView.delegate = self
        backTableView.dataSource = self
        
        backTableView.register(DetailImageTableViewCell.self, forCellReuseIdentifier: "imageViewCell")
        backTableView.register(FirstWantTableViewCell.self, forCellReuseIdentifier: "firstWantCell")
        backTableView.register(WantElseTableViewCell.self, forCellReuseIdentifier: "wantElseCell")
        backTableView.register(ProductInfoTableViewCell.self, forCellReuseIdentifier: "productInfoCell")
        backTableView.register(MoreTextTableViewCell.self, forCellReuseIdentifier: "moreTextCell")
        backTableView.register(SimilarZatchTableViewCell.self, forCellReuseIdentifier: "similarZatchCell")
    }
    
    func setUpView(){
        self.view.addSubview(backTableView)
        self.view.addSubview(bottomView)
    }
    
    func setUpConstraint(){
        backTableView.snp.makeConstraints{make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(bottomView.snp.top)
        }
        
        bottomView.snp.makeConstraints{ make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
    }

    func setUpValue(){
        
    }

}

extension DetailViewController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "imageViewCell", for: indexPath) as? DetailImageTableViewCell else{
                fatalError("Cell Casting Error")
            }
//            cell.snp.makeConstraints{ make in
//                make.width.equalTo(self.view.)
//                make.height.equalTo(cell.snp.width)
//            }
            cell.detailImageView.backgroundColor = .gray
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstWantCell", for: indexPath) as? FirstWantTableViewCell else{
                fatalError("Cell Casting Error")
            }
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "wantElseCell", for: indexPath) as? WantElseTableViewCell else{
                fatalError("Cell Casting Error")
            }
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "productInfoCell", for: indexPath) as? ProductInfoTableViewCell else{
                fatalError("Cell Casting Error")
            }
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "moreTextCell", for: indexPath) as? MoreTextTableViewCell else{
                fatalError("Cell Casting Error")
            }
            return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "similarZatchCell", for: indexPath) as? SimilarZatchTableViewCell else{
                fatalError("Cell Casting Error")
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}

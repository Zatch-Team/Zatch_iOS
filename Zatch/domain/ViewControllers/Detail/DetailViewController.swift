//
//  DetailViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit

class DetailViewController: BaseViewController {
    
    var backTableView : UITableView!
    
    let bottomView = BottomFixView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backTableView = UITableView().then{
            $0.separatorStyle = .none
            $0.allowsSelection = false
            $0.contentInset = UIEdgeInsets(top: -48, left: 0, bottom: 0, right: 0);
            
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(DetailImageTableViewCell.self, forCellReuseIdentifier: "imageViewCell")
            $0.register(FirstWantTableViewCell.self, forCellReuseIdentifier: "firstWantCell")
            $0.register(WantElseTableViewCell.self, forCellReuseIdentifier: "wantElseCell")
            $0.register(ProductInfoTableViewCell.self, forCellReuseIdentifier: "productInfoCell")
            $0.register(MoreTextTableViewCell.self, forCellReuseIdentifier: "moreTextCell")
            $0.register(SimilarZatchTableViewCell.self, forCellReuseIdentifier: "similarZatchCell")
            
        }
        
        setUpView()
        setUpConstraint()
    }
    
    private func setUpView(){
        self.view.addSubview(backTableView)
        self.view.addSubview(bottomView)
        super.view.bringSubviewToFront(super.navigationView)
    }
    
    private func setUpConstraint(){
        
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

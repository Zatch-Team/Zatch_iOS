//
//  MainViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/03/16.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var townText: UILabel!
    @IBOutlet weak var townButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true

        tableView.delegate = self
        tableView.dataSource = self
        
        let zatchCellNib: UINib = UINib(nibName: "MainZatchTableViewCell", bundle: nil)
        tableView.register(zatchCellNib, forCellReuseIdentifier: "mainZatchTableCell")
        
        let gatchCellNib : UINib = UINib(nibName: "MainGatchTableViewCell", bundle: nil)
        tableView.register(gatchCellNib, forCellReuseIdentifier: "mainGatchTableCell")
        
        tableView.showsVerticalScrollIndicator = false
    
        townButton.setTitle("", for: .normal)
        searchButton.setTitle("", for: .normal)
        notificationButton.setTitle("", for: .normal)
        
    }

    // MARK: - Navigation
    
    @IBAction func moveSearchVC(_ sender: UIButton){
        let nextVC = MySearchViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}

//MARK: Extension

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        var cell: UITableViewCell!
        switch (indexPath.section) {
        case 0,2:
            cell = tableView.dequeueReusableCell(withIdentifier: "mainZatchTableCell", for: indexPath)
            break
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: "mainGatchTableCell", for: indexPath)
            break
        default:
            cell = UITableViewCell()
            break
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
}

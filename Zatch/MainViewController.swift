//
//  MainViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/03/16.
//

import UIKit

class MainViewController: ViewController {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib: UINib = UINib(nibName: "MainZatchTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "mainZatchTableCell")
        tableView.showsVerticalScrollIndicator = false
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

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
            cell = UITableViewCell()
            break
        default:
            cell = UITableViewCell()
            break
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
}

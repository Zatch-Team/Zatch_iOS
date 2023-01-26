//
//  ZatchChattingListViewController.swift
//  Zatch
//
//  Created by gomin on 2023/01/04.
//

import UIKit

class ZatchChattingListViewController: UIViewController, SelectedTableViewCellDeliver {
    //MARK: - Properties
    var tableView : UITableView!
    
    var chattingList = [1,2,3,4,5] //
    
    var clampCell : IndexPath = [0,-1]

    override func viewDidLoad() {
        super.viewDidLoad()

        setInitSetting()
        setUpView()
        setUpConstraint()
    }
    

    @objc
    func cellWillClamp(_ indexPath: IndexPath){
        
        //1. 기존 고정 cell 존재 여부 점검 (row 값 -1인지 아닌지)
        if(clampCell == indexPath){
            return
        }else if(clampCell.row != -1){
        //2. -1 아닐 경우 -> 이미 고정되어 있는 cell 존재 -> 고정 풀기
            guard let cell = tableView.cellForRow(at: clampCell)
                    as? ChattingListTableViewCell else{ return }
            cell.cellWillMoveOriginalPosition()
        }
        //row 값 -1일 때와, row 값 -1 아닐 때 공통 코드(즉, 자기 자신 아닐 때만 제외)
        clampCell = indexPath
    }
    
    @objc
    func cellWillMoveToOriginalPosition(){
        guard let cell = tableView.cellForRow(at: clampCell) as? ChattingListTableViewCell else { return }
        cell.cellWillMoveOriginalPosition()
    }
    func setInitSetting(){
        tableView = UITableView().then{
            
            $0.separatorStyle = .none
            $0.backgroundColor = .transparent
            
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(ChattingListTableViewCell.self, forCellReuseIdentifier: ChattingListTableViewCell.cellIdentifier)
            
//            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cellWillMoveToOriginalPosition)))
        }
    }

    func setUpView(){
        self.view.addSubview(tableView)
    }
    
    func setUpConstraint(){
        
        self.tableView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
extension ZatchChattingListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chattingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChattingListTableViewCell.cellIdentifier, for: indexPath) as? ChattingListTableViewCell else { fatalError() }
        cell.setIfZatch(true)
        cell.delegate = self
        cell.navigationController = self.navigationController
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        print("select") //TODO: view 전체에 gesture로 cellWillMoveToOriginalPosition 설정해놔서 실행X
//        let vc = ChattingRoomViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

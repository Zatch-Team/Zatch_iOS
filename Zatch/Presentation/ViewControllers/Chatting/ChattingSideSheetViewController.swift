//
//  ChattingSideSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/21.
//

import UIKit

class ChattingSideSheetViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //MARK: - Properties
    var declarationHandler: ((IndexPath) -> Void)?
    
    let mainView = ChattingSideSheetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        initialzie()
    }

    private func style(){
        view.backgroundColor = .white
    }
    
    private func initialzie(){
        mainView.tableView.separatorStyle = .none
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    private func layout(){
        view.addSubview(mainView)
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(Const.Offset.headerTop)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    @objc func declarationBtnDidClicked(_ sender: UIButton){
        
        let cell = sender.superview?.superview?.superview as! ChattingMemberTableViewCell

        let index = mainView.tableView.indexPath(for: cell)

        self.declarationHandler!(index!)
    }
    
}

extension ChattingSideSheetViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChattingMemberTableViewCell.cellIdentifier, for: indexPath) as? ChattingMemberTableViewCell else{
                fatalError()
            }
            cell.setMeTag()
            cell.setCrownImage() // TODO: - 방장 데이터 불러오면 선언 위치 바꾸기
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ChattingMemberTableViewCell.cellIdentifier, for: indexPath) as? ChattingMemberTableViewCell else{
                fatalError()
            }
            cell.setDeclarationBtn()
            cell.declarationBtn.addTarget(self, action: #selector(declarationBtnDidClicked), for: .touchUpInside)
            return cell
        }
    }
}

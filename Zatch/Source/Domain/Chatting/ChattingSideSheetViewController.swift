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
    
    //MARK: - UI

    let sheetTitle = UILabel().then{
        $0.text = "채팅 참여자"
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
        $0.textColor = .black85
    }
    
    var tableView: UITableView!
    
    let borderLine = UIView().then{
        $0.backgroundColor = .black5
    }
    
    let exitFrame = UIView()
    
    let exitImage = UIImageView().then{
        $0.image = UIImage(named: "chat_exit")
    }
    
    let exitTitle = UILabel().then{
        $0.text = "채팅 나가기"
        $0.font = UIFont.pretendard(size: 14, family: .Medium)
        $0.textColor = .black85
        $0.isUserInteractionEnabled = true
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        tableView = UITableView().then{
            $0.separatorStyle = .none
            
            $0.isScrollEnabled = false
            
            $0.delegate = self
            $0.dataSource = self
            
            $0.register(ChattingMemberTableViewCell.self, forCellReuseIdentifier: ChattingMemberTableViewCell.cellIdentifier)
        }
        
        setUpView()
        setUpConstraint()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(exitBtnDidClicked))
        exitTitle.addGestureRecognizer(tapGesture)
        print(exitTitle.gestureRecognizers)
    }
    
    func setUpView(){
        
        self.view.addSubview(sheetTitle)
        self.view.addSubview(tableView)
        self.view.addSubview(exitFrame)
        
        self.exitFrame.addSubview(borderLine)
        self.exitFrame.addSubview(exitImage)
        self.exitFrame.addSubview(exitTitle)
    }
    
    func setUpConstraint(){
        
        sheetTitle.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(63)
            make.leading.equalToSuperview().offset(20)
        }
        
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(sheetTitle.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(exitFrame.snp.top)
        }
        
        exitFrame.snp.makeConstraints{ make in
            make.height.equalTo(48)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        borderLine.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        
        exitImage.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }
        
        exitTitle.snp.makeConstraints{ make in
            make.leading.equalTo(exitImage.snp.trailing).offset(4)
            make.centerY.equalToSuperview()
        }
    }
    
    @objc func declarationBtnDidClicked(_ sender: UIButton){
        
        let cell = sender.superview?.superview?.superview as! ChattingMemberTableViewCell

        let index = self.tableView.indexPath(for: cell)

        self.declarationHandler!(index!)
        self.dismiss(animated: true)
    }
    
    @objc func exitBtnDidClicked(){
        self.dismiss(animated: true)
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

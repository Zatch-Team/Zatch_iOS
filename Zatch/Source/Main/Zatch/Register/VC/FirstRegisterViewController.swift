//
//  RegisterViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/11.
//

import UIKit

class FirstRegisterViewController: UIViewController {
    
    var navigationView : NavigationView!
    
    let topView = TitleView()
    
    let backTableView = UITableView()
    
    let nextButton = PurpleButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationView = NavigationView(frame: .zero, navigationController: self.navigationController).then{
            $0.navigationTitle.text = "재치 등록하기"
        }

        setUpView()
        setUpConstraint()
        setUpValue()
        
        backTableView.delegate = self
        backTableView.dataSource = self

        backTableView.allowsSelection = false
        backTableView.separatorStyle = .none
        backTableView.showsVerticalScrollIndicator = false
        backTableView.isScrollEnabled = false
        
        backTableView.register(CategoryUIView.self, forCellReuseIdentifier: "CategoryUIView")
        backTableView.register(ProductInputUIView.self, forCellReuseIdentifier: "ProductInputUIView")
        backTableView.register(ImageAddTableViewCell.self, forCellReuseIdentifier: "ImageAddTableViewCell")
        backTableView.register(FirstProductInfoTableViewCell.self, forCellReuseIdentifier: "FirstProductInfoCell")
    }
    
    func setUpView(){
        self.view.addSubview(navigationView)
        self.view.addSubview(topView)
        self.view.addSubview(backTableView)
        self.view.addSubview(nextButton)
    }
    
    func setUpConstraint(){
        
        navigationView.snp.makeConstraints{ make in
            make.top.leading.trailing.equalToSuperview()
        }
        
        topView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.top.equalTo(navigationView.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        
        backTableView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
            make.bottom.equalTo(nextButton.snp.top).offset(-40)
        }
        
        nextButton.snp.makeConstraints{ make in
            make.leading.equalToSuperview().offset(74)
            make.trailing.equalToSuperview().offset(-74)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-40)
            make.top.equalTo(backTableView.snp.bottom).offset(40)
        }
    }
    
    func setUpValue(){
        
        topView.titleLabel.text = "주고 싶은\n물건이 무엇인가요?"
        
        nextButton.setTitle("다음 단계로", for: .normal)
        
    }

}

extension FirstRegisterViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        }else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryUIView", for: indexPath) as? CategoryUIView else{ fatalError("Cell Casting Error")}
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductInputUIView", for: indexPath) as? ProductInputUIView else{ fatalError("Cell Casting Error")}
                return cell
            case 2:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageAddTableViewCell", for: indexPath) as? ImageAddTableViewCell else{ fatalError("Cell Casting Error")}
                return cell
            default:
                fatalError("index error")
            }
        }else{
            switch indexPath.row {
            case 0:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryUIView", for: indexPath) as? CategoryUIView else{ fatalError("Cell Casting Error")}
                cell.categoryText.text = "입력사항 더보기"
                return cell
            case 1:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "FirstProductInfoCell", for: indexPath) as? FirstProductInfoTableViewCell else{ fatalError("Cell Casting Error")}
                return cell
            default:
                fatalError("index error")
            }
        }
    }
    
}


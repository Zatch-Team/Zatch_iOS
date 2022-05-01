//
//  SearchResultViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/01.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    //MARK: UIComponent
    
    let backButton: UIButton = {
        let backButton = UIButton()
        backButton.setImage(UIImage(named: "arrow_left"), for: .normal)
        return backButton
    }()
    
    let topView = UIView()
    
    let myZatch : UILabel = {
        let label = UILabel()
        label.text = "생수"
        label.textAlignment = .right
        label.textColor = .black85
        label.font = UIFont.pretendard(size: 16, family: .Bold)
        return label
    }()
    
    let wantZatch : UILabel = {
        let label = UILabel()
        label.text = "라면"
        label.textColor = .black85
        label.font = UIFont.pretendard(size: 16, family: .Bold)
        return label
    }()
    
    let exchangeImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "exchange_vertical")
        image.snp.makeConstraints{ make in
            make.size.equalTo(CGSize(width: 24, height: 24))
        }
        return image
    }()
    
    let myCategoryButton : UIButton = {
        let button = UIButton()
        button.setTitle("category1", for: .normal)
        return button
    }()
    
    let wantCategoryButton : UIButton = {
        let button = UIButton()
        button.setTitle("category1", for: .normal)
        return button
    }()
    
    let townSelected = UILabel()
    let searchFilter = UILabel()
    let tableView = UITableView()
    
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        return stack
    }()
    
    let myStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()
    
    let wantStackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        return stack
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        setUpView()
        setUpConstraint()
        
    }

    
    func setUpView(){

        self.view.addSubview(topView)
        
        self.topView.addSubview(stackView)
        
        self.stackView.addArrangedSubview(myStackView)
        self.stackView.addArrangedSubview(exchangeImage)
        self.stackView.addArrangedSubview(wantStackView)
        
        self.myStackView.addArrangedSubview(myCategoryButton)
        self.myStackView.addArrangedSubview(myZatch)
    
        self.wantStackView.addArrangedSubview(wantCategoryButton)
        self.wantStackView.addArrangedSubview(wantZatch)
        
    }
    
    func setUpConstraint(){
     
        self.topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(116)
            make.width.equalToSuperview()
        }
        
        self.stackView.snp.makeConstraints{ make in
            make.center.equalToSuperview()
        }
    
        
        self.exchangeImage.snp.makeConstraints{ make in
            make.leading.equalTo(myStackView.snp.trailing)
            make.top.equalTo(myZatch)
            make.center.equalToSuperview()
        }
        
        self.myStackView.snp.makeConstraints{ make in
            make.trailing.equalTo(exchangeImage.snp.leading).offset(-12)
        }
        
        self.wantStackView.snp.makeConstraints{ make in
            make.leading.equalTo(exchangeImage.snp.trailing).offset(12)
        }
        
        self.myCategoryButton.snp.makeConstraints { make in
            make.top.equalTo(myStackView)
        }
        
        self.myZatch.snp.makeConstraints { make in
            make.top.equalTo(myCategoryButton)
        }
        
        self.wantCategoryButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
    
        }
        
        self.wantZatch.snp.makeConstraints { make in
            make.top.equalTo(wantCategoryButton)
            make.leading.equalToSuperview()
        }
        
        
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

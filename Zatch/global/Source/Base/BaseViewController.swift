//
//  BaseViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/06.
//

import UIKit

class BaseViewController: UIViewController {
    
    //MARK: - Generator
    
    init(){
        super.init(nibName: nil, bundle: nil)
        self.viewDidLoad()
    }
    
    init(title: String){
        super.init(nibName: nil, bundle: nil)
        self.viewDidLoad()
        self.rightPositionBtn = EtcButton(title: title)
    }
    
    init(btnImage: UIImage){
        super.init(nibName: nil, bundle: nil)
        self.viewDidLoad()
        self.rightPositionBtn = EtcButton(image: btnImage)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Properties
    
    let navigationView = UIView()
    
    lazy var backBtn = UIButton().then{
        $0.setImage(UIImage(named: "arrow_left"), for: .normal)
        $0.isUserInteractionEnabled = true
        $0.addTarget(self, action: #selector(backBtnDidClicked), for: .touchUpInside)
    }
    
    lazy var navigationTitle = UILabel().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    lazy var rightPositionBtn: EtcButton? = nil{
        didSet{
            settingRightPostionBtn()
        }
    }
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        
        super.viewDidLoad()

        style()
        initialize()
        layout()
    }
    
    func style() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .white
    }
    
    func initialize() {}
    
    func layout() {
        
        self.view.addSubview(navigationView)
        
        navigationView.addSubview(backBtn)
        
        navigationView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(44)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(56)
        }
        
        backBtn.snp.makeConstraints{ make in
            make.width.equalTo(backBtn.snp.height)
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    //MARK: - Action
    
    @objc func backBtnDidClicked(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func rightPositionBtnDidClicked(){
        print("right position btn did clicked")
    }
    
    //MARK: - Method
    
    func addRightTopBtn(title: String){
        self.rightPositionBtn = EtcButton(title: title)
    }
    
    func addRightTopBtn(image: UIImage){
        self.rightPositionBtn = EtcButton(image: image)
    }
    
    func settingRightPostionBtn(){
        
        guard let rightPositionBtn = rightPositionBtn else {
            return
        }
        
        navigationView.addSubview(rightPositionBtn)
        
        rightPositionBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(rightPositionBtn.snp.height)
        }
        
        rightPositionBtn.addTarget(self, action: #selector(rightPositionBtnDidClicked), for: .touchUpInside)
    }
}

extension BaseViewController{
    
    class EtcButton: UIButton{
        
        init(title: String){
            super.init(frame: .zero)
            
            self.setTitle(title, for: .normal)
            self.titleLabel?.textAlignment = .center
            self.titleLabel?.font = UIFont.pretendard(size: 16, family: .Bold)
            self.setTitleColor(.black85, for: .normal)
            self.titleEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 4, right: 0)
        }
        
        init(image: UIImage){
            super.init(frame: .zero)
            self.setImage(image, for: .normal)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

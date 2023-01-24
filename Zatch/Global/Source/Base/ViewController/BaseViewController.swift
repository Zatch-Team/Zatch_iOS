//
//  BaseViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/06.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController, DefaultObservable {
    
    //MARK: - Properties
    
    let navigationView = UIView()
    
    lazy var backBtn = UIButton().then{
        $0.setImage(Image.arrowLeft, for: .normal)
        $0.isUserInteractionEnabled = true
        $0.addTarget(self, action: #selector(backBtnDidClicked), for: .touchUpInside)
    }
    
    lazy var navigationTitle = UILabel().then{
        $0.font = UIFont.pretendard(size: 16, family: .Bold)
    }
    
    lazy var rightPositionButton: EtcButton? = nil{
        didSet{
            settingRightPostionBtn()
        }
    }
    
    final var disposeBag = DisposeBag()
    
    //MARK: - Generator
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    init(rightButton: String){
        super.init(nibName: nil, bundle: nil)
        self.rightPositionButton = EtcButton(title: rightButton)
    }
    
    init(rightButton: UIImage){
        super.init(nibName: nil, bundle: nil)
        self.rightPositionButton = EtcButton(image: rightButton)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        
        super.viewDidLoad()

        style()
        layout()
        initialize()
        bind()
    }
    
    func style() {
        self.view.backgroundColor = .white
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func layout() {
        
        self.view.addSubview(navigationView)
        navigationView.addSubview(backBtn)
        
        navigationView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(44)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        backBtn.snp.makeConstraints{ make in
            make.width.equalTo(backBtn.snp.height)
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(14)
            make.centerY.equalToSuperview()
        }
    }
    
    func initialize() {}
    
    func bind() { }
    
    //MARK: - Action
    
    @objc func backBtnDidClicked(){
        self.navigationController?.popViewController(animated: true)
    }
    
    //TODO: 제거
    @objc func rightPositionBtnDidClicked(){
        print("right position btn did clicked")
    }
    
    //MARK: - Method
    
    private final func settingRightPostionBtn(){
        
        guard let rightPositionBtn = rightPositionButton else { return }
        
        navigationView.addSubview(rightPositionBtn)
        
        rightPositionBtn.snp.makeConstraints{
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalToSuperview().offset(14)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(rightPositionBtn.snp.height)
        }

        rightPositionBtn.addTarget(self, action: #selector(rightPositionBtnDidClicked), for: .touchUpInside)
    }
}

//extension BaseViewController{
    
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
//}

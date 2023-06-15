//
//  DeclarationAlertViewController.swift
//  Zatch
//
//  Created by 박소윤 on 2023/06/13.
//

import Foundation
import RxCocoa
import RxSwift

protocol AlertConfirmable{
    var complete: Observable<Void> { get }
    var completeBtn: UIButton { get }
}

extension AlertConfirmable where Self: UIViewController{
    var complete: Observable<Void> {
        completeBtn.rx.tap
            .do{ [weak self] _ in
                self?.dismiss(animated: false)
            }.share()
    }
}

protocol AlertCancelable{
    var cancelBtn: UIButton { get }
}

extension AlertCancelable where Self: UIViewController{
    func addCancelTarget(){
        cancelBtn.rx.tap
            .subscribe{ [weak self] _ in
                self?.dismiss(animated: false)
            }.disposed(by: DisposeBag())
    }
}

class BaseAlertViewController: UIViewController{
    
    static func fillConfiguration(title: String) -> UIButton{
        var attributedString = AttributedString(title)
        attributedString.font = UIFont.pretendard(size: 16, family: .Bold)
        attributedString.foregroundColor = .white
        
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .zatchPurple
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16)
        configuration.cornerStyle = .capsule
        configuration.attributedTitle = attributedString
        return UIButton(configuration: configuration)
    }
    
    static func plainConfiguration(title: String) -> UIButton{
        var attributedString = AttributedString(title)
        attributedString.font = UIFont.pretendard(size: 16, family: .Bold)
        attributedString.foregroundColor = .zatchPurple
        
        var configuration = UIButton.Configuration.filled()
        configuration.baseBackgroundColor = .white
        configuration.attributedTitle = attributedString

        return UIButton(configuration: configuration)
    }
    
    let containerView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4).cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 8
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    }
    
    let buttonStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.spacing = 40
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseUI()
        style()
        hierarchy()
        layout()
        initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseOut) { [weak self] in
            self?.containerView.transform = .identity
            self?.containerView.isHidden = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn) { [weak self] in
            self?.containerView.transform = .identity
            self?.containerView.isHidden = true
        }
    }
    
    private func baseUI(){
        view.addSubview(containerView)
        containerView.addSubview(buttonStackView)
        containerView.snp.makeConstraints{
            $0.centerY.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(52)
        }
    }
    
    private func style(){
        view.backgroundColor = .popupBackgroundColor
    }
    
    private func addDismissGesture(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissAlertController))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func dismissAlertController(){
        dismiss(animated: false, completion: nil)
    }
    
    func hierarchy() { }
    
    func layout() { }
    
    func initialize() { }
    
    @discardableResult
    func show(in viewController: UIViewController) -> Self{
        modalPresentationStyle = .overFullScreen
        viewController.present(self, animated: false, completion: nil)
        print("??")
        return self
    }
    
}

extension BaseAlertViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard touch.view?.isDescendant(of: containerView) == false else { return false }
        return true
    }
}


class DeclarationAlertViewController: BaseAlertViewController, AlertConfirmable, AlertCancelable{
    
    lazy var completeBtn: UIButton = BaseAlertViewController.fillConfiguration(title: "신고")
    lazy var cancelBtn: UIButton = BaseAlertViewController.plainConfiguration(title: "취소")
    
    var targetUserName: String!{
        didSet{
            guard let targetUserName = targetUserName else { return }
            titleLabel.text = "\(targetUserName)님을 신고하시겠습니까?\n고객센터로 요청이 접수됩니다."
        }
    }
    
    var complete: Observable<Int> {
        completeBtn.rx.tap
            .do{ [weak self] _ in
                self?.dismiss(animated: false)
            }.map{ _ in
                self.declarationChoiceRelay.value
            }
    }
    
    private let declarationChoiceRelay = BehaviorRelay(value: 1)
    
    private let titleLabel = UILabel().then{
        $0.setTypoStyleWithMultiLine(typoStyle: .medium15_19)
        $0.textColor = .black85
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.lineBreakMode = .byCharWrapping
    }
    
    private let radioStackView = UIStackView().then{
        $0.spacing = 8
        $0.axis = .vertical
    }
    
    override func hierarchy() {
        containerView.addSubview(titleLabel)
        containerView.addSubview(radioStackView)
        buttonStackView.addArrangedSubview(cancelBtn)
        buttonStackView.addArrangedSubview(completeBtn)
    }
    
    override func layout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(34)
            $0.centerX.equalToSuperview()
        }
        radioStackView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().offset(20)
        }
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(radioStackView.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
        }
    }
    
    override func initialize() {
        let configuration = ZatchComponent.RadioConfiguration(typo: .medium15_19, imageSize: 20)
        for (id,choice) in ["불쾌한 발언 및 욕설", "희롱 및 괴롭힘", "원치 않는 상업성 콘텐츠 또는 스팸", "기타"].enumerated(){
            let choiceView = ZatchComponent.RadioButtonView(configuration: configuration, tag: id+1)
            choiceView.setTitle(choice)
            choiceView.radioButton.addTarget(self, action: #selector(changeChoice), for: .touchUpInside)
            radioStackView.addArrangedSubview(choiceView)
        }
        (radioStackView.viewWithTag(declarationChoiceRelay.value) as? UIButton)?.isSelected = true
    }
    
    @objc private func changeChoice(_ sender: UIButton){
        (radioStackView.viewWithTag(declarationChoiceRelay.value) as? UIButton)?.isSelected = false
        sender.isSelected = true
        declarationChoiceRelay.accept(sender.tag)
    }
    
}

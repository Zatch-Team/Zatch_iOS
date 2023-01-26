//
//  MyZatchTabmanViewController.swift
//  Zatch
//
//  Created by gomin on 2022/10/26.
//

import UIKit
import Tabman
import Pageboy

class MyZatchTabmanViewController: TabmanViewController {
    private var viewControllers: Array<UIViewController> = []
    var tabBar: TMBar.ButtonBar!
    var floatingButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let zatchVC = MyZatchChildViewController()
        let gatchVC = GatchViewController()
        viewControllers.append(zatchVC)
        viewControllers.append(gatchVC)
        
        self.dataSource = self

        setUpTabmanBar()
        setFloatingButton()
    }
}
extension MyZatchTabmanViewController {
    func setUpTabmanBar() {
        // 바 생성 + tabbar 에 관한 디자인처리를 여기서 하면 된다.
        tabBar = TMBar.ButtonBar().then{
            // bar 배경색
            $0.backgroundView.style = .flat(color: .white)
            $0.layout.transitionStyle = .snap
            // tab 밑 bar 색깔 & 크기
            $0.indicator.weight = .custom(value: 1.5)
            $0.indicator.tintColor = .zatchPurple
            // tap center
            $0.layout.alignment = .centerDistributed
            // tap 사이 간격
            $0.layout.interButtonSpacing = 90
            // tap 선택 / 미선택
            $0.buttons.customize { (button) in
                button.tintColor = .black20
                button.selectedTintColor = .zatchPurple
                
                button.font = UIFont.pretendard(size: 14, family: .Bold)
                button.selectedFont = UIFont.pretendard(size: 14, family: .Bold)
            }
        }
        addBar(tabBar, dataSource: self, at: .top)
    }
    func setFloatingButton() {
        floatingButton = UIButton().then{
            $0.backgroundColor = .zatchPurple
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 28
            
            $0.setImage(Image.floatingPlus, for: .normal)
            // shadow
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.masksToBounds = false
            $0.layer.shadowOffset = CGSize(width: 0, height: 3)
            $0.layer.shadowRadius = 5
            $0.layer.shadowOpacity = 0.3
        }
        self.view.addSubview(floatingButton)
        floatingButton.snp.makeConstraints { make in
            make.width.height.equalTo(56)
            make.trailing.equalToSuperview().offset(-32)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-13)
        }
        floatingButton.addTarget(self, action: #selector(addZatchButtonDidTap), for: .touchUpInside)
    }
    @objc func addZatchButtonDidTap() {
//        let vc = FirstRegisterViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
    }
}
// MARK: - TabMan delegate
extension MyZatchTabmanViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
         return .at(index: 0)
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let item = TMBarItem(title: "")
        let title: String = index == 0 ? "재치" : "가치"
        item.title = title
        return item
    }
}

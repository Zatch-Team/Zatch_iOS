//
//  ChattingListTabManViewController.swift
//  Zatch
//
//  Created by gomin on 2023/01/04.
//

import UIKit
import Tabman
import Pageboy

class ChattingListTabManViewController: TabmanViewController {
    private var viewControllers: Array<UIViewController> = []
    var tabBar: TMBar.ButtonBar!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let zatchVC = ZatchChattingListViewController()
        let gatchVC = GatchChattingListViewController()
        viewControllers.append(zatchVC)
        viewControllers.append(gatchVC)
        
        self.dataSource = self

        setUpTabmanBar()
    }

}
extension ChattingListTabManViewController {
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
            $0.layout.interButtonSpacing = 98
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
}
// MARK: - TabMan delegate
extension ChattingListTabManViewController: PageboyViewControllerDataSource, TMBarDataSource {

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

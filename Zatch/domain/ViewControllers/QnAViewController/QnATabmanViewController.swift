//
//  QnATabmanViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/27.
//

import UIKit
import UIKit
import Tabman
import Pageboy

class QnATabmanViewController: TabmanViewController {
    private var viewControllers: Array<UIViewController> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let questionVC = QuestionsViewController()
        let myQuestionVC = MyQuestionsViewController()
        viewControllers.append(questionVC)
        viewControllers.append(myQuestionVC)
        
        self.dataSource = self
        setUpTabmanBar(.zatchPurple)
    }
}
extension QnATabmanViewController {
    func setUpTabmanBar(_ color: UIColor) {
        // 바 생성 + tabbar 에 관한 디자인처리를 여기서 하면 된다.
        let bar = TMBar.ButtonBar().then{
            // bar 배경색
            $0.backgroundView.style = .flat(color: .white)
            $0.layout.transitionStyle = .snap
            // tab 밑 bar 색깔 & 크기
            $0.indicator.weight = .custom(value: 1.5)
            $0.indicator.tintColor = color
            // tap center
            $0.layout.alignment = .centerDistributed
            // tap 사이 간격
            $0.layout.interButtonSpacing = 90
            // tap 선택 / 미선택
            $0.buttons.customize { (button) in
                button.tintColor = .black20
                button.selectedTintColor = color
                
                button.font = UIFont.pretendard(size: 14, family: .Bold)
                button.selectedFont = UIFont.pretendard(size: 14, family: .Bold)
            }
        }
        addBar(bar, dataSource: self, at: .top)
    }
}
// MARK: - TabMan delegate
extension QnATabmanViewController: PageboyViewControllerDataSource, TMBarDataSource {

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
        switch index {
        case 0:
            item.title = "1:1 문의하기"
        default:
            item.title = "나의 문의내역"
        }
        return item
    }
}

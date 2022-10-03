//
//  ServiceCenterTabmanViewController.swift
//  Zatch
//
//  Created by gomin on 2022/10/03.
//

import UIKit
import Tabman
import Pageboy

class ServiceCenterTabmanViewController: TabmanViewController {
    private var viewControllers: Array<UIViewController> = []
    var searchWord: String!
    
    var policyVC: PolicyViewController!
    var accountVC: AccountViewController!
    var tradeVC: TradeViewController!
    var etcVC: EtcViewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        policyVC = PolicyViewController()
        accountVC = AccountViewController()
        tradeVC = TradeViewController()
        etcVC = EtcViewController()
        
        viewControllers.append(policyVC)
        viewControllers.append(accountVC)
        viewControllers.append(tradeVC)
        viewControllers.append(etcVC)
        
        self.dataSource = self
        setUpTabmanBar(.zatchPurple)
    }
    override func viewDidAppear(_ animated: Bool) {
        // 검색 결과값
        if let word = self.searchWord {
            policyVC.searchWord = self.searchWord
            // TODO: 검색어 결과값 구현
            policyVC.faqModel.removeAll()
            policyVC.faqTableView.reloadData()
        }
        
    }
}
extension ServiceCenterTabmanViewController {
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
            $0.layout.interButtonSpacing = 32
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
extension ServiceCenterTabmanViewController: PageboyViewControllerDataSource, TMBarDataSource {

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
            item.title = "운영 정책"
        case 1:
            item.title = "계정 인증"
        case 2:
            item.title = "거래 품목"
        default:
            item.title = "기타 문의"
        }
        return item
    }
}

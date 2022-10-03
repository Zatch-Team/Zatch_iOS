//
//  PolicyViewController.swift
//  Zatch
//
//  Created by gomin on 2022/10/03.
//

import UIKit

class PolicyViewController: UIViewController {
    // MARK: - Views
    var faqTableView: UITableView!
    var faqModel: [FAQModel] = []
    var searchWord: String!
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setTempData()
    }
    // MARK: - Functions
    func setUpView() {
        faqTableView = UITableView()
        faqTableView.then{
            $0.delegate = self
            $0.dataSource = self
            $0.register(FAQTableViewCell.self, forCellReuseIdentifier: "FAQTableViewCell")
            $0.register(FAQAnswerTableViewCell.self, forCellReuseIdentifier: "FAQAnswerTableViewCell")
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        self.view.addSubview(faqTableView)
        setUpConstraint()
    }
    func setUpConstraint() {
        faqTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
    }
}
// MARK: - TableView delegate
extension PolicyViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        let count = self.faqModel.count ?? 0
        if count == 0 {
            if let searchword = self.searchWord {showEmptyView(keyword: self.searchWord)}
        }
        else {hideEmptyView()}
        return count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if faqModel[section].isOpened == true {
            // tableView Section이 열려있으면 Section Cell 하나에 sectionData 개수만큼 추가해줘야 함
            return 2
        } else {
            // tableView Section이 닫혀있을 경우에는 Section Cell 하나만 보여주면 됨
            return 1
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     // section 부분 코드
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FAQTableViewCell", for: indexPath)
                    as? FAQTableViewCell else { return UITableViewCell() }
            cell.setUpContent(faqModel[indexPath.section])
            cell.selectionStyle = .none
            return cell
            
        // sectionData 부분 코드
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FAQAnswerTableViewCell", for: indexPath)
                    as? FAQAnswerTableViewCell else { return UITableViewCell() }
            cell.setCellData(faqModel[indexPath.section])
            cell.selectionStyle = .none
            return cell
        }
            
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 셀 선택 시 회색에서 다시 변하게 해주는 것
        tableView.deselectRow(at: indexPath, animated: true)
        // section 부분 선택하면 열리게 설정
        if indexPath.row == 0 {
            // section이 열려있다면 다시 닫힐 수 있게 해주는 코드
            faqModel[indexPath.section].isOpened! = !faqModel[indexPath.section].isOpened!
            
            // 모든 데이터를 새로고침하는 것이 아닌 해당하는 섹션 부분만 새로고침
            tableView.reloadSections([indexPath.section], with: .none)
        // answerData 부분을 선택하면 아무 작동하지 않게 설정
        } else {
            print("안 열림")
        }
    }
    // 임시 데이터
    func setTempData() {
        self.faqModel.append(FAQModel(isOpened: false, questionTitle: "FAQ 01", answerContent: "해당 FAQ에 대한 내용이 뜨는 자리입니다. 현재 사이즈가 최소 사이즈이며, FAQ 내용 길이에 맞춰서 사이즈가 아래로 길어지는 영역입니다. 제목 영역을 다시 클릭하거나, 다른 제목을 클릭할 경우 해당 영역은 접히게 됩니다."))
        
        self.faqTableView.reloadData()
    }
}

struct FAQModel {
    var isOpened: Bool?
    let questionTitle: String?
    let answerContent: String?
}
// MARK: Empty View
extension PolicyViewController {
    func showEmptyView(keyword: String) {
        let searchLabel = UILabel().then{
            $0.font = UIFont.pretendard(size: 16, family: .Medium)
            $0.textColor = .black85
            $0.textAlignment = .center
            $0.text = "”\(keyword)”에 대한\n검색결과가 없습니다."
            $0.numberOfLines = 0
            $0.sizeToFit()
            
            $0.asColorAndFont(targetString: "”\(keyword)”", color: .black85, font: UIFont.pretendard(size: 16, family: .Bold))
        }
        let subView = UIView().then{
            $0.backgroundColor = .black5
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 14
        }
        let titleLabel = UILabel().then{
            $0.text = "찾고 싶은 내용이 없다면?"
            $0.font = UIFont.pretendard(size: 14, family: .Bold)
        }
        let subTitleLabel = UILabel().then{
            $0.text = "1:1 문의를 통해 자세한 답변을 얻어보세요!"
            $0.font = UIFont.pretendard(size: 14, family: .Regular)
        }
        
        let backgroudView = UIView(frame: CGRect(x: 0, y: 0, width: faqTableView.bounds.width, height: faqTableView.bounds.height))
        backgroudView.addSubview(searchLabel)
        backgroudView.addSubview(subView)
        subView.addSubview(titleLabel)
        subView.addSubview(subTitleLabel)
        
        searchLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        subView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-24)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(12)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview().inset(12)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        faqTableView.backgroundView = backgroudView
    }
    func hideEmptyView() {
        let subView = UIView().then{
            $0.backgroundColor = .black5
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 14
        }
        let titleLabel = UILabel().then{
            $0.text = "찾고 싶은 내용이 없다면?"
            $0.font = UIFont.pretendard(size: 14, family: .Bold)
        }
        let subTitleLabel = UILabel().then{
            $0.text = "1:1 문의를 통해 자세한 답변을 얻어보세요!"
            $0.font = UIFont.pretendard(size: 14, family: .Regular)
        }
        
        let backgroudView = UIView(frame: CGRect(x: 0, y: 0, width: faqTableView.bounds.width, height: faqTableView.bounds.height))
        backgroudView.addSubview(subView)
        subView.addSubview(titleLabel)
        subView.addSubview(subTitleLabel)
        
        subView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-24)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(12)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview().inset(12)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
        }
        
        faqTableView.backgroundView = backgroudView
    }
}

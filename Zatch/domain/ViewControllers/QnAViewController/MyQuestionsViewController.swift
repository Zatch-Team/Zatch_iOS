//
//  MyQuestionsViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/27.
//

import UIKit

class MyQuestionsViewController: UIViewController {
    // MARK: - Views
    var myQuestionTableView: UITableView!
    var qnaModel: [QnAModel] = []
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        setTempData()
    }
    // MARK: - Functions
    func setUpView() {
        myQuestionTableView = UITableView()
        myQuestionTableView.then{
            $0.delegate = self
            $0.dataSource = self
            $0.register(MyQuestionTableViewCell.self, forCellReuseIdentifier: "MyQuestionTableViewCell")
            $0.register(AnswerTableViewCell.self, forCellReuseIdentifier: "AnswerTableViewCell")
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        self.view.addSubview(myQuestionTableView)
        setUpConstraint()
    }
    func setUpConstraint() {
        myQuestionTableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
    }
}
// MARK: - TableView delegate
extension MyQuestionsViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        let count = self.qnaModel.count ?? 0
        return count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if qnaModel[section].isOpened == true {
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
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyQuestionTableViewCell", for: indexPath)
                    as? MyQuestionTableViewCell else { return UITableViewCell() }
            cell.setUpContent(qnaModel[indexPath.section])
            cell.selectionStyle = .none
            return cell
            
        // sectionData 부분 코드
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerTableViewCell", for: indexPath)
                    as? AnswerTableViewCell else { return UITableViewCell() }
            if let cellData = qnaModel[indexPath.section].answerData {
                cell.setCellData(cellData)
            }
            cell.selectionStyle = .none
            return cell
        }
            
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 셀 선택 시 회색에서 다시 변하게 해주는 것
        tableView.deselectRow(at: indexPath, animated: true)
        // section 부분 선택하면 열리게 설정
        if indexPath.row == 0 && (qnaModel[indexPath.section].isAnswered == true) {
            // section이 열려있다면 다시 닫힐 수 있게 해주는 코드
            qnaModel[indexPath.section].isOpened! = !qnaModel[indexPath.section].isOpened!
            
            // 모든 데이터를 새로고침하는 것이 아닌 해당하는 섹션 부분만 새로고침
            tableView.reloadSections([indexPath.section], with: .none)
        // answerData 부분을 선택하면 아무 작동하지 않게 설정
        } else {
            print("안 열림")
        }
    }
    // 임시 데이터 
    func setTempData() {
        self.qnaModel.append(QnAModel(isOpened: false, isAnswered: true, questionTitle: "question1", answerData: AnswerModel(questionTitle: "question1", questionContent: "content", answerTitle: "answer1", answerContent: "content")))
        self.qnaModel.append(QnAModel(isOpened: false, isAnswered: false, questionTitle: "question2", answerData: nil))
        self.qnaModel.append(QnAModel(isOpened: false, isAnswered: true, questionTitle: "제목이 길어지면 길어지면 길어지면 길어지면 길어지면 길어지면 길어지면", answerData: AnswerModel(questionTitle: "제목이 길어지면 길어지면 길어지면 길어지면 길어지면 길어지면 길어지면", questionContent: "해당 1:1 문의 내용이 뜨는 자리입니다. 현재 사이즈가 최소 사이즈이며, 1:1 문의 내용 길이에 맞춰서 사이즈가 아래로 길어지는 영역입니다. 제목 영역을 다시 클릭하거나, 다른 제목을 클릭할 경우 해당 영역은 접히게 됩니다.", answerTitle: "제목이 길어지면 길어지면 길어지면 길어지면 길어지면 길어지면 길어지면", answerContent: "해당 1:1 문의 내용이 뜨는 자리입니다. 현재 사이즈가 최소 사이즈이며, 1:1 문의 내용 길이에 맞춰서 사이즈가 아래로 길어지는 영역입니다. 제목 영역을 다시 클릭하거나, 다른 제목을 클릭할 경우 해당 영역은 접히게 됩니다.")))
        self.qnaModel.append(QnAModel(isOpened: false, isAnswered: false, questionTitle: "question4", answerData: nil))
        
        self.myQuestionTableView.reloadData()
    }
}

struct QnAModel {
    var isOpened: Bool?
    var isAnswered: Bool?
    let questionTitle: String?
    let answerData: AnswerModel?
}
struct AnswerModel {
    let questionTitle: String?
    let questionContent: String?
    let answerTitle: String?
    let answerContent: String?
}

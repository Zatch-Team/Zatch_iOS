//
//  QuestionsViewController.swift
//  Zatch
//
//  Created by gomin on 2022/09/27.
//

import UIKit

class QuestionsViewController: UIViewController {
    // MARK: - Views
    var questionTableView: UITableView!
    let completeButton = Purple36Button(title: "문의 등록하기")
    
    // MARK: - Life Cycles
    var textViewPlaceHolder = "내용을 입력해 주세요.\n입력시 개인 정보가 포함되지 않도록 유의해 주세요.\n(글자수 제한 : 1,000자)"
    var isCategorySelected: Bool = false
    var questionTitle: String?
    var questionContent: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    // MARK: - Functions
    func setUpView() {
        questionTableView = UITableView()
        questionTableView.then{
            $0.delegate = self
            $0.dataSource = self
            $0.register(CategorySelectTableViewCell.self, forCellReuseIdentifier: CategorySelectTableViewCell.cellIdentifier)
            $0.register(ProductInputTextFieldTabeViewCell.self, forCellReuseIdentifier: ProductInputTextFieldTabeViewCell.cellIdentifier)
            $0.register(QuestionContentTableViewCell.self, forCellReuseIdentifier: QuestionContentTableViewCell.cellIdentifier)
            
            // autoHeight
            $0.rowHeight = UITableView.automaticDimension
            $0.estimatedRowHeight = UITableView.automaticDimension
            $0.showsVerticalScrollIndicator = false
            $0.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
        
        self.view.addSubview(questionTableView)
        self.view.addSubview(completeButton)
        
        setUpConstraint()
        completeButton.addTarget(self, action: #selector(completeButtonDidTap), for: .touchUpInside)
    }
    func setUpConstraint() {
        completeButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(74)
            make.bottom.equalToSuperview().offset(-98)
        }
        questionTableView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(50)
            make.bottom.equalTo(completeButton.snp.top)
        }
    }
    // MARK: - Actions
    @objc func completeButtonDidTap() {
        // 예외처리
        // 카테고리 선택 안 했을 때
        if !isCategorySelected {
            let alert = InfoAlertViewController(message: "카테고리를 선택해주세요.")
            alert.modalPresentationStyle = .overFullScreen
            self.present(alert, animated: false, completion: nil)
        }
        // 제목을 입력하지 않았을 때
        if self.questionTitle == nil {
            let alert = InfoAlertViewController(message: "제목을 입력해주세요.")
            alert.modalPresentationStyle = .overFullScreen
            self.present(alert, animated: false, completion: nil)
        }
        // 내용을 입력하지 않았을 때
        if self.questionContent == nil {
            let alert = InfoAlertViewController(message: "내용을 입력해주세요.")
            alert.modalPresentationStyle = .overFullScreen
            self.present(alert, animated: false, completion: nil)
        }
        if isCategorySelected && self.questionTitle != nil && self.questionContent != nil {
            let alert = CancelAlertViewController(message: "1:1 문의를 정말 등록하시겠습니까?", btnTitle: "등록")
            alert.modalPresentationStyle = .overFullScreen
            self.present(alert, animated: false, completion: nil)
            
            alert.okBtn.addTarget(self, action: #selector(dialogCompleteButtonDidTap), for: .touchUpInside)
        }
    }
    @objc func titleTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.questionTitle = text
    }
    @objc func dialogCompleteButtonDidTap() {
        print("등록 clicked!")
    }
}
// MARK: - TableView delegate
extension QuestionsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CategorySelectTableViewCell.cellIdentifier, for: indexPath) as? CategorySelectTableViewCell else{ fatalError("Cell Casting Error")}
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductInputTextFieldTabeViewCell.cellIdentifier, for: indexPath) as? ProductInputTextFieldTabeViewCell else{ fatalError("Cell Casting Error")}
            cell.productName.placeholder = "제목을 입력해주세요."
            cell.productName.addTarget(self, action: #selector(titleTextFieldEditingChanged), for: .editingChanged)
            cell.selectionStyle = .none
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionContentTableViewCell.cellIdentifier, for: indexPath) as? QuestionContentTableViewCell else{ fatalError("Cell Casting Error")}
            cell.setUpTextView(delegate: self)
            cell.selectionStyle = .none
            return cell
        default:
            fatalError("index error")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.view.endEditing(true)
        
        if indexPath.row == 0 {
            let vc = CategoryBottomSheet()
            vc.categorySelectHandler = { category in
                guard let cell = tableView.cellForRow(at: indexPath) as? CategorySelectTableViewCell else{ return }
                cell.categoryText.text = category
                self.isCategorySelected = true
            }
            
            vc.loadViewIfNeeded()
            self.present(vc, animated: true, completion: nil)
        }
    }
}

// MARK: - TextView delegate
extension QuestionsViewController : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .placeholderText
            self.questionContent = nil
        }
    }
    func textViewDidChange(_ textView: UITextView) {
        let text = textView.text
        self.questionContent = text
    }
}

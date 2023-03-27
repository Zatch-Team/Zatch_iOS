//
//  SearchAddressResultBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit
import Alamofire

//TODO: WILL DELETE
class SearchAddressResultSheetViewController: BaseBottomSheetViewController<String> {
    
    //MARK: - Properties
        var addressResult = [String]()
//    var addressResult: [LocalTownResult] = []{
//        didSet{
//            self.mainView.tableView.reloadData()
//        }
//    }
    
    let mainView = SearchAddressResultView()

    init(){
        super.init(type: .makeMeeting)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override
    
    override func initialize() {
        
        super.initialize()
        
        mainView.searchTextField.delegate = self
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    override func layout() {
        
        super.layout()
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    //MARK: - API
    func requestSearchResult(query: String){
        self.mainView.searchTextField.text = query
//        KakaoLocalDataManager().getPlaceSearch(query: query, viewController: self)
    }
    
//    func successSearchAddressResult(result: [LocalTownResult]){
//        addressResult = result
//    }

}
extension SearchAddressResultSheetViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return addressResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchAddressResultTableViewCell.cellIdentifier, for: indexPath) as? SearchAddressResultTableViewCell else { fatalError() }
        
//        let data = addressResult[indexPath.row]
//        cell.locationLabel.text = data.place_name
//        cell.addressLabel.text = data.address_name
        
        return cell
    }
    
    //TODO: - 약속잡기 수정인 경우, 장소 선택시 rootVC가 MakeMeeting이 아니기 때문에 데이터 전달 오류 발생
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let makeMeetingVC: MakeMeetingSheetViewController!
        
        if let stack = self.navigationController?.viewControllers {
            
            if stack[0] is MakeMeetingSheetViewController{
                makeMeetingVC = stack[0] as? MakeMeetingSheetViewController
            } else if stack[0] is ModifyMeetingSheetViewController{
                makeMeetingVC = stack[1] as? MakeMeetingSheetViewController
            }else{
                return
            }
            
            self.navigationController?.popToViewController(viewController: makeMeetingVC, completion: {
                guard let cell = tableView.cellForRow(at: indexPath) as? SearchAddressResultTableViewCell else { return }
                makeMeetingVC.mainView.locationLabel.text = cell.locationLabel.text
            })

        }
    }
    
}


extension SearchAddressResultSheetViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        let searchLocation = textField.text ?? ""
        
        if(!searchLocation.isEmpty){
            moveSearchAddressResultSheet(searchLocation) }
        
        return true
    }
    
    func moveSearchAddressResultSheet(_ location: String){
        let vc = SearchAddressResultSheetViewController()
        vc.mainView.searchTextField.text = location
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

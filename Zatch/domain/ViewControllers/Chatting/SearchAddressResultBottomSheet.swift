//
//  SearchAddressResultBottomSheet.swift
//  Zatch
//
//  Created by 박지윤 on 2022/09/06.
//

import UIKit
import Alamofire

class SearchAddressResultBottomSheet: SheetViewController {
    
    //MARK: - Properties
    var addressResult: [LocalResult] = []{
        didSet{
            self.mainView.tableView.reloadData()
        }
    }
    
    let mainView = SearchAddressResultView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        sheetType = .MakeMeeting
        titleLabel.text = "주소검색"
        
        self.view.addSubview(mainView)
        
        mainView.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        mainView.searchTextField.delegate = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }
    
    func requestSearchResult(query: String){
        self.mainView.searchTextField.text = query
        KakaoLocalDataManager().gets(query: query, viewController: self)
    }
    
    //MARK: - API
    func successSearchAddressResult(result: [LocalResult]){
        addressResult = result
    }

}
extension SearchAddressResultBottomSheet: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return addressResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchAddressResultTableViewCell.cellIdentifier, for: indexPath) as? SearchAddressResultTableViewCell else { fatalError() }
        
        let data = addressResult[indexPath.row]
        cell.locationLabel.text = data.place_name
        cell.addressLabel.text = data.address_name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let root = self.navigationController?.viewControllers[0] as? MakeMeetingSheetViewController else { return }
        
        self.navigationController?.popToRootViewController(animated: true, completion: {
            guard let cell = tableView.cellForRow(at: indexPath) as? SearchAddressResultTableViewCell else { return }
            root.mainView.locationLabel.text = cell.locationLabel.text
        })
    }
    
}


extension SearchAddressResultBottomSheet: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        let searchLocation = textField.text ?? ""
        
        if(!searchLocation.isEmpty){
            moveSearchAddressResultSheet(searchLocation) }
        
        return true
    }
    
    func moveSearchAddressResultSheet(_ location: String){
        let vc = SearchAddressResultBottomSheet()
        vc.mainView.searchTextField.text = location
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//
//  ImageAddTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/18.
//

import UIKit

class ImageAddTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let cellIdentifier = "imageAddCell"
    
    var navigationController: UINavigationController!
    
    var imageArray: [UIImage] = [] {
        didSet{
            imageCountLabel.text =  "\(imageArray.count) / 10"
        }
    }
    
    //MARK: - UI
    
    var imageCollectionView: UICollectionView!
    
    let imageCountLabel = UILabel().then{
        $0.font = UIFont.pretendard(family: .Medium)
        $0.text = "0 / 10"
        //TODO: - 현재 이미지 개수 글자 색상 zatchPurple로 변경
    }
    
    let backView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            flowLayout.itemSize = CGSize(width: 84, height: 84)
            flowLayout.minimumInteritemSpacing = CGFloat(8)
            
            $0.delegate = self
            $0.dataSource = self
            
            $0.collectionViewLayout = flowLayout
            $0.contentInset = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 20)
            $0.showsHorizontalScrollIndicator = false
            
            $0.register(ImageAddBtnCollectionViewCell.self, forCellWithReuseIdentifier: ImageAddBtnCollectionViewCell.cellIdentifier)
            $0.register(ImageRegisterCollectionViewCell.self, forCellWithReuseIdentifier: ImageRegisterCollectionViewCell.cellIdentifier)
        }

        setUpView()
        setUpConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        self.contentView.addSubview(backView)
        
        self.backView.addSubview(imageCollectionView)
        self.backView.addSubview(imageCountLabel)
    }
    
    func setUpConstraint(){
        
        self.backView.snp.makeConstraints{ make in
            make.height.equalTo(165)
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        imageCollectionView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(84)
        }
        
        imageCountLabel.snp.makeConstraints{ make in
            make.top.equalTo(imageCollectionView.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(36)
        }
    }
}

extension ImageAddTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.row == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageAddBtnCollectionViewCell.cellIdentifier, for: indexPath)
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageRegisterCollectionViewCell.cellIdentifier, for: indexPath) as? ImageRegisterCollectionViewCell else { fatalError() }
            cell.imageView.image = imageArray[indexPath.row - 1]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            
            let alert = UIAlertController(title: nil, message: "이미지를 선택할 방식을 선택해주세요.", preferredStyle: .actionSheet)
            let cameraBtn = UIAlertAction(title: "카메라 촬영", style: .default, handler: nil)
            let galleryBtn = UIAlertAction(title: "갤러리에서 가져오기", style: .default, handler: { _ in
                
                let imagePicker = UIImagePickerController().then{
                    $0.delegate = self
                    $0.sourceType = .photoLibrary
                }
                
                self.navigationController.present(imagePicker, animated: true, completion: nil)
            })
            let cancelBtn = UIAlertAction(title: "취소", style: .cancel)
            
            alert.addAction(galleryBtn)
            alert.addAction(cameraBtn)
            alert.addAction(cancelBtn)
            
            self.navigationController.present(alert, animated: true, completion: nil)
            
            
            //TODO: - image 10개인 경우 개수 제한 팝업 띄우기
            
        }else{
            
            //TODO: - 클릭시 삭제 팝업 등장
        }
    }
}

extension ImageAddTableViewCell: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        
        //TODO: - 상세 페이지 제공 통해 사진 선택 여부 결정
        
        let imgae = info[.originalImage] as! UIImage
        
        let imageDetailVC = RegisterImageDetailViewController()
        
        imageDetailVC.imageView.image = imgae
        imageDetailVC.imageRegisterHandler = { result in
            if(result){
                self.imageArray.append(imgae)
                self.imageCollectionView.reloadData()
            }
        }
        
        self.navigationController.pushViewController(imageDetailVC, animated: true)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
        
    }
}

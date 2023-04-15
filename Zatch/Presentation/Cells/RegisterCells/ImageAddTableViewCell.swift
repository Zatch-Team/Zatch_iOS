//
//  ImageAddTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/05/18.
//

import UIKit

//TODO: IMAGE 관리 ViewController에서
class ImageAddTableViewCell: BaseTableViewCell {
    
    var navigationController: UINavigationController!
    var imageArray = [UIImage](){
        didSet{
            imageCountLabel.text =  "\(imageArray.count) / 10"
            changeCountLabelTextColor()
        }
    }
    
    //MARK: - UI
    
    let imageCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        
        let flowLayout = UICollectionViewFlowLayout().then{
            $0.scrollDirection = .horizontal
            $0.itemSize = CGSize(width: 84, height: 84)
            $0.minimumInteritemSpacing = CGFloat(8)
        }
        
        $0.collectionViewLayout = flowLayout
        $0.contentInset = UIEdgeInsets(top: 0, left: 36, bottom: 0, right: 20)
        $0.showsHorizontalScrollIndicator = false
        
        $0.register(cellType: ImageAddBtnCollectionViewCell.self)
        $0.register(cellType: ImageRegisterCollectionViewCell.self)
    }
    let imageCountLabel = UILabel().then{
        $0.setTypoStyleWithSingleLine(typoStyle: .medium14)
        $0.text = "0 / 10"
    }
    
    override func initialize(){
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
    }
    
    //MARK: - Helper
    
    override func hierarchy(){
        super.hierarchy()
        baseView.addSubview(imageCollectionView)
        baseView.addSubview(imageCountLabel)
    }
    
    override func layout(){
        
        super.layout()
        
        baseView.snp.makeConstraints{ make in
            make.height.equalTo(165)
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
    
    func changeCountLabelTextColor(){
        
        let length = imageArray.count < 10 ? 1 : 2
        
        let mutableText = NSMutableAttributedString(attributedString: imageCountLabel.attributedText!)
        mutableText.addAttribute(.foregroundColor, value: UIColor.zatchPurple, range: NSRange(location: 0, length: length))
        
        imageCountLabel.attributedText = mutableText
    }
}

extension ImageAddTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(indexPath.row == 0){
            return collectionView.dequeueReusableCell(for: indexPath, cellType: ImageAddBtnCollectionViewCell.self)
        }

        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ImageRegisterCollectionViewCell.self).then{
            $0.imageView.image = imageArray[indexPath.row - 1]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            if(imageArray.count < 10){
                
                let alert = UIAlertController(title: nil, message: "이미지를 선택할 방식을 선택해주세요.", preferredStyle: .actionSheet)
                let cameraBtn = UIAlertAction(title: "카메라 촬영", style: .default, handler: { _ in
                    let cameraPicker = UIImagePickerController().then{
                        $0.delegate = self
                        $0.sourceType = .camera
                    }
                    self.navigationController.present(cameraPicker, animated: true, completion: nil)
                })
                
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
                
                self.navigationController?.present(alert, animated: true, completion: nil)
                
            }else{
                _ = Alert.ImageMax.generateAlert().show(in: self.navigationController)
            }
        }else{

            let image = imageArray[indexPath.row - 1]
            let vc = DeleteImageDetailViewController(image: image)
            vc.completion = {
                self.imageArray.remove(at: indexPath.row - 1)
                self.imageCollectionView.reloadData()
            }
            
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
}

extension ImageAddTableViewCell: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        let image = info[.originalImage] as! UIImage
        
        let vc = RegisterImageDetailViewController(image: image)
        vc.completion = {
            self.imageArray.append(image)
            self.imageCollectionView.reloadData()
        }

        self.navigationController.pushViewController(vc, animated: true)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
    }
}

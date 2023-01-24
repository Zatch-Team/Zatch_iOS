//
//  TownSettingSheetViewController.swift
//  Zatch
//
//  Created by 박지윤 on 2022/08/09.
//

import UIKit

class TownSettingSheetViewController: BaseBottomSheetViewController {
    
    //MARK: - Properties
    
    var townSelectHandelr : ((_ select: Int) -> Void)?
    
    //MARK: - UI
    
    let townImage = UIImageView().then{
        $0.contentMode = .scaleAspectFit
    }

    let slider = TownSlider().then{
        $0.minimumValue = 0
        $0.maximumValue = 2
        $0.maximumTrackTintColor = .black5
        $0.minimumTrackTintColor = .zatchPurple
        $0.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }

    init(){
        super.init(type: .townArea)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override
    
    override func initialize() {
        
        super.initialize()
        
        townImage.image = Image.townSetting1
    }
    
    override func layout() {
        
        super.layout()
        
        self.view.addSubview(townImage)
        self.view.addSubview(slider)
        
        self.townImage.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(138)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        self.slider.snp.makeConstraints{ make in
            make.top.equalTo(townImage.snp.bottom).offset(31)
            make.leading.equalToSuperview().offset(43)
            make.trailing.equalToSuperview().offset(-43)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-52)
            make.height.equalTo(40)
        }
    }

    @objc
    func sliderValueChanged(_ slider : UISlider){
        
        let value = Int (self.slider.value)
        
        let image: UIImage!
        
        switch value{
        case 0:
            image = Image.townSetting1
            break
        case 1:
            image = Image.townSetting2
            break
        case 2:
            image = Image.townSetting3
            break
        default:
            return
        }
        self.townImage.image = image
        self.slider.setValue(Float (value), animated: false)
        
    }

}

class TownSlider : UISlider{
    
    @IBInspectable var height: CGFloat = 16
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: height))
    }
}
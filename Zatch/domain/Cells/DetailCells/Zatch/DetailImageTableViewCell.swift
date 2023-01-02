//
//  ImageTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit

class DetailImageTableViewCell: BaseTableViewCell {
    
    //MARK: - Properties
    var images : [UIImage?] = [
        Image.chatCamera,
        Image.chatClose,
        Image.chatGallery
    ]
    
    var imageViews = [UIImageView]()
    
    //MARK: - UI
    let scrollView = UIScrollView().then{
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
    }
    
    let pageControl = UIPageControl()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        scrollView.delegate = self
        
        setUpView()
        setUpConstriant()
        addContentScrollView()
        setPageControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        baseView.addSubview(scrollView)
        baseView.addSubview(pageControl)
    }
    
    func setUpConstriant(){
        
        baseView.snp.makeConstraints{ make in
            make.height.equalTo(self.baseView.snp.width)
        }
        
        self.scrollView.snp.makeConstraints{ make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-16)
        }
    }

}

extension DetailImageTableViewCell: UIScrollViewDelegate{
    
    private func addContentScrollView() {
        
        for i in 0..<images.count {
            let imageView = UIImageView().then{
                $0.backgroundColor = .black45
            }
            print("here?",scrollView.frame.width)
            let xPos = Const.Device.DEVICE_WIDTH * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: Const.Device.DEVICE_WIDTH, height: Const.Device.DEVICE_WIDTH)
//            imageView.image = images[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
        
    }
    
    private func setPageControl() {
        pageControl.numberOfPages = images.count
        
    }
    
    private func setPageControlSelectedPage(currentPage:Int) {
        pageControl.currentPage = currentPage
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value = scrollView.contentOffset.x/Const.Device.DEVICE_WIDTH
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
}

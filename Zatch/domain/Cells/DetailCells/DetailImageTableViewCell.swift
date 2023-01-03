//
//  ImageTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit

class DetailImageTableViewCell: BaseTableViewCell, BaseCellProtocol {
    
    static let cellIdentifier = "DetailImageTableViewCell"
    
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
        $0.showsHorizontalScrollIndicator = false
    }
    
    let pageControl = UIPageControl().then{
        $0.currentPageIndicatorTintColor = UIColor(red: 255/255, green: 171/255, blue: 66/255, alpha: 0.6)
        $0.pageIndicatorTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(scrollView)
        baseView.addSubview(pageControl)
    }
    
    override func layout(){
        super.layout()
        
        baseView.snp.makeConstraints{
            $0.height.equalTo(self.baseView.snp.width)
        }
        
        self.scrollView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        
        pageControl.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func initialize(){
        scrollView.delegate = self
        addImageContentToScrollView()
        setPageControl()
    }

}

extension DetailImageTableViewCell: UIScrollViewDelegate{
    
    private func addImageContentToScrollView() {
        
        for i in 0..<images.count {
            let imageView = UIImageView().then{
                $0.backgroundColor = .black45
            }
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

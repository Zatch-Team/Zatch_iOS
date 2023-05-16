//
//  ImageTableViewCell.swift
//  Zatch
//
//  Created by 박지윤 on 2022/06/26.
//

import UIKit

final class DetailImageTableViewCell: BaseTableViewCell {

    var images: [String]!{
        didSet{
            addImageContentToScrollView()
            setPageControl()
        }
    }
    
    private var imageViews = [UIImageView]()
    
    private let scrollView = UIScrollView().then{
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
    }
    private let pageControl = UIPageControl().then{
        //TODO: 서비스 타입에 따른 색상 변경
        $0.currentPageIndicatorTintColor = UIColor(red: 255/255, green: 171/255, blue: 66/255, alpha: 0.6)
        $0.pageIndicatorTintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.4)
    }
    
    override func hierarchy() {
        super.hierarchy()
        baseView.addSubview(scrollView)
        baseView.addSubview(pageControl)
    }
    
    override func layout(){
        super.layout()
        baseView.snp.makeConstraints{
            $0.height.equalTo(baseView.snp.width)
        }
        scrollView.snp.makeConstraints{
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        pageControl.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
    
    override func initialize(){
        scrollView.delegate = self
    }
}

extension DetailImageTableViewCell: UIScrollViewDelegate{
    
    private func addImageContentToScrollView() {
        for i in 0..<images.count {
            let imageView = UIImageView().then{
                $0.backgroundColor = .black45
            }
            let xPos = Device.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: Device.width, height: Device.width)
            imageView.kf.setImage(with: URL(string: images[i]))
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
        let value = scrollView.contentOffset.x/Device.width
        setPageControlSelectedPage(currentPage: Int(round(value)))
    }
}

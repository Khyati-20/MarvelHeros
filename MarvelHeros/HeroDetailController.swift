//
//  HeroDetailController.swift
//  MarvelHeros
//
//  Created by Khyati Dhawan on 14/06/22.
//

import Foundation
import UIKit

class HeroDetailController : UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let mainScrollView = UIScrollView()
        return mainScrollView
    }()
    lazy var stackView: UIStackView = {
        let detailStackView = UIStackView()
        detailStackView.axis = .vertical
        
        return detailStackView
    }()
    lazy var heroImage:  UIImageView = {
        let imageView = UIImageView()
        
        
        return imageView
    }()
    lazy var heroDescription:  UILabel = {
        let desc = UILabel()
        desc.textColor = .white
        desc.text = "This is a dummy description right now!"
        desc.numberOfLines = 0
        desc.lineBreakMode = .byWordWrapping
        desc.sizeToFit()
        return desc
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Hero Details"
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        setupUIView()
        
    }
    
    func setupUIView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
      
        stackView.addArrangedSubview(heroImage)
        heroImage.image = UIImage(named: "ThorLogo")
        stackView.addArrangedSubview(heroDescription)
        heroImage.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.width.equalTo(200)
            make.leading.equalTo(view.snp.leading).offset(5)
            make.top.equalTo(view.snp.top).offset(500)
            
        }
        
        heroDescription.snp.makeConstraints { make in
            make.top.equalTo(heroImage.snp.top).offset(50)
            make.leading.equalTo(view.snp.leading).offset(5)
        }
        
        
      
    }
    
    
}

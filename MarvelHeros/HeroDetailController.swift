//
//  HeroDetailController.swift
//  MarvelHeros
//
//  Created by Khyati Dhawan on 14/06/22.
//

import Foundation
import UIKit

class HeroDetailController : UIViewController {
  
    var heroDetails: Character?
    init(data: Character) {
        super.init(nibName: nil, bundle: nil)
        self.heroDetails = data
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var scrollView: UIScrollView = {
        let mainScrollView = UIScrollView()
        mainScrollView.backgroundColor = .white
        return mainScrollView
    }()
    
    lazy var stackView: UIStackView = {
        let detailStackView = UIStackView()
        detailStackView.axis = .vertical
        
        return detailStackView
    }()
    
    lazy var heroImage:  UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.image = UIImage(named: "ThorIcon")
        return imageView
    }()
    
    
    lazy var heroDescription:  UILabel = {
        let desc = UILabel()
        desc.numberOfLines = 0
        desc.lineBreakMode = .byWordWrapping
        desc.sizeToFit()
        return desc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.title = "Hero Details"
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        setupUIView()
        setupHeroDetails()
    }
    
    
    func setupHeroDetails() {
       
        self.navigationItem.title = heroDetails?.name
   
        heroImage.loadFromURL(url: heroDetails?.thumbnail.fullPath())
        heroDescription.text = heroDetails?.getDescription()
    }

    func setupUIView() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.snp.edges)
        }
        
        stackView.addArrangedSubview(heroImage)
        
        stackView.addArrangedSubview(heroDescription)
        
        heroImage.snp.makeConstraints { make in
            make.height.equalTo(stackView.snp.height).multipliedBy(0.5)
            make.width.equalTo(view.frame.size.width)
            make.top.equalTo(stackView.snp.top).offset(10)
            make.left.equalTo(stackView.snp.left).offset(5)
            make.right.equalTo(view.snp.right).offset(-10)
        }
        
        heroDescription.snp.makeConstraints { make in
            
            make.top.equalTo(heroImage.snp.bottom).offset(40)
            make.bottom.equalTo(view.snp.bottom)
            
        }
    }
}

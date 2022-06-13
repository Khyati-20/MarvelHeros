//
//  ViewController.swift
//  MarvelHeros
//
//  Created by Khyati Dhawan on 07/06/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var mainView = UIView()
    lazy var logoView = UIImageView()
    private let imageArray = [UIImage(named: "ThorIcon")!, UIImage(named: "SpidermanLogo")!, UIImage(named: "IronmanLogo")!, UIImage(named: "CaptainAmericaLogo")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
        setupConstraints()
    }
    func setupView() {
        mainView.backgroundColor = UIColor(named: "LaunchBackground")
        view.addSubview(mainView)
        animateImages()
        view.addSubview(logoView)
    }
    func animateImages() {
        logoView.animationImages = imageArray
        logoView.animationDuration = 1.0
        logoView.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.logoView.stopAnimating()
            self.moveToNextView()
        })
    }
    func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
        logoView.snp.makeConstraints { make in
            make.width.height.equalTo(100.0)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    func moveToNextView() {
        self.navigationController?.pushViewController(HeroListController(), animated: false)
    }

}

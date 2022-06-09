//
//  ViewController.swift
//  MarvelHeros
//
//  Created by Khyati Dhawan on 07/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onBtnTap(_ sender: Any) {
        print(sender)
        print("button tapped")
            Network().loadData()
    }
}

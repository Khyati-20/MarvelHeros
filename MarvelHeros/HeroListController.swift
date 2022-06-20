//
//  HeroListController.swift
//  MarvelHeros
//
//  Created by Khyati Dhawan on 09/06/22.
//

import Foundation
import UIKit
import SwiftUI




class HeroListController: UIViewController {
    
   lazy var tableView = UITableView()
    var name: String = ""
    var charachterArray : [Character] = []
    
    private let network = Network()
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Marvel Characters"
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchCharacterData()
        
    }

    func setupView()  {
       
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.bottom.equalTo(view.snp.bottom)
            make.trailing.equalTo(view.snp.trailing)
        }
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func fetchCharacterData()   {
        
      
        self.network.fetchData { dataContainerResponse in
            
            guard dataContainerResponse != nil else { return }
            
            self.charachterArray = dataContainerResponse!.results
            self.setupView()
        }
       
    }
}
extension HeroListController : UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charachterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = charachterArray[indexPath.row].name
        cell.imageView?.loadFromURL(url: charachterArray[indexPath.row].thumbnail.fullPath())
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        name = charachterArray[indexPath.row].name
        self.navigationController?.pushViewController(HeroDetailController(data: charachterArray[indexPath.row]), animated: false)
    }
        
}

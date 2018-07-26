//
//  MainVC.swift
//  VipcSwift
//
//  Created by Kavic Tan on 2018/7/25.
//  Copyright © 2018年 vipc. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainVC: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var tableView: UITableView!
    var arry:[String]!
    var newsModel:NewsModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupUI() {
        
        arry = [String]()
        
//        for(var i = 0; i<20; i++){
//            arry.append("\(i)")
//        }
        for i in 1...10 {
             arry.append("\(i)")
        }
        
        let rect = self.view.frame
        tableView = UITableView(frame: rect)
        self.tableView.backgroundColor = UIColor.blue
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(tableView)
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
    }
    
    func loadData( ) {
//        let url = BASE_URL + "v/2/recommend/list"
//        let params: Parameters = ["imei":"71B7FF62-3150-460B-8456-A1D003EA6BBA","refresh":"1"]
//        Alamofire.request(url, method:.post, parameters:params).responseJSON { (response) in
//            if(response.result.isSuccess){
//                print(response)
//            }else{
//
//            }
//        }
        let url = "https://cms.vipc.cn/api/home/football/first"
        Alamofire.request(url).responseJSON { (response) in
            if(response.result.isSuccess){
                if let value = response.result.value{
                    let json = JSON(value)
                    let model = NewsModel.deserialize(from: json.dictionaryObject)
                    self.newsModel = model;
                    print(self.newsModel)
                }
            }
        }
    }
    
    //设置cell的数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arry.count
    }
    
    //设置section的数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //设置tableview的cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)) as UITableViewCell
        cell.textLabel?.text = arry[indexPath.row]
        return cell
    }

}

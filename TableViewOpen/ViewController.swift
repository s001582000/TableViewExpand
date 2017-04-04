//
//  ViewController.swift
//  TableViewOpen
//
//  Created by 梁雅軒 on 2017/4/4.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    var arrData = [MyInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...5{
            let info = MyInfo()
            info.imagePath = "\(i).jpg"
            info.title = "這是第\(i)欄"
            var mtbStr:String = ""
            for _ in 0...i{
                mtbStr.append("內文\(i)內文\(i)內文\(i)內文\(i)")
            }
            
            info.message = mtbStr
            arrData.append(info)
        }
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        tableView.register(UINib(nibName: "MyCellOff", bundle: nil), forCellReuseIdentifier: "MyCellOff")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = arrData[indexPath.row]
        if info.isSelect{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell
            cell.tag = indexPath.row
            cell.setInfo(arrData[indexPath.row])
            cell.block = {(index,type) -> Void in
                let info = self.arrData[index]
                info.isSelect = !info.isSelect
                tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellOff", for: indexPath) as! MyCellOff
            cell.tag = indexPath.row
            cell.setInfo(arrData[indexPath.row])
            cell.block = {(index,type) -> Void in
                let info = self.arrData[index]
                info.isSelect = !info.isSelect
                tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
            }
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }


}

class MyInfo {
    var title:String!
    var message:String!
    var imagePath:String!
    var isSelect = false
}

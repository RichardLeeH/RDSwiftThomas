//
//  ViewController.swift
//  RDSwiftThomasDemo
//
//  Created by lihui on 2017/1/29.
//  Copyright © 2017年 org.richard. All rights reserved.
//

import UIKit

import RDSwiftThomas

class ViewController:UIViewController , UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet var tableview:UITableView!;
    var dataArr:NSArray = [];
    let cellID = "testCellID"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.dataArr = RDPageModel.loadPageDatas(aPlistName:"RDSysPage")!
        self.tableview.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellID)// cell的第二种写法 注册cell
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.dataArr.count;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let model:RDPageModel = self.dataArr[indexPath.row] as! RDPageModel;
        
        RDSwiftThomas.openPage(model.type);
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) 
        
        let model:RDPageModel = self.dataArr[indexPath.row] as! RDPageModel;
        
        cell.textLabel?.text = model.title;
        return cell
    }
}



//
//  RDPageModel.swift
//  RDSwiftThomasDemo
//
//  Created by lihui on 2017/1/31.
//  Copyright © 2017年 org.richard. All rights reserved.
//

import Foundation
import UIKit

public class RDPageModel:NSObject
{
    var title:String = "";
    var type:String  = "";
    
    static func loadPageDatas(aPlistName:String) ->NSMutableArray?
    {
        let dataArr:NSArray = RDPlistManager.readArrayDataWith(plistFileName: aPlistName)!;
        
        let modelArr = NSMutableArray();
        
        if (dataArr.count > 0)
        {
            for pageModelStr in dataArr
            {
                let str:String = pageModelStr as! String;
                
                let strArr:[String] = str.components(separatedBy: ",")
                
                let model:RDPageModel = RDPageModel()
                model.title = strArr[0];
                model.type  = strArr[1];
                modelArr.add(model)
            }
        }
        return modelArr
    }
}

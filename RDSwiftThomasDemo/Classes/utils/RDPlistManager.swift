//
//  RDPlistManager.swift
//  RDSwiftThomasDemo
//
//  Created by lihui on 2017/1/29.
//  Copyright © 2017年 org.richard. All rights reserved.
//

import Foundation

import UIKit

struct RDPlistManager
{
    static func plistPathWith(plistFileName aPlistFileName:String) -> String?
    {
        let mainBundle = Bundle.main
        return mainBundle.path(forResource: aPlistFileName, ofType: "plist")
    }
    
    static func readDictionaryDataWith(plistFileName aPlistFileName:String) -> NSDictionary?
    {
        let path:String = self.plistPathWith(plistFileName: aPlistFileName)!;
        return NSDictionary(contentsOfFile: path);
    }

    static func readArrayDataWith(plistFileName aPlistFileName:String) -> NSArray?
    {
        let path:String = self.plistPathWith(plistFileName: aPlistFileName)!;
        return NSArray(contentsOfFile: path);
    }
}

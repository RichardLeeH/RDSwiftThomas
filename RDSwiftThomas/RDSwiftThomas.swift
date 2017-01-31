//
//  RDSwiftThomas.swift
//  RDSwiftThomasDemo
//
//  Created by lihui on 2017/1/29.
//  Copyright © 2017年 org.richard. All rights reserved.
//

import Foundation

///iOS 10
///经过测试 App 首字母必须要大写
let RDSysUrlSchemePrifixVer:String     = "App-Prefs";
///// iOS 8 & 9, minmum
//let RDSysUrlSchemePrifixVer_89:String  = "Prefs";
let RDSysUrlSchemeKey:String           = "root=";

public enum RDSysPage:String
{
    /// open wifi page    (无线网络)
    case RDSysPageWifi         = "WIFI"
    /// open  about page  (蓝牙)
    case  RDSysPageBluetooth    = "Bluetooth"
    /// open hotsopt page (个人热点)
    case  RDSysPageHotspot      = "INTERNET_TETHERING"
    /// open  about page
    case  RDSysPageAbout        = "General&path=About"
    /// open General(通用)
    case  RDSysPageGeneral      = "General"
    /// open Cellular(蜂窝移动)
    case  RDSysPageCellular     = "MOBILE_DATA_SETTINGS_ID"
    /// open iCloud
    case  RDSysPage_iCloud      = "CASTLE"
    /// open iCloud strorage
    case  RDSysPage_iCloudStorage = "CASTLE&path=STORAGE_AND_BACKUP"
    /// open app store
    case  RDSysPageStore        = "STORE"
    /// open notification(通知)
    case  RDSysPageNotification = "NOTIFICATIONS_ID"
    /// open DISPLAY (显示)
    case  RDSysPageDisplay      = "DISPLAY"
    /// open Location (位置)
    case  RDSysPageLocation     = "Location"
    /// open Keyboard(键盘)
    case  RDSysPageKeyboard     = "Keyboard"
    /// open DateTime(日期时间)
    case  RDSysPageDateTime     = "DateTime"
    /// open VPN
    case  RDSysPageVPN          = "General&path=VPN"
    /// open Phone(电话)
    case  RDSysPagePhone        = "Phone"
    /// open Sounds(声音)
    case  RDSysPageSounds       = "Sounds"
    /// open Photos(照片)
    case  RDSysPagePhotos       = "Photos"
    /// open Wallpaper(壁纸)
    case  RDSysPageWallpaper    = "Wallpaper"
    /// open BATTERY_USAGE(电池设置)
    case  RDSysPageBATTERY      = "BATTERY_USAGE"
    /// open ACCESSIBILITY(辅助功能)
    case  RDSysPageACCESSIBILITY = "ACCESSIBILITY"
    /// open iOS SoftwareUpdate(iOS 更新)
    case  RDSysPageSysUpdate    = "General&path=SOFTWARE_UPDATE_LINK"
}

public class RDSwiftThomas:NSObject
{
    public static func openPage(_ aPageName: String, completionHandler aCompletion: ((Bool) -> Swift.Void)? = nil)
    {
        let url = self.pageURL(pageName: aPageName);
        
        if #available(iOS 10.0, *)
        {
            UIApplication.shared.open(url as URL, options: [:], completionHandler:aCompletion)
        }
        else
        {
            let ret:Bool = UIApplication.shared.openURL(url as URL);
            aCompletion!(ret);
        }
    }
    
    static func pageURL(pageName aPageName:String) -> NSURL
    {
        var urlStr:String = String();
        
        urlStr.append(RDSysUrlSchemePrifixVer);
        urlStr.append(":");
        urlStr.append(RDSysUrlSchemeKey);
        urlStr.append(aPageName);
        let url:NSURL = NSURL(string:urlStr)!;
        
        return url;
    }
}

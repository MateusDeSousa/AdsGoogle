//
//  AdsMobillsSetup.swift
//  AdsMobills
//
//  Created by Mateus de Sousa on 06/11/19.
//

import Foundation

public struct AdsMobillsSetup {
    
    public static var share = AdsMobillsSetup()
    
    public func startAds(appId: String, adUnitIntertitialDefault: String, adUnitIntertitialExpensive: String, adUnitNativeDefault: String, adUnitNativeExpensive: String){
        AdsMobillsNative.adIdDefault = adUnitNativeDefault
        AdsMobillsNative.adIdExpansive = adUnitNativeExpensive
        
        AdsMobillsInterstitial.instance.startAdsMobills(adIdExpensive: adUnitIntertitialExpensive, adIdDefault: adUnitIntertitialDefault)
    }
}

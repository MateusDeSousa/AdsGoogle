//
//  AdsMobillsNative.swift
//  AdsMobills
//
//  Created by Mateus de Sousa on 24/10/19.
//

import Foundation
import GoogleMobileAds

public class AdsMobillsNative: NSObject, GADAdLoaderDelegate, GADUnifiedNativeAdDelegate {
    
    public static var shareInstance = AdsMobillsNative()
    
    var adIdExpansive = ""
    var adIdDefault = ""
    static var fromController = UIViewController()
    static var adNative: GADAdLoader!
    
    public func startAdsNative(adIdExpansive: String, adIdDefault: String){
        self.adIdDefault = adIdDefault
        self.adIdExpansive = adIdExpansive
    }
    
    public func loadAdsNative(fromController: UIViewController){
        AdsMobillsNative.fromController = fromController
        AdsMobillsNative.adNative = loadExpansiveNative()
    }
    
    private func loadExpansiveNative() -> GADAdLoader{
        let multipleAdsOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdsOptions.numberOfAds = 5
        
        let adLoad = GADAdLoader(adUnitID: adIdExpansive, rootViewController: AdsMobillsNative.fromController, adTypes: [.unifiedNative], options: [multipleAdsOptions])
        adLoad.delegate = AdsMobillsNative.shareInstance
        adLoad.load(GADRequest())
        return adLoad
    }
    
    private func loadDefaultNative() -> GADAdLoader{
        let multipleAdsOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdsOptions.numberOfAds = 5
        
        let adLoad = GADAdLoader(adUnitID: adIdDefault, rootViewController: AdsMobillsNative.fromController, adTypes: [.unifiedNative], options: [multipleAdsOptions])
        adLoad.delegate = AdsMobillsNative.shareInstance
        adLoad.load(GADRequest())
        return adLoad
    }
    
    public func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: GADRequestError) {
        let adLoadId = AdsMobillsNative.adNative
        if adLoadId?.adUnitID == adIdExpansive{
            AdsMobillsNative.adNative = loadDefaultNative()
            return
        }
    }
    
    public func nativeAdDidDismissScreen(_ nativeAd: GADUnifiedNativeAd) {
        print("Teste")
    }
    
    public func adLoaderDidFinishLoading(_ adLoader: GADAdLoader) {
        print("Teste")
    }
    
}

//
//  AdsMobillsNative.swift
//  AdsMobills
//
//  Created by Mateus de Sousa on 24/10/19.
//

import Foundation
import GoogleMobileAds

public class AdsMobillsNative: NSObject {
    
    public static var shareInstance = AdsMobillsNative()
    
    static var adIdExpansive: String!
    static var adIdDefault: String!
    static var fromController = UIViewController()
    static var adNative: GADAdLoader!
    private var viewTemplate: UIView!
    
    //clousere to reloadTable
    var adReceived: ((Bool) -> Void)?
    
    public func loadAdsNative(fromController: UIViewController, viewTemplate: UIView, completion: ((Bool) -> Void)?){
        AdsMobillsNative.fromController = fromController
        self.viewTemplate = viewTemplate
        AdsMobillsNative.adNative = loadExpansiveNative()
        adReceived = completion
    }
    
    private func loadExpansiveNative() -> GADAdLoader{
        let multipleAdsOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdsOptions.numberOfAds = 1
        
        let adLoad = GADAdLoader(adUnitID: AdsMobillsNative.adIdExpansive, rootViewController: AdsMobillsNative.fromController, adTypes: [.unifiedNative], options: [multipleAdsOptions, GADNativeMuteThisAdLoaderOptions()])
        adLoad.delegate = AdsMobillsNative.shareInstance
        adLoad.load(GADRequest())
        return adLoad
    }
    
    private func loadDefaultNative() -> GADAdLoader{
        let multipleAdsOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdsOptions.numberOfAds = 1
        
        let adLoad = GADAdLoader(adUnitID: AdsMobillsNative.adIdDefault, rootViewController: AdsMobillsNative.fromController, adTypes: [.unifiedNative], options: [multipleAdsOptions, GADNativeMuteThisAdLoaderOptions()])
        adLoad.delegate = AdsMobillsNative.shareInstance
        adLoad.load(GADRequest())
        return adLoad
    }
}

extension AdsMobillsNative: GADUnifiedNativeAdLoaderDelegate{
    public func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: GADRequestError) {
        let adLoadId = AdsMobillsNative.adNative
        if adLoadId?.adUnitID == AdsMobillsNative.adIdExpansive{
            AdsMobillsNative.adNative = loadDefaultNative()
            return
        }
    }
    
    public func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADUnifiedNativeAd) {
        if #available(iOS 9.0, *) {
            if let view = viewTemplate as? GADTMediumTemplateView{
                view.setNativeAd = nativeAd
            }else if let view = viewTemplate as? GADTSmallTemplateView{
                view.setNativeAd = nativeAd
            }
            adReceived?(true)
        }
    }
    
}

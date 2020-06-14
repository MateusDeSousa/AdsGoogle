//
//  AdsNativeService.swift
//  AdsGoogle
//
//  Created by Mateus Sousa on 18/04/20.
//  Copyright © 2020 MateusSousa. All rights reserved.
//

import Foundation
import GoogleMobileAds

public class AdsNativeService: NSObject {

    public static var instance = AdsNativeService()

    private weak var fromController: UIViewController?
    private weak var viewTemplate: UIView!
    public var adIdNative: String!

    var adNative: GADAdLoader!
    var adReceived: ((Bool) -> Void)?

    public func loadAdsNative(fromController: UIViewController, viewTemplate: UIView, completion: ((Bool) -> Void)?){
        if !UserDefaults.standard.bool(forKey: "showAds"){
            completion?(false)
            return
        }
        self.fromController = fromController
        self.viewTemplate = viewTemplate
        self.adReceived = completion

        if let cache = AdsNativeCache.instance.nextAd, cache != AdsNativeCache.instance.previousAd {
            if let view = viewTemplate as? GADMediumTemplateView{
                view.setNativeAd = cache
            }else if let view = viewTemplate as? GADSmallTemplateView{
                view.setNativeAd = cache
            }
            adReceived?(true)
            AdsNativeCache.instance.previousAd = cache
            startRequireAd()
        }else {
            startRequireAd()
        }
    }

    private func startRequireAd(){
        if adIdNative.trimmingCharacters(in: .whitespaces) != "" {
            adNative = loadNativeDefaultFloor()
        }
    }

    private func loadNativeDefaultFloor() -> GADAdLoader{
        let multipleAdsOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdsOptions.numberOfAds = 1

        let adLoad = GADAdLoader(adUnitID: adIdNative, rootViewController: fromController, adTypes: [.unifiedNative], options: [multipleAdsOptions, GADNativeMuteThisAdLoaderOptions()])
        adLoad.delegate = AdsNativeService.instance
        adLoad.load(GADRequest())
        return adLoad
    }
}

extension AdsNativeService: GADUnifiedNativeAdLoaderDelegate{
    public func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: GADRequestError) {
        adReceived?(false)
    }

    public func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADUnifiedNativeAd) {
        if let _ = AdsNativeCache.instance.nextAd {
            AdsNativeCache.instance.nextAd = nativeAd
        }else{
            if let view = viewTemplate as? GADMediumTemplateView{
                view.setNativeAd = nativeAd

            }else if let view = viewTemplate as? GADSmallTemplateView{
                view.setNativeAd = nativeAd
            }
            AdsNativeCache.instance.previousAd = nativeAd
            AdsNativeCache.instance.nextAd = nativeAd
            startRequireAd()
            adReceived?(true)
        }
    }
}

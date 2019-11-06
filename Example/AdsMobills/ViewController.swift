//
//  ViewController.swift
//  AdsMobills
//
//  Created by mateusdesousa on 10/21/2019.
//  Copyright (c) 2019 mateusdesousa. All rights reserved.
//

import UIKit
import AdsMobills
import GoogleMobileAds

class ViewController: UIViewController, GADUnifiedNativeAdLoaderDelegate{
    
    
//    var adViewTemplete = GADTSmallTemplateView()
    let viewNative = GADTMediumTemplateView()
    var googleAds = AdsMobillsInterstitial.instance
    
    var adLoader: GADAdLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        styleTemplete()
        initializeLoadNativeAds()
        createViewNative()
        // Do any additional setup after loading the view, typically from a nib.
        AdsMobillsNative.shareInstance.loadAdsNative(fromController: self)
        googleAds.showInterstitialByLoadScreen { loaded in
            if loaded{
                print("teste")
            }else{
                print("teste")
            }
        }
    }

    private func createViewNative(){
        viewNative.initializeTempleteMedium()
        view.addSubview(viewNative)
        viewNative.backgroundColor = .red
        viewNative.translatesAutoresizingMaskIntoConstraints = false

        viewNative.heightAnchor.constraint(equalToConstant: 600).isActive = true
        viewNative.widthAnchor.constraint(equalToConstant: 414).isActive = true
        viewNative.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        viewNative.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        
        let multipleAdsOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdsOptions.numberOfAds = 5
        
        adLoader = GADAdLoader(adUnitID: "ca-app-pub-3940256099942544/3986624511", rootViewController: self, adTypes: [.unifiedNative], options: [multipleAdsOptions])
        adLoader.delegate = self
        adLoader.load(GADRequest())
        
//        view.addSubview(adViewTemplete)
        
    }
    
    private func initializeLoadNativeAds(){
        let multipleAdsOptions = GADMultipleAdsAdLoaderOptions()
        multipleAdsOptions.numberOfAds = 5
        
        adLoader = GADAdLoader(adUnitID: "ca-app-pub-3940256099942544/3986624511", rootViewController: self, adTypes: [.unifiedNative], options: [multipleAdsOptions])
//        adLoader.delegate = self
        adLoader.load(GADRequest())
        
//        adViewTemplete.nativeAd = adLoader
    }
    
//    private func styleTemplete(){
//        let myBlueColor = "#5C84F0"
//        let styles: [GADTNativeTemplateStyleKey : NSObject] = [.callToActionFont : UIFont.systemFont(ofSize: 15),
//                                                          .callToActionFontColor : UIColor.white,
//                                                          .callToActionBackgroundColor : GADTTemplateView.color(fromHexString: myBlueColor),
//                                                          .secondaryFont : UIFont.systemFont(ofSize: 15),
//                                                          .secondaryFontColor : UIColor.gray,
//                                                          .secondaryBackgroundColor : UIColor.white,
//                                                          .primaryFont : UIFont.systemFont(ofSize: 15),
//                                                          .primaryFontColor: UIColor.white,
//                                                          .primaryBackgroundColor: UIColor.white,
//                                                          .tertiaryFont : UIFont.systemFont(ofSize: 15),
//                                                          .tertiaryFontColor : UIColor.gray,
//                                                          .tertiaryBackgroundColor : UIColor.white,
//                                                          .mainBackgroundColor : UIColor.white,
//                                                          .cornerRadius : NSNumber(7)
//
//                                                        ]
//
//        adViewTemplete.styles = styles
//
//    }
    
    @IBAction func onclick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewControllerPush")
        googleAds.showInterstitialBeforePush(fromController: self, toController: controller)
        
    }
    
    @IBAction func onclickPresent(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ViewControllerPresent")

        googleAds.showInterstitialBeforePresent(fromController: self, toController: controller)
    }
    
    func adLoaderDidFinishLoading(_ adLoader: GADAdLoader) {
        print("teste")
    }
    
    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: GADRequestError) {
        print("teste")
    }
    
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADUnifiedNativeAd) {
//        adViewTemplete.nativeAd = nativeAd
//        nativeAd
        viewNative.setNativeAd = nativeAd
    }
    
}


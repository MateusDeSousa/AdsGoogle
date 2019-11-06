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

class ViewController: UIViewController{
    
    
//    var adViewTemplete = GADTSmallTemplateView()
    
    var googleAds = AdsMobillsInterstitial.instance
    
    var adLoader: GADAdLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViewNative()
        // Do any additional setup after loading the view, typically from a nib.
        
        googleAds.showInterstitialByLoadScreen { loaded in
            if loaded{
                print("teste")
            }else{
                print("teste")
            }
        }
    }

    private func createViewNative(){
        let viewNative = GADTMediumTemplateView()
        view.addSubview(viewNative)
        viewNative.setContraintsAd(viewReference: view, leading: 20, trailling: -20, top: 90)
        AdsMobillsNative.shareInstance.loadAdsNative(fromController: self, viewTemplate: viewNative)
    }
    
    
    
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
  
    
}


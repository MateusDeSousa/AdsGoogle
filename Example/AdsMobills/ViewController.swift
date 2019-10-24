//
//  ViewController.swift
//  AdsMobills
//
//  Created by mateusdesousa on 10/21/2019.
//  Copyright (c) 2019 mateusdesousa. All rights reserved.
//

import UIKit
import AdsMobills

class ViewController: UIViewController {

    var googleAds = AdsMobillsInterstitial.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
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


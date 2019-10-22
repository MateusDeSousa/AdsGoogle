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

class ViewController: UIViewController, GADInterstitialDelegate {

    var interstitial: GADInterstitial!
//    var googleAds: AdsMobillsInterstitial!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        interstitial.delegate = self
        let request = GADRequest()
        interstitial.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onclick(_ sender: Any) {
        
        if interstitial.isReady {
          interstitial.present(fromRootViewController: self)
        }
    }
    
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
    }
    
}


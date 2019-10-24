//
//  ViewControllerPush.swift
//  AdsMobills_Example
//
//  Created by Mateus de Sousa on 23/10/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import AdsMobills

class ViewControllerPush: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onShoIntertitial(_ sender: Any) {
        AdsMobillsInterstitial.instance.showInterstitialClick(fromController: self)
    }
}

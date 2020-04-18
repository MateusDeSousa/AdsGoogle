//
//  AdsNativeManager.swift
//  AdsGoogle
//
//  Created by Mateus Sousa on 18/04/20.
//  Copyright © 2020 MateusSousa. All rights reserved.
//

import Foundation

public class AdsNativeManager {

    public static let instance = AdsNativeManager()

    public var enableAds: Bool = true {
        didSet {
            UserDefaults.standard.set(enableAds, forKey: "showAds")
        }
    }

    public func setup(idNative: String, enable: Bool = true) {
        AdsNativeService.instance.adIdNative = idNative
        enableAds = enable
    }
}

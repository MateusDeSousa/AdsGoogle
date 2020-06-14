//
//  AdsNativeCache.swift
//  AdsGoogle
//
//  Created by Mateus Sousa on 18/04/20.
//  Copyright © 2020 MateusSousa. All rights reserved.
//

import GoogleMobileAds

class AdsNativeCache {
    static var instance = AdsNativeCache()
    var nextAd: GADUnifiedNativeAd?
    var previousAd: GADUnifiedNativeAd?
}

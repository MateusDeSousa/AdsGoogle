//
//  ViewController.swift
//  ExampleNative
//
//  Created by Mateus Sousa on 18/04/20.
//  Copyright © 2020 MateusSousa. All rights reserved.
//

import UIKit
import AdsGoogle

class ViewController: UIViewController {

    let viewNative = GADMediumTemplateView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        AdsNativeService.instance.loadAdsNative(fromController: self, viewTemplate: viewNative, completion: nil)
        setupSubviews()
        setupAnchors()
    }

    private func setupSubviews(){
        view.addSubview(viewNative)
    }

    private func setupAnchors(){
        viewNative.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewNative.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewNative.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewNative.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


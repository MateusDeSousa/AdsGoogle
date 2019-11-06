//
//  GADTSmallTemplateView.swift
//  AdsMobills
//
//  Created by Mateus de Sousa on 01/11/19.
//

import Foundation
import UIKit
import GoogleMobileAds

@available(iOS 9.0, *)
public class GADTSmallTemplateView: GADUnifiedNativeAdView {
    
    let container = UIView()
    let titleAd = UILabel()
    let subtitleAds = UILabel()
    let descAds = UILabel()
    let imageAd = GADMediaView()
    let buttonGo = UIButton()
    let iconAds = UIImageView()
    let indicatorAdd = UILabel()
    let starsAppAd = UIImageView()
    
    public var setNativeAd: GADUnifiedNativeAd! {
        didSet{
//            titleAd.text = setNativeAd.
            imageAd.mediaContent = setNativeAd.mediaContent
            buttonGo.setTitle(setNativeAd.callToAction, for: .normal)
//            imageAd.image = setNativeAd.icon
        }
    }
    
    public func initializeTemplateSmall(){
        addViewContainerSmall()
        addIndicatorAd()
        addImageSmall()
        addNameAddSmall()
        addStarsAppImageAd()
        addButtonGoSmall()
    }
    
    private func addIndicatorAd(){
        indicatorAdd.text = "Ad"
        indicatorAdd.textColor = .white
        indicatorAdd.backgroundColor = UIColor(red: 219/255, green: 200/255, blue: 22/255, alpha: 1)
        indicatorAdd.textAlignment = .center
        indicatorAdd.font = .boldSystemFont(ofSize: 15)
        indicatorAdd.clipsToBounds = false
        container.addSubview(indicatorAdd)
        setContraintsIndicatorAdd()
    }
    
    private func setContraintsIndicatorAdd(){
        indicatorAdd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorAdd.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0),
            indicatorAdd.topAnchor.constraint(equalTo: container.topAnchor, constant: 0),
            indicatorAdd.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func addViewContainerSmall(){
        container.layer.cornerRadius = 10
        container.layer.borderColor = UIColor.gray.cgColor
        container.layer.borderWidth = 0.2
        container.clipsToBounds = true
        container.backgroundColor = .white
        self.addSubview(container)
        setContraintsContainerSmall()
    }

    
    private func addImageSmall(){
//        imageAd.image = UIImage(named: "swift")
        imageAd.contentMode = .scaleToFill
        container.addSubview(imageAd)
        setContraintsImageSmall()
    }
    
    private func addNameAddSmall(){
        titleAd.font = .boldSystemFont(ofSize: 15)
        titleAd.text = "Teste do Ad"
        titleAd.textColor = .black
        container.addSubview(titleAd)
        setContraintsNameAdSmall()
    }
    
    private func addStarsAppImageAd(){
        starsAppAd.image = UIImage(named: "stars")
        container.addSubview(starsAppAd)
        setConstraintsStarsAppAdSmall()
    }
    
    private func addButtonGoSmall(){
        buttonGo.backgroundColor = .blue
        buttonGo.layer.cornerRadius = 10
        buttonGo.clipsToBounds = true
        buttonGo.setTitle("Instalar", for: .normal)
        buttonGo.setTitleColor(.white, for: .normal)
        container.addSubview(buttonGo)
        setContraintsButtonGoSmall()
    }
    
    private func setContraintsContainerSmall(){
        let margins = self.layoutMarginsGuide
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
//            container.heightAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func setContraintsImageSmall(){
        imageAd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageAd.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 0),
            imageAd.topAnchor.constraint(equalTo: container.topAnchor, constant: 20),
            imageAd.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            imageAd.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -15),
            imageAd.heightAnchor.constraint(equalToConstant:60),
            imageAd.widthAnchor.constraint(equalToConstant: 80),
//            imageAd.widthAnchor.contr
        ])
    }
    
    private func setContraintsNameAdSmall(){
        titleAd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleAd.centerYAnchor.constraint(equalTo: imageAd.centerYAnchor, constant: -10),
            titleAd.leadingAnchor.constraint(equalTo: imageAd.trailingAnchor, constant: 5)
        ])
    }
    
    private func setConstraintsStarsAppAdSmall(){
        starsAppAd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starsAppAd.leadingAnchor.constraint(equalTo: imageAd.trailingAnchor, constant: 20),
            starsAppAd.topAnchor.constraint(equalTo: titleAd.bottomAnchor, constant: 10),
            starsAppAd.heightAnchor.constraint(equalToConstant: 20),
            starsAppAd.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setContraintsButtonGoSmall(){
        buttonGo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonGo.topAnchor.constraint(equalTo: container.topAnchor, constant: 30),
            buttonGo.widthAnchor.constraint(equalToConstant: 90),
            buttonGo.heightAnchor.constraint(equalToConstant: 40),
            buttonGo.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10)
        ])
    }
}

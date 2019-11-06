//
//  GADTMediumTemplateView.swift
//  AdsMobills
//
//  Created by Mateus de Sousa on 01/11/19.
//

import Foundation
import UIKit
import GoogleMobileAds

@available(iOS 9.0, *)
public class GADTMediumTemplateView: GADUnifiedNativeAdView {
    
    let container = UIView()
    let loading = UIActivityIndicatorView()
    let titleAd = UILabel()
    let subtitleAds = UILabel()
    let descAds = UILabel()
    let imageAd = GADMediaView()
    let buttonGo = UIButton()
    var iconAds = UIImageView()
    let indicatorAdd = UILabel()
    let starsAppAd = UIImageView()
    
    public func initializeTempleteMedium(){
        addContainerMedium()
        addIndicatorAd()
        addLoading()
        addIconAdsMedium(nameImage: "swift")
        addTitleAdsMedium()
        addSubtitleAdsMedium()
        addDescAdsMedium()
        addImageOrVideoAdsMedium()
        addButtonGoMedium()
        hiddenElementes(isHidden: true)
    }
    
    public var setNativeAd: GADUnifiedNativeAd! {
            didSet{
    //            titleAd.text = setNativeAd.
//                titleAd.
                hiddenElementes(isHidden: false)
                if let icon = setNativeAd.icon {
                    
                }
//                iconAds. = setNativeAd.icon
                titleAd.text = setNativeAd.advertiser
                subtitleAds.text = setNativeAd.headline
                descAds.text = setNativeAd.body
                imageAd.mediaContent = setNativeAd.mediaContent
                buttonGo.setTitle(setNativeAd.callToAction, for: .normal)
    //            imageAd.image = setNativeAd.icon
            }
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
    
    private func hiddenElementes(isHidden: Bool){
        if isHidden{
            loading.startAnimating()
        }else{
            loading.stopAnimating()
        }
        loading.isHidden = !isHidden
        titleAd.isHidden = isHidden
        subtitleAds.isHidden = isHidden
        descAds.isHidden = isHidden
        imageAd.isHidden = isHidden
        buttonGo.isHidden = isHidden
        iconAds.isHidden = isHidden
        indicatorAdd.isHidden = isHidden
        starsAppAd.isHidden = isHidden
    }
        
    private func addContainerMedium(){
        container.backgroundColor = .white
        container.layer.borderWidth = 0.2
        container.layer.borderColor = UIColor.gray.cgColor
        container.layer.cornerRadius = 10
        container.clipsToBounds = true
        self.addSubview(container)
        setConstraintsContainerMedium()
    }
    
    private func addLoading(){
        container.addSubview(loading)
        setContraintsLoadingMedium()
    }
    
    private func addIconAdsMedium(nameImage: String){
        iconAds.image = UIImage(named: nameImage)
        iconAds.contentMode = .scaleAspectFit
        container.addSubview(iconAds)
        setContraintsIcomAdsMedium(thereIcon: iconAds.image == nil)
    }
    
    private func addTitleAdsMedium(){
        titleAd.text = "Conta Santander: abra já"
        titleAd.textColor = .black
        titleAd.font = .boldSystemFont(ofSize: 15)
        titleAd.numberOfLines = 0
        container.addSubview(titleAd)
        setContraintsTitleAdsMedium()
    }
    
    private func addSubtitleAdsMedium(){
        subtitleAds.text = "Santander"
        subtitleAds.textColor = UIColor.black.withAlphaComponent(0.7)
        subtitleAds.font = .boldSystemFont(ofSize: 15)
        subtitleAds.numberOfLines = 0
        container.addSubview(subtitleAds)
        setContraintsSubtitleAdsMedium()
    }
    
    private func addDescAdsMedium(){
        descAds.text = "Transfêrencias ilimitadas entre contas Santander. O que mais podemos fazer por você hoje?"
        descAds.textColor = UIColor.black.withAlphaComponent(0.7)
        descAds.font = .systemFont(ofSize: 12)
        descAds.numberOfLines = 0
        container.addSubview(descAds)
        setContraintsDescAdsMedium()
    }
    
    private func addImageOrVideoAdsMedium(){
//        imageAd.image = UIImage(named: "Santander")
        imageAd.contentMode = .scaleAspectFit
        container.addSubview(imageAd)
        setContraintsImageOrVideoMedium()
    }
    
    private func addButtonGoMedium(){
        buttonGo.setTitle("Abrir", for: .normal)
        buttonGo.setTitleColor(.white, for: .normal)
        buttonGo.backgroundColor = .blue
        buttonGo.layer.cornerRadius = 10
        buttonGo.clipsToBounds = true
        container.addSubview(buttonGo)
        setContraintsButtonGoMedium()
    }
    
    private func setConstraintsContainerMedium(){
        container.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 20),
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
//            container.heightAnchor.constraint(equalToConstant: 440)
        ])
    }
    
    private func setContraintsLoadingMedium(){
        loading.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loading.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 0),
            loading.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 0)
        ])
        
    }
    
    private func setContraintsIcomAdsMedium(thereIcon: Bool){
        var widthAnchor = 60
        var heigthAnchor = 60
        var leadingAnchor = 20
        if thereIcon{
            widthAnchor = 0
            heigthAnchor = 50
            leadingAnchor = 0
        }
        iconAds.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconAds.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: CGFloat(leadingAnchor)),
            iconAds.topAnchor.constraint(equalTo: container.topAnchor, constant: 30),
            iconAds.widthAnchor.constraint(equalToConstant: CGFloat(widthAnchor)),
            iconAds.heightAnchor.constraint(equalToConstant: CGFloat(heigthAnchor))
        ])
    }
    
    private func setContraintsTitleAdsMedium(){
        titleAd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleAd.leadingAnchor.constraint(equalTo: iconAds.trailingAnchor, constant: 20),
            titleAd.topAnchor.constraint(equalTo: container.topAnchor, constant: 30),
            titleAd.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
        ])
    }
    
    private func setContraintsSubtitleAdsMedium(){
        subtitleAds.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleAds.leadingAnchor.constraint(equalTo: iconAds.trailingAnchor, constant: 20),
            subtitleAds.topAnchor.constraint(equalTo: titleAd.bottomAnchor, constant: 5),
            subtitleAds.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20)
        ])
    }
    
    private func setContraintsDescAdsMedium(){
        descAds.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descAds.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            descAds.topAnchor.constraint(equalTo: iconAds.bottomAnchor, constant: 5),
            descAds.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20)
        ])
    }
    
    private func setContraintsImageOrVideoMedium(){
        imageAd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageAd.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            imageAd.topAnchor.constraint(equalTo: descAds.bottomAnchor, constant: 15),
            imageAd.heightAnchor.constraint(equalToConstant: 200),
            imageAd.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20)
        ])
    }
    
    private func setContraintsButtonGoMedium(){
        buttonGo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonGo.topAnchor.constraint(equalTo: imageAd.bottomAnchor, constant: 15),
            buttonGo.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
            buttonGo.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            buttonGo.heightAnchor.constraint(equalToConstant: 40),
            buttonGo.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}

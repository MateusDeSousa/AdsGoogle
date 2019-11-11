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
    
    let titleAd = UILabel()
    let subtitleAds = UILabel()
    let descAds = UILabel()
    let buttonGo = UIButton()
    let iconAds = GADMediaView()
    let indicatorAdd = UILabel()
    let starsAppAd = UIImageView()
    let loading = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeTemplateSmall()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeTemplateSmall()
    }
    
    public var setNativeAd: GADUnifiedNativeAd! {
        didSet{
            hiddenElementes(isHidden: false)
            self.nativeAd = setNativeAd
            iconAds.mediaContent = setNativeAd.mediaContent
            titleAd.text = setNativeAd.advertiser
            buttonGo.setTitle(setNativeAd.callToAction, for: .normal)
        }
    }
    
    public func initializeTemplateSmall(){
        addViewContainerSmall()
        addLoading()
        addIndicatorAd()
        addImageSmall()
        addNameAddSmall()
        addStarsAppImageAd()
        addButtonGoSmall()
        hiddenElementes(isHidden: true)
    }
    
    public func setContraintsAd(viewReference: UIView,leading: Float, trailling: Float, top: Float, botton: Float?){
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: viewReference.leadingAnchor, constant: CGFloat(leading)),
            self.trailingAnchor.constraint(equalTo: viewReference.trailingAnchor, constant: CGFloat(trailling)),
            self.topAnchor.constraint(equalTo: viewReference.topAnchor, constant: CGFloat(top))
        ])
        if let contraintBotton = botton{
            self.bottomAnchor.constraint(equalTo: viewReference.bottomAnchor, constant: CGFloat(contraintBotton)).isActive = true
        }
    }
    
    private func hiddenElementes(isHidden: Bool){
        
        titleAd.isHidden = isHidden
        subtitleAds.isHidden = isHidden
        descAds.isHidden = isHidden
        buttonGo.isHidden = isHidden
        iconAds.isHidden = isHidden
        indicatorAdd.isHidden = isHidden
        starsAppAd.isHidden = isHidden
        loading.isHidden = !isHidden
        isHidden ? loading.startAnimating() : loading.stopAnimating()
    }
    
    private func addLoading(){
        loading.activityIndicatorViewStyle = .gray
        self.addSubview(loading)
        setContraintsLoadingSmall()
    }
    
    private func setContraintsLoadingSmall(){
        loading.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loading.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            loading.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0)
        ])
        
    }
    
    private func addIndicatorAd(){
        indicatorAdd.text = "Ad"
        indicatorAdd.textColor = .white
        indicatorAdd.backgroundColor = UIColor(red: 219/255, green: 200/255, blue: 22/255, alpha: 1)
        indicatorAdd.textAlignment = .center
        indicatorAdd.font = .boldSystemFont(ofSize: 15)
        indicatorAdd.clipsToBounds = false
        self.addSubview(indicatorAdd)
        setContraintsIndicatorAdd()
    }
    
    private func setContraintsIndicatorAdd(){
        indicatorAdd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorAdd.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            indicatorAdd.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            indicatorAdd.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func addViewContainerSmall(){
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.2
        self.clipsToBounds = true
        self.backgroundColor = .white
    }

    
    private func addImageSmall(){
        iconAds.contentMode = .scaleAspectFill
        self.addSubview(iconAds)
        setContraintsImageSmall()
    }
    
    private func addNameAddSmall(){
        titleAd.font = .boldSystemFont(ofSize: 15)
        titleAd.text = "Teste do Ad"
        titleAd.textColor = .black
        self.addSubview(titleAd)
        setContraintsNameAdSmall()
    }
    
    private func addStarsAppImageAd(){
        starsAppAd.image = UIImage(named: "stars")
        self.addSubview(starsAppAd)
        setConstraintsStarsAppAdSmall()
    }
    
    private func addButtonGoSmall(){
        buttonGo.backgroundColor = .blue
        buttonGo.layer.cornerRadius = 10
        buttonGo.clipsToBounds = true
        buttonGo.setTitle("Instalar", for: .normal)
        buttonGo.setTitleColor(.white, for: .normal)
        self.addSubview(buttonGo)
        setContraintsButtonGoSmall()
    }
    
//    private func setContraintsContainerSmall(){
//        let margins = self.layoutMarginsGuide
//        container.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            container.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
//            container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
//            container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
//        ])
//    }

    private func setContraintsImageSmall(){
        iconAds.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconAds.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            iconAds.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            iconAds.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            iconAds.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15),
            iconAds.heightAnchor.constraint(equalToConstant:65),
            iconAds.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
    private func setContraintsNameAdSmall(){
        titleAd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleAd.centerYAnchor.constraint(equalTo: iconAds.centerYAnchor, constant: -10),
            titleAd.leadingAnchor.constraint(equalTo: iconAds.trailingAnchor, constant: 5)
        ])
    }
    
    private func setConstraintsStarsAppAdSmall(){
        starsAppAd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starsAppAd.leadingAnchor.constraint(equalTo: iconAds.trailingAnchor, constant: 20),
            starsAppAd.topAnchor.constraint(equalTo: titleAd.bottomAnchor, constant: 10),
            starsAppAd.heightAnchor.constraint(equalToConstant: 20),
            starsAppAd.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func setContraintsButtonGoSmall(){
        buttonGo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonGo.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            buttonGo.widthAnchor.constraint(equalToConstant: 90),
            buttonGo.heightAnchor.constraint(equalToConstant: 40),
            buttonGo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}

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
    let descAds = UILabel()
    let buttonGo = UIButton()
    let iconAds = GADMediaView()
    let indicatorAdd = UILabel()
    let starsAppAd = UIImageView()
    let loading = UIActivityIndicatorView()
    
    //reference constraints
    var titleConstraintsTop = NSLayoutConstraint()
    
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
            if let textTitle = setNativeAd.advertiser {
                titleAd.text = textTitle
            }else{
                titleAd.text = setNativeAd.headline
            }
            if let _ = setNativeAd.store{
                descAds.isHidden = true
                applyQtdStars(number: setNativeAd.starRating)
            }else{
                starsAppAd.isHidden = true
                titleConstraintsTop.constant = -23
                descAds.text = setNativeAd.body
            }
            buttonGo.setTitle(setNativeAd.callToAction, for: .normal)
        }
    }
    
    public func initializeTemplateSmall(){
        addViewContainerSmall()
        addLoading()
        addIndicatorAd()
        addImageSmall()
        addButtonGoSmall()
        addNameAddSmall()
        addStarsAppImageAd()
        addDescAdsMedium()
        hiddenElementes(isHidden: true)
    }
    
    public func setStyleElements(backgroundButton: UIColor? = .blue, colorTitleButton: UIColor? = .white, cornerRadiusButton: Float? = 10, cornerRadiusMediaView: Float? = 10, cornerRadiusIconAd: Float? = 10, cornerRadiusTemplate: Float? = 10, backgroundTemplate: UIColor? = .white, colorTitleAd: UIColor? = .black, colorDescriptionAd: UIColor? = UIColor.black.withAlphaComponent(0.7)){
        buttonGo.backgroundColor = backgroundButton
        buttonGo.setTitleColor(colorTitleButton, for: .normal)
        buttonGo.layer.cornerRadius = CGFloat(cornerRadiusButton!)
        iconAds.layer.cornerRadius = CGFloat(cornerRadiusIconAd!)
        self.layer.cornerRadius = CGFloat(cornerRadiusTemplate!)
        self.backgroundColor = backgroundTemplate
        titleAd.textColor = colorTitleAd
        descAds.textColor = colorDescriptionAd
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
        descAds.isHidden = isHidden
        buttonGo.isHidden = isHidden
        iconAds.isHidden = isHidden
        indicatorAdd.isHidden = isHidden
        starsAppAd.isHidden = isHidden
        loading.isHidden = !isHidden
        isHidden ? loading.startAnimating() : loading.stopAnimating()
    }
    
    private func addLoading(){
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
        starsAppAd.image = UIImage(named: "")
        starsAppAd.contentMode = .scaleAspectFit
        self.addSubview(starsAppAd)
        setConstraintsStarsAppAdSmall()
    }
    
    private func applyQtdStars(number: NSDecimalNumber?){
        if let numberStars = number as? Double{
            if numberStars <= 0.5{
                starsAppAd.image = UIImage(named: "rate-10")
            }else if numberStars > 0.5 && numberStars <= 1.0{
                starsAppAd.image = UIImage(named: "rate-9")
            }else if numberStars > 1.0 && numberStars <= 1.5{
                starsAppAd.image = UIImage(named: "rate-8")
            }else if numberStars > 1.5 && numberStars <= 2.0{
                starsAppAd.image = UIImage(named: "rate-7")
            }else if numberStars > 2.0 && numberStars <= 2.5{
                starsAppAd.image = UIImage(named: "rate-6")
            }else if numberStars > 2.5 && numberStars <= 3.0{
                starsAppAd.image = UIImage(named: "rate-5")
            }else if numberStars > 3.0 && numberStars <= 3.5{
                starsAppAd.image = UIImage(named: "rate-4")
            }else if numberStars > 3.5 && numberStars <= 4.0{
                starsAppAd.image = UIImage(named: "rate-3")
            }else if numberStars > 4.0 && numberStars <= 4.5{
                starsAppAd.image = UIImage(named: "rate-2")
            }else if numberStars > 4.5 && numberStars <= 5.0{
                starsAppAd.image = UIImage(named: "rate-1")
            }
        }
    }
    
    private func addButtonGoSmall(){
        buttonGo.backgroundColor = .blue
        buttonGo.titleLabel?.font = .boldSystemFont(ofSize: 15)
        buttonGo.layer.cornerRadius = 10
        buttonGo.clipsToBounds = true
        buttonGo.setTitle("Instalar", for: .normal)
        buttonGo.setTitleColor(.white, for: .normal)
        self.addSubview(buttonGo)
        setContraintsButtonGoSmall()
    }
    
    private func addDescAdsMedium(){
        descAds.textColor = UIColor.black.withAlphaComponent(0.7)
        descAds.font = .systemFont(ofSize: 12)
        descAds.numberOfLines = 0
        self.addSubview(descAds)
        setContraintsDescAdsMedium()
    }
    
    private func setContraintsDescAdsMedium(){
        descAds.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descAds.leadingAnchor.constraint(equalTo: iconAds.trailingAnchor, constant: 10),
            descAds.topAnchor.constraint(equalTo: titleAd.bottomAnchor, constant: 5),
            descAds.trailingAnchor.constraint(equalTo: buttonGo.leadingAnchor, constant: -20)
        ])
    }

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
        titleConstraintsTop = titleAd.centerYAnchor.constraint(equalTo: iconAds.centerYAnchor, constant: -10)
        NSLayoutConstraint.activate([
            titleConstraintsTop,
            titleAd.leadingAnchor.constraint(equalTo: iconAds.trailingAnchor, constant: 10),
            titleAd.trailingAnchor.constraint(equalTo: buttonGo.leadingAnchor, constant: -20)
        ])
    }
    
    private func setConstraintsStarsAppAdSmall(){
        starsAppAd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            starsAppAd.leadingAnchor.constraint(equalTo: iconAds.trailingAnchor, constant: 10),
            starsAppAd.topAnchor.constraint(equalTo: titleAd.bottomAnchor, constant: 7),
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

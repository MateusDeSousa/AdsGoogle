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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeTempleteMedium()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeTempleteMedium()
    }
    
    public func initializeTempleteMedium(){
        setAtributtedDefault()
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
            hiddenElementes(isHidden: false)
            if let icon = setNativeAd.icon {
                iconAds.image = icon.image
                setContraintsIcomAdsMedium(thereIcon: false)
                iconAds.updateConstraints()
                self.updateConstraints()
                super.updateConstraints()
                
            }
            titleAd.text = setNativeAd.advertiser
            subtitleAds.text = setNativeAd.headline
            descAds.text = setNativeAd.body
            imageAd.mediaContent = setNativeAd.mediaContent
            buttonGo.setTitle(setNativeAd.callToAction, for: .normal)
        }
    }
    
    private func setContraintsIndicatorAdd(){
        indicatorAdd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorAdd.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            indicatorAdd.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
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
        
    public func setContraintsAd(viewReference: UIView,leading: Float, trailling: Float, top: Float, botton: Float){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: viewReference.leadingAnchor, constant: CGFloat(leading)).isActive = true
        self.trailingAnchor.constraint(equalTo: viewReference.trailingAnchor, constant: CGFloat(trailling)).isActive = true
        self.topAnchor.constraint(equalTo: viewReference.topAnchor, constant: CGFloat(top)).isActive = true
        self.bottomAnchor.constraint(equalTo: viewReference.bottomAnchor, constant: CGFloat(botton)).isActive = true
    }
    
    private func setAtributtedDefault(){
        self.backgroundColor = .white
        self.layer.borderWidth = 0.2
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
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
    
    private func addLoading(){
        self.addSubview(loading)
        setContraintsLoadingMedium()
    }
    
    private func addIconAdsMedium(nameImage: String){
        iconAds.image = UIImage(named: nameImage)
        iconAds.contentMode = .scaleAspectFit
        self.addSubview(iconAds)
        setContraintsIcomAdsMedium(thereIcon: iconAds.image == nil)
    }
    
    private func addTitleAdsMedium(){
        titleAd.textColor = .black
        titleAd.font = .boldSystemFont(ofSize: 15)
        titleAd.numberOfLines = 0
        self.addSubview(titleAd)
        setContraintsTitleAdsMedium()
    }
    
    private func addSubtitleAdsMedium(){
        subtitleAds.textColor = UIColor.black.withAlphaComponent(0.7)
        subtitleAds.font = .boldSystemFont(ofSize: 15)
        subtitleAds.numberOfLines = 0
        self.addSubview(subtitleAds)
        setContraintsSubtitleAdsMedium()
    }
    
    private func addDescAdsMedium(){
        descAds.textColor = UIColor.black.withAlphaComponent(0.7)
        descAds.font = .systemFont(ofSize: 12)
        descAds.numberOfLines = 0
        self.addSubview(descAds)
        setContraintsDescAdsMedium()
    }
    
    private func addImageOrVideoAdsMedium(){
        imageAd.contentMode = .scaleAspectFit
        self.addSubview(imageAd)
        setContraintsImageOrVideoMedium()
    }
    
    private func addButtonGoMedium(){
        buttonGo.setTitleColor(.white, for: .normal)
        buttonGo.backgroundColor = .blue
        buttonGo.layer.cornerRadius = 10
        buttonGo.clipsToBounds = true
        self.addSubview(buttonGo)
        setContraintsButtonGoMedium()
    }

    private func setContraintsLoadingMedium(){
        loading.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loading.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
            loading.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0)
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
            iconAds.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(leadingAnchor)),
            iconAds.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            iconAds.widthAnchor.constraint(equalToConstant: CGFloat(widthAnchor)),
            iconAds.heightAnchor.constraint(equalToConstant: CGFloat(heigthAnchor))
        ])
    }
    
    private func setContraintsTitleAdsMedium(){
        titleAd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleAd.leadingAnchor.constraint(equalTo: iconAds.trailingAnchor, constant: 20),
            titleAd.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            titleAd.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    private func setContraintsSubtitleAdsMedium(){
        subtitleAds.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            subtitleAds.leadingAnchor.constraint(equalTo: iconAds.trailingAnchor, constant: 20),
            subtitleAds.topAnchor.constraint(equalTo: titleAd.bottomAnchor, constant: 5),
            subtitleAds.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    private func setContraintsDescAdsMedium(){
        descAds.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descAds.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descAds.topAnchor.constraint(equalTo: iconAds.bottomAnchor, constant: 5),
            descAds.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    private func setContraintsImageOrVideoMedium(){
        imageAd.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageAd.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageAd.topAnchor.constraint(equalTo: descAds.bottomAnchor, constant: 15),
            imageAd.heightAnchor.constraint(equalToConstant: 200),
            imageAd.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    private func setContraintsButtonGoMedium(){
        buttonGo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonGo.topAnchor.constraint(equalTo: imageAd.bottomAnchor, constant: 15),
            buttonGo.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            buttonGo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            buttonGo.heightAnchor.constraint(equalToConstant: 40),
            buttonGo.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}

Pod::Spec.new do |spec|
  spec.name         = "AdsGoogle"
  spec.version      = "0.0.1"
  spec.summary      = "Lib of ads google."
  spec.description  = <<-DESC
                    Lib destined to insert ads in iOS apps in order to monetize.
                    DESC

  spec.homepage     = "https://github.com/MateusDeSousa/AdsGoogle"
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author = { "Mateus Sousa" => "mateusdevsousa@gmail.com" }
  spec.social_media_url = "https://twitter.com/mateus_sousa27"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #  
  spec.platform = :ios, "10.0"
  spec.swift_version = '5.0'

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source = { :git => "https://github.com/MateusDeSousa/AdsGoogle.git", :tag => "#{spec.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "Classes", "AdsGoogle/AdsGoogle/Source/**/*.{swift}"

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.requires_arc = true
  spec.static_framework = true
  spec.dependency 'Google-Mobile-Ads-SDK'

end

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
  spec.social_media_url = "https://www.linkedin.com/in/mateusdesousa"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #  
  spec.platform = :ios, "10.0"
  spec.swift_version = '5.0'

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source = { :git => "https://github.com/MateusDeSousa/AdsGoogle.git", :tag => "#{spec.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "Classes", "AdsGoogle/AdsGoogle/**/*.{swift}"

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  spec.static_framework = true
  spec.dependency 'Google-Mobile-Ads-SDK', '~> 7.8'

end

# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

workspace 'AdsGoogle'

def example_native
#    pod ''
end

def example_interstitial
#    pod ''
end

def ads_google
    pod 'Google-Mobile-Ads-SDK'
end

target 'AdsGoogle' do
    project 'AdsGoogle/AdsGoogle.project'
    ads_google
end

target 'ExampleNative' do
    project 'ExampleNative/ExampleNative.project'
    example_native
end

target 'ExampleInterstitial' do
    project 'ExampleInterstitial/ExampleInterstitial.project'
    example_interstitial
end

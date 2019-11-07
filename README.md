# AdsMobills

[![CI Status](https://img.shields.io/travis/mateusdesousa/AdsMobills.svg?style=flat)](https://travis-ci.org/mateusdesousa/AdsMobills)
[![Version](https://img.shields.io/cocoapods/v/AdsMobills.svg?style=flat)](https://cocoapods.org/pods/AdsMobills)
[![License](https://img.shields.io/cocoapods/l/AdsMobills.svg?style=flat)](https://cocoapods.org/pods/AdsMobills)
[![Platform](https://img.shields.io/cocoapods/p/AdsMobills.svg?style=flat)](https://cocoapods.org/pods/AdsMobills)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requisitos
- Xcode 11
- Permissões de acesso a esse repositório

## Instalação

AdsMobills está disponivél somento no Bitbucket, para instalar deve-se inserir a seguinte linha em seu PodFile:


```ruby
pod 'AdsMobills', :git => 'https://mateusdevsousa@bitbucket.org/mob_apps/ad-manager-ios.git'
```

Em seguida executar o comando `pod install` no diretório a qual está localizado seu Podfile. 


## Configurações iniciais no projeto.

No info.plist do seu projeto, será necessário adicionar o key `GADIsAdManagerApp` com valor booleano `true`.

importar a lib com `import AdsMobills` em seu AppDelegate.

Iniciar a lib passando os dados para configuração da mesma no metodo `didFinishLaunchingWithOptions` com o seguinte trecho de código:



```ruby
AdsMobillsSetup.share.startAds(appId: "",
                                adUnitIntertitialDefault: "ca-app-pub-3940256099942544/4411468910",
                                adUnitIntertitialExpensive: "ca-app-pub-3940256099942544/4411468912",
                                adUnitNativeDefault: "ca-app-pub-3940256099942544/3986624511",
                                adUnitNativeExpensive: "ca-app-pub-3940256099942544/3986624511")
````

## Utilização de Ads Interstitials


## Utilização de Ads Natives


## Autor da Lib

Mateus De Sousa, mateusdevsousa@gmail.com

## Licença

AdsMobills is available under the MobApps license. See the LICENSE file for more info.

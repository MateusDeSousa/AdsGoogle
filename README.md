# AdsMobills

[![CI Status](https://img.shields.io/travis/mateusdesousa/AdsMobills.svg?style=flat)](https://travis-ci.org/mateusdesousa/AdsMobills)
[![Version](https://img.shields.io/cocoapods/v/AdsMobills.svg?style=flat)](https://cocoapods.org/pods/AdsMobills)
[![License](https://img.shields.io/cocoapods/l/AdsMobills.svg?style=flat)](https://cocoapods.org/pods/AdsMobills)
[![Platform](https://img.shields.io/cocoapods/p/AdsMobills.svg?style=flat)](https://cocoapods.org/pods/AdsMobills)

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
```

## Utilização de Ads Interstitials

Para melhor organização do código, referenciar instancia do AdsMobillsInterstitials em uma variavel.

ex. `var googleAds = AdsMobillsInterstitial.instance`

- Ao clicar em botões:

`googleAds.showInterstitialClick(fromController: UIViewController)`

- Ao executar transição do tipo present.
`googleAds.showInterstitialBeforePresent(fromController: UIViewController, toController: UIViewController)`

- Ao executar transições de tela do tipo Push:
`googleAds.showInterstitialBeforePush(fromController: UIViewController, toController: UIViewController)`

- Ao abrir o App, forçando exibir interstitial:
``` 
googleAds.showInterstitialByLoadScreen { loaded in
   if loaded{
     //show interstitial and load main Screen
   }else{
     //following main screen
   }
}
```



## Utilização de Ads Natives

- `viewNative` é o template a ser utilizado.
- `view` é a view de referência a qual o template ira ser inserido.
- `fromController` é a controller em que o Ad irá aparecer.

#### Templates Medium

```
let viewNative = GADTMediumTemplateView()
view.addSubview(viewNative)
viewNative.setContraintsAd(viewReference: view, leading: 20, trailling: -20, top: 90, botton: 0)
AdsMobillsNative.shareInstance.loadAdsNative(fromController: self, viewTemplate: viewNative)

```

#### Templates Small
```
let viewNative = GADTSmallTemplateView()
view.addSubview(viewNative)
viewNative.setContraintsAd(viewReference: view, leading: 20, trailling: -20, top: 90, botton: 0)
AdsMobillsNative.shareInstance.loadAdsNative(fromController: self, viewTemplate: viewNative)

```

## Autor da Lib

Mateus De Sousa, mateusdevsousa@gmail.com

## Licença

AdsMobills is available under the MobApps license. See the LICENSE file for more info.

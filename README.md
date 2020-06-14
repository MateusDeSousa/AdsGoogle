<p align="center">
<img src="ReadmeAssets/google-ads.gif" width="200" height="200" />
</p>

<p align="center">
AdsGoogle is a library created by Mateus Sousa. For those who want to implement AdMob in their apps for monetization. This library abbreviated logic from google's own lib to make it easy to use or even scale.</p>

<p align="center">
  <a href="https://travis-ci.com/MateusDeSousa/AdsGoogle">
    <img alt="Build Status" src="https://travis-ci.com/MateusDeSousa/AdsGoogle.svg?branch=master">
  </a>
  
  <a href="https://github.com/mateusdesousa">
    <img alt="Made by Mateus Sousa" src="https://img.shields.io/badge/made%20by-Mateus%20Sousa-brightgreen">
  </a>

  <img alt="Last Commit" src="https://img.shields.io/github/last-commit/mateusdesousa/AdsGoogle">

  <img alt="Contributors" src="https://img.shields.io/github/contributors/mateusdesousa/AdsGoogle">

  <img alt="License" src="https://img.shields.io/badge/license-MIT-%2304D361">
</p>

---

## 🚀 Getting Started

### Install pod

- In Podfile include:

```pod 'AdsGoogle', :git => 'https://github.com/MateusDeSousa/AdsGoogle.git'```

### Setup info.plist of the project

- Include ```GADApplicationIdentifier``` with the respective id for your app created in AdMob.
- Include ```GADIsAdManagerApp``` in your info.plist with value true.

### Setup Ad

#### NativeAd

- In your appdelegate, preferably in the boot method add the following code:
```AdsNativeManager.instance.setup(idNative: "id_ad")```

<a href="https://www.google.com.br">Example</a>


### Using Ad

#### Native ad
<a href="https://github.com/MateusDeSousa/AdsGoogle/blob/master/ExampleNative/ExampleNative/ViewController.swift">Example</a>

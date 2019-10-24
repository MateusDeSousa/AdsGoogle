import UIKit
import GoogleMobileAds

public class AdsMobillsInterstitial: NSObject, GADInterstitialDelegate{
    
    public static var instance = AdsMobillsInterstitial()
    
    var interstitial: GADInterstitial!
    var fromController: UIViewController!
    var toController: UIViewController!
    var methodNavigation: MethodNavigation?
    
    var adIdExpensive = ""
    var adIdDefault = ""
    
    static var adReceived: ((Bool) -> Void)?
    
    public func startAdsMobills(adIdExpensive: String, adIdDefault: String){
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        self.adIdDefault = adIdDefault
        self.adIdExpensive = adIdExpensive
        self.interstitial = loadExpensiveInterstitial()
    }
    
    public func loadExpensiveInterstitial() -> GADInterstitial{
        let interstitial = GADInterstitial(adUnitID: adIdExpensive)
        interstitial.delegate = AdsMobillsInterstitial.instance
        interstitial.load(GADRequest())
        return interstitial
    }
    
    public func loadDefaultInterstitial() -> GADInterstitial{
        let interstitial = GADInterstitial(adUnitID: adIdDefault)
        interstitial.delegate = AdsMobillsInterstitial.instance
        interstitial.load(GADRequest())
        return interstitial
    }
    //Ao clicar em botões
    public func showInterstitialClick(fromController: UIViewController){
        self.methodNavigation = .none
        self.interstitial.present(fromRootViewController: fromController)
    }
    
    //Ao executar transições
    private func showInterstitial(fromController: UIViewController){
        self.interstitial.present(fromRootViewController: fromController)
    }
    
    //Ao dar present
    public func showInterstitialBeforePresent(fromController: UIViewController, toController: UIViewController){
        self.fromController = fromController
        self.toController = toController
        self.methodNavigation = .present
        if self.interstitial.isReady{
            showInterstitial(fromController: self.fromController)
        }else{
            presentController()
        }
    }
    
    //Ao dar push
    public func showInterstitialBeforePush(fromController: UIViewController, toController: UIViewController){
        self.fromController = fromController
        self.toController = toController
        self.methodNavigation = .push
        if self.interstitial.isReady{
            showInterstitial(fromController: self.fromController)
        }else{
            pushController()
        }
    }
    
    //Ao abrir o app
    public func showInterstitialByLoadScreen(completion: @escaping ((Bool) -> Void)){
        AdsMobillsInterstitial.adReceived = completion
    }
    
    private func presentController(){
        self.fromController.present(self.toController, animated: true, completion: nil)
    }
    
    private func pushController(){
        self.fromController.navigationController?.pushViewController(self.toController, animated: true)
    }
    
    
    //MARK: Methods delegate
    
    public func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.interstitial = loadExpensiveInterstitial()
        switch self.methodNavigation {
        case .present:
            presentController()
        default:
            break
        }

    }
    
    public func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        self.interstitial = loadExpensiveInterstitial()
        switch self.methodNavigation {
        case .push:
            pushController()
        default:
            break
        }
    }
    
    public func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        let intertitialId = self.interstitial
        if intertitialId?.adUnitID == adIdExpensive{
            self.interstitial = loadDefaultInterstitial()
            return
        }
        AdsMobillsInterstitial.adReceived?(false)
        
    }
    
    public func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        AdsMobillsInterstitial.adReceived?(true)
    }
    enum MethodNavigation{
        case push, present
    }

}



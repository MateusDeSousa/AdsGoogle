import UIKit
import GoogleMobileAds

public class AdsMobillsInterstitial: NSObject, GADInterstitialDelegate{
    
    public static var instance = AdsMobillsInterstitial()
    
    static var interstitial: GADInterstitial!
    static var fromController: UIViewController!
    static var toController: UIViewController!
    static var methodNavigation: MethodNavigation?
    
    static var adIdExpensive: String!
    static var adIdDefault: String!
    
    static var adReceived: ((Bool) -> Void)?
    
    public func startAdsMobills(adIdExpensive: String, adIdDefault: String){
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        AdsMobillsInterstitial.adIdDefault = adIdDefault
        AdsMobillsInterstitial.adIdExpensive = adIdExpensive
        AdsMobillsInterstitial.interstitial = loadExpensiveInterstitial()
    }
    
    
    
    public func loadExpensiveInterstitial() -> GADInterstitial{
        let interstitial = GADInterstitial(adUnitID: AdsMobillsInterstitial.adIdExpensive)
        interstitial.delegate = AdsMobillsInterstitial.instance
        interstitial.load(GADRequest())
        return interstitial
    }
    
    public func loadDefaultInterstitial() -> GADInterstitial{
        let interstitial = GADInterstitial(adUnitID: AdsMobillsInterstitial.adIdDefault)
        interstitial.delegate = AdsMobillsInterstitial.instance
        interstitial.load(GADRequest())
        return interstitial
    }
    //Ao clicar em botões
    public func showInterstitialClick(fromController: UIViewController){
        AdsMobillsInterstitial.methodNavigation = .none
        AdsMobillsInterstitial.interstitial.present(fromRootViewController: fromController)
    }
    
    //Ao executar transições
    private func showInterstitial(fromController: UIViewController){
        AdsMobillsInterstitial.interstitial.present(fromRootViewController: fromController)
    }
    
    //Ao dar present
    public func showInterstitialBeforePresent(fromController: UIViewController, toController: UIViewController){
        AdsMobillsInterstitial.fromController = fromController
        AdsMobillsInterstitial.toController = toController
        AdsMobillsInterstitial.methodNavigation = .present
        if AdsMobillsInterstitial.interstitial.isReady{
            showInterstitial(fromController: AdsMobillsInterstitial.fromController)
        }else{
            presentController()
        }
    }
    
    //Ao dar push
    public func showInterstitialBeforePush(fromController: UIViewController, toController: UIViewController){
        AdsMobillsInterstitial.fromController = fromController
        AdsMobillsInterstitial.toController = toController
        AdsMobillsInterstitial.methodNavigation = .push
        if AdsMobillsInterstitial.interstitial.isReady{
            showInterstitial(fromController: AdsMobillsInterstitial.fromController)
        }else{
            pushController()
        }
    }
    
    //Ao dar Pop
    public func showInterstitialBeforePop(fromController: UIViewController){
        AdsMobillsInterstitial.fromController = fromController
        AdsMobillsInterstitial.methodNavigation = .pop
        if AdsMobillsInterstitial.interstitial.isReady{
            showInterstitial(fromController: AdsMobillsInterstitial.fromController)
        }else{
            popController()
        }
    }
    
    //Ao abrir o app
    public func showInterstitialByLoadScreen(completion: @escaping ((Bool) -> Void)){
        AdsMobillsInterstitial.adReceived = completion
    }
    
    private func presentController(){
        AdsMobillsInterstitial.fromController.present(AdsMobillsInterstitial.toController, animated: true, completion: nil)
    }
    
    private func pushController(){
        AdsMobillsInterstitial.fromController.navigationController?.pushViewController(AdsMobillsInterstitial.toController, animated: true)
    }
    
    private func popController(){
        AdsMobillsInterstitial.fromController.navigationController?.popViewController(animated: true)
    }
    
    //MARK: Methods delegate
    
    public func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        AdsMobillsInterstitial.interstitial = loadExpensiveInterstitial()
        switch AdsMobillsInterstitial.methodNavigation {
        case .present:
            presentController()
        default:
            break
        }

    }
    
    public func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        AdsMobillsInterstitial.interstitial = loadExpensiveInterstitial()
        switch AdsMobillsInterstitial.methodNavigation {
        case .push:
            pushController()
        case .pop:
            popController()
        default:
            break
        }
    }
    
    public func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        let intertitialId = AdsMobillsInterstitial.interstitial
        if intertitialId?.adUnitID == AdsMobillsInterstitial.adIdExpensive{
            AdsMobillsInterstitial.interstitial = loadDefaultInterstitial()
            return
        }
        AdsMobillsInterstitial.adReceived?(false)
        
    }
    
    public func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        AdsMobillsInterstitial.adReceived?(true)
    }
    enum MethodNavigation{
        case push, present, pop
    }

}



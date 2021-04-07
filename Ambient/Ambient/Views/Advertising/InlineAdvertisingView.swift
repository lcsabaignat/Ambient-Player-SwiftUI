//
//  AdvertisingView.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 19/03/2021.
//

import Foundation
import SwiftUI
import UIKit
import VerizonAdsInlinePlacement

struct InlineAdvertisingView: UIViewControllerRepresentable {
  
  func makeUIViewController(context: Context) -> UIViewController {
    return AdvertisingViewController()
  }
  
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    
  }
}

private class AdvertisingViewController: UIViewController {
  
  private var adFactory: VASInlineAdFactory?
  
  override func viewDidLoad() {
    
    adFactory = VASInlineAdFactory(placementId: "240372",
                                   adSizes: [VASInlineAdSize(width: UInt(self.view.frame.width),
                                                             height: UInt(self.view.frame.height))],
                                   vasAds: VASAds.sharedInstance,
                                   delegate: self)
    adFactory?.load(self)
    view.alpha = 0
  }
}

extension AdvertisingViewController: VASInlineAdFactoryDelegate {
  
  func inlineAdFactory(_ adFactory: VASInlineAdFactory, didLoadInlineAd inlineAd: VASInlineAdView) {
    
    DispatchQueue.main.async {
      inlineAd.frame = self.view.bounds
      self.view.addSubview(inlineAd)

      UIView.animate(withDuration: 1) {
        self.view.alpha = 1
      }
    }
  }
  
  func inlineAdFactory(_ adFactory: VASInlineAdFactory, didFailWithError errorInfo: VASErrorInfo) {
    
  }
}

extension AdvertisingViewController: VASInlineAdViewDelegate {
  
  func inlineAdDidFail(_ inlineAd: VASInlineAdView, withError errorInfo: VASErrorInfo) {
    
  }
  
  func inlineAdDidExpand(_ inlineAd: VASInlineAdView) {
    
  }
  
  func inlineAdDidCollapse(_ inlineAd: VASInlineAdView) {
    
  }
  
  func inlineAdClicked(_ inlineAd: VASInlineAdView) {
    
  }
  
  func inlineAdDidLeaveApplication(_ inlineAd: VASInlineAdView) {
    
  }
  
  func inlineAdDidResize(_ inlineAd: VASInlineAdView) {
    
  }
  
  func inlineAdDidRefresh(_ inlineAd: VASInlineAdView) {
    
  }
  
  func inlineAdPresentingViewController() -> UIViewController? {
    self
  }
  
  func inlineAd(_ inlineAd: VASInlineAdView, event eventId: String, source: String, arguments: [String : Any]) {
    
  }
}


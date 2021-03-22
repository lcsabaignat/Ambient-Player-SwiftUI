//
//  AmbientApp.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 19/03/2021.
//

import SwiftUI
import VerizonAdsCore

class AppDelegate: NSObject, UIApplicationDelegate {
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    VASAds.sharedInstance.initialize(withSiteId: "8a809418014d4dba274de5017840037f")
    
    return true
  }
}

@main
struct AmbientApp: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  var body: some Scene {
    WindowGroup {
      ContentView()
        .background(
          LinearGradient(gradient: Gradient(colors: [.white, .red, .black]),
                         startPoint: .topLeading,
                         endPoint: .bottomTrailing)
        )
        .ignoresSafeArea()
    }
  }
}

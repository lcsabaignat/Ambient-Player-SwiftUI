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
          MotionGradient(gradient: Gradient(colors: [
            Color(red: 0.7, green: 0.3, blue: 0.6),
            Color(red: 0.5, green: 0.4, blue: 0.7),
            Color(red: 0.3, green: 0.5, blue: 0.8),
            Color(red: 0.1, green: 0.6, blue: 0.9),
          ]))
        )
        .ignoresSafeArea()
    }
  }
}

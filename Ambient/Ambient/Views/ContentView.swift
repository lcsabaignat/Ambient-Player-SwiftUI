//
//  ContentView.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 19/03/2021.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var playerViewModel = PlayerViewModel()
  
  var body: some View {
    ZStack {
      InlineAdvertisingView().frame(width: 320, height: 50)
      AmbientPlayerView(playerViewModel: playerViewModel)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

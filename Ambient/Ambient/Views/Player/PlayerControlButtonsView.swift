//
//  PlayerControlButtonsView.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 22/03/2021.
//

import SwiftUI

struct PlayerControlButtonsView: View {
  
  @EnvironmentObject var playerViewModel: PlayerViewModel
  
  var body: some View {
    HStack {
      Spacer()
      Button(action: {}, label: {
          Image(systemName: "backward.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 40.0, height: 40.0)
        })
        .frame(width: 50.0, height: 50.0)
        .accentColor(.black)
      Spacer()
      Button(action: {
        playerViewModel.changePlayStatus()
      }, label: {
          Image(systemName: playerViewModel.isPlaying ? "pause.fill" : "play.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 40.0, height: 40.0)
        })
        .frame(width: 50.0, height: 50.0)
        .accentColor(.black)
        .animation(.interpolatingSpring(stiffness: 60,
                                        damping: 12,
                                        initialVelocity: 6))
      Spacer()
      Button(action: {}, label: {
          Image(systemName: "forward.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 40.0, height: 40.0)
        })
        .frame(width: 50.0, height: 50.0)
        .accentColor(.black)
      Spacer()
    }
  }
}

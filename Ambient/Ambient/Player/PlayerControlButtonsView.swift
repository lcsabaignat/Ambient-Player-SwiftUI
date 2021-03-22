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
      Image(systemName: "backward.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 40.0, height: 40.0)
      Spacer()
      Image(systemName: playerViewModel.isPlaying ? "pause.fill" : "play.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 34.0, height: 34.0)
        .gesture(TapGesture().onEnded() {
          playerViewModel.changePlayStatus()
        })
      Spacer()
      Image(systemName: "forward.fill")
        .resizable()
        .scaledToFit()
        .frame(width: 40.0, height: 40.0)
      Spacer()
    }
  }
}

//
//  PlayerButtonsView.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 22/03/2021.
//

import SwiftUI

struct PlayerButtonsView: View {
  
  @EnvironmentObject private var playerViewModel: PlayerViewModel
  var isPlaylistOpen: Bool
  var onOpenPlaylist: () -> ()
  var onClosePlaylist: () -> ()
  
  var body: some View {
    HStack {
      Spacer()
      Image(systemName: volumeImageSystemName())
        .resizable()
        .scaledToFit()
        .frame(width: 40.0, height: 20.0)
        .gesture(TapGesture().onEnded() {
          playerViewModel.changeVolumeLevel()
        })
      Spacer()
      PlayerControlButtonsView()
      Spacer()
      Image(systemName: "music.note.list")
        .resizable()
        .scaledToFit()
        .frame(width: 40.0, height: 20.0)
        .foregroundColor(isPlaylistOpen ? Color(UIColor.darkGray) : .black)
        .gesture(TapGesture().onEnded() {
          isPlaylistOpen ? onClosePlaylist() : onOpenPlaylist()
        })
      Spacer()
    }
  }
  
  private func volumeImageSystemName() -> String {
    switch playerViewModel.volume {
    case .low:
      return "speaker.wave.1"
    case .mid:
      return "speaker.wave.2"
    case .high:
      return "speaker.wave.3"
    default :
      return "speaker"
    }
  }
}

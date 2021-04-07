//
//  PlayerButtonsView.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 22/03/2021.
//

import SwiftUI

struct PlayerButtonsView: View {
  
  @EnvironmentObject var playerViewModel: PlayerViewModel
  
  let isPlaylistOpen: Bool
  let onOpenPlaylist: () -> ()
  let onClosePlaylist: () -> ()
  
  var body: some View {
    VStack {
      isPlaylistOpen ? Spacer().frame(maxHeight: 20) : Spacer().frame(minHeight: 20)
      HStack {
        Spacer()
        Button(action: {
            playerViewModel.changeVolumeLevel()
          }, label: {
            Image(systemName: volumeImageSystemName())
              .resizable()
              .scaledToFit()
              .frame(width: 40.0, height: 20.0)
              .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
          })
          .frame(width: 60.0, height: 60.0)
          .accentColor(.black)
        Spacer()
        PlayerControlButtonsView()
        Spacer()
        Button(action: {
            isPlaylistOpen ? onClosePlaylist() : onOpenPlaylist()
          }, label: {
            Image(systemName: "music.note.list")
              .resizable()
              .scaledToFit()
              .frame(width: 40.0, height: 20.0)
              .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
          })
          .frame(width: 60.0, height: 60.0)
          .accentColor(isPlaylistOpen ? Color(UIColor.darkGray) : .black)
        Spacer()
      }.frame(minHeight: 40)
      Spacer().frame(minHeight: 20)
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

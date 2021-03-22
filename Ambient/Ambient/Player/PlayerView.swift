//
//  PlayerView.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 19/03/2021.
//

import SwiftUI

struct PlayerView: View {
  
  @ObservedObject var playerViewModel: PlayerViewModel
  var isPlaylistOpen: Bool
  var onOpenPlaylist: () -> ()
  var onClosePlaylist: () -> ()
  
  var body: some View {
    VStack {
      isPlaylistOpen ? Spacer().frame(maxHeight: 20) : Spacer().frame(minHeight: 20)
      PlayerButtonsView(isPlaylistOpen: isPlaylistOpen,
                        onOpenPlaylist: onOpenPlaylist,
                        onClosePlaylist: onClosePlaylist)
        .environmentObject(playerViewModel)
        .frame(minHeight: 40)
      Spacer().frame(minHeight: 20)
    }
  }
}

//
//  AmbientPlayerView.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 06/04/2021.
//

import SwiftUI

struct AmbientPlayerView: View {
  
  private static let playerDefaultHeight: CGFloat = 0.2
  private static let playerExtendedHeight: CGFloat = 0.6
  private static let playerDefaultOpacity: Double = 0.1
  private static let playerExtendedOpacity: Double = 0.3
  
  @ObservedObject var playerViewModel: PlayerViewModel

  @State private var isPlaylistOpen = false
  @State private var playerViewHeight = AmbientPlayerView.playerDefaultHeight
  @State private var playerBackgroundOpacity = AmbientPlayerView.playerDefaultOpacity
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        Spacer()
        PlayerButtonsView(
          isPlaylistOpen: isPlaylistOpen,
          onOpenPlaylist: {
            isPlaylistOpen = true
            withAnimation(.easeInOut) {
              playerBackgroundOpacity = AmbientPlayerView.playerExtendedOpacity
              
            }
            withAnimation(.interpolatingSpring(stiffness: 100,
                                               damping: 15,
                                               initialVelocity: 10)) {
              playerViewHeight = AmbientPlayerView.playerExtendedHeight
            }
          },
          onClosePlaylist: {
            isPlaylistOpen = false
            
            withAnimation(.easeInOut) {
              playerBackgroundOpacity = AmbientPlayerView.playerDefaultOpacity
            }
            withAnimation(.interpolatingSpring(stiffness: 100,
                                               damping: 15,
                                               initialVelocity: 10)) {
              playerViewHeight = AmbientPlayerView.playerDefaultHeight
            }
          })
          .background(
            Blur(style: .systemUltraThinMaterialLight)
              .background(Color.white.opacity(playerBackgroundOpacity))
          )
          .frame(maxHeight: geometry.size.height * playerViewHeight)
          .environmentObject(playerViewModel)
        }
      }
  }
}

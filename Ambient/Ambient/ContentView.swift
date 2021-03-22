//
//  ContentView.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 19/03/2021.
//

import SwiftUI

struct ContentView: View {
  
  var body: some View {
    ZStack {
      InlineAdvertisingView().frame(width: 320, height: 50)
      AmbientPlayerView()
    }
  }
}

struct AmbientPlayerView: View {
  
  static let playerDefaultHeight: CGFloat = 0.2
  static let playerExtendedHeight: CGFloat = 0.6
  static let playerDefaultOpacity: Double = 0.1
  static let playerExtendedOpacity: Double = 0.5
  
  @StateObject private var playerViewModel = PlayerViewModel()
  @State private var isPlaylistOpen = false
  @State private var playerViewHeight = AmbientPlayerView.playerDefaultHeight
  @State private var playerBackgroundOpacity = AmbientPlayerView.playerDefaultOpacity
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        Spacer()
        PlayerView(
          playerViewModel: playerViewModel,
          isPlaylistOpen: isPlaylistOpen,
          onOpenPlaylist: {
            playerViewHeight = AmbientPlayerView.playerExtendedHeight
            playerBackgroundOpacity = AmbientPlayerView.playerExtendedOpacity
            isPlaylistOpen = true
          },
          onClosePlaylist: {
            playerViewHeight = AmbientPlayerView.playerDefaultHeight
            playerBackgroundOpacity = AmbientPlayerView.playerDefaultOpacity
            isPlaylistOpen = false
          })
          .background(
            Blur(style: .systemUltraThinMaterialLight)
              .background(Color.white.opacity(playerBackgroundOpacity))
          )
          .frame(maxHeight: geometry.size.height * playerViewHeight)
          .animation(.easeInOut)
        }
      }
  }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

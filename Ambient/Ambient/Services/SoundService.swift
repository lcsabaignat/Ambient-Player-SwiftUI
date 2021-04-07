//
//  PlayerService.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 07/04/2021.
//

import Foundation
import AVFoundation

class SoundService {
  
  private var player: AVAudioPlayer?
  
  var isPlaying: Bool {
    get {
      if let player = player {
        return player.isPlaying
      }
      return false
    }
  }
  
  var volume: Float = 0 {
    didSet {
      player?.volume = volume
    }
  }
  
  var filePath: URL? {
    didSet {
      if let filePath = filePath {
        player = try? AVAudioPlayer(contentsOf: filePath, fileTypeHint: AVFileType.mp3.rawValue)
        player?.volume = volume
        player?.numberOfLoops = 0
      } else {
        player?.stop()
        player = nil
      }
    }
  }
  
  init() {
    try? AVAudioSession.sharedInstance().setCategory(.playback,
                                                     mode: .default,
                                                     options: [.mixWithOthers, .allowAirPlay])
    try? AVAudioSession.sharedInstance().setActive(true)
  }
  
  func play() {
    player?.play()
  }
  
  func pause() {
    player?.pause()
  }
}

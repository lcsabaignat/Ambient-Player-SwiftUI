//
//  PlayerViewModel.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 19/03/2021.
//

import Foundation

class PlayerViewModel: ObservableObject {
  
  @Published private(set) var volume = VolumeLevel.mid {
    didSet {
      soundService.volume = volume.rawValue
    }
  }
  @Published private(set) var isPlaying = true {
    didSet {
      updateSoundServicePlayStatus(to: isPlaying)
    }
  }
  
  private let soundService = SoundService()
  
  private let soundItems = [
    SoundItem(title: "Gentle Storm",
              filePath: URL(fileURLWithPath: Bundle.main.path(forResource: "Storm_Rain_Gentle_25", ofType: "mp3")!),
              colorScheme: nil)
  ]
  
  init() {
    if let soundItem = soundItems.first {
      soundService.filePath = soundItem.filePath
      soundService.volume = volume.rawValue
      updateSoundServicePlayStatus(to: isPlaying)
    }
  }
  
  func changeVolumeLevel() {
    
    switch volume {
    case .none:
      volume = .low
    case .low:
      volume = .mid
    case .mid:
      volume = .high
    default:
      volume = .none
    }
  }
  
  func changePlayStatus() {
    
    isPlaying = !isPlaying
  }
}

// MARK: - SoundService Helpers
extension PlayerViewModel {
  
  private func updateSoundServicePlayStatus(to isPlaying: Bool) {
    if isPlaying {
      soundService.play()
    } else {
      soundService.pause()
    }
  }
}

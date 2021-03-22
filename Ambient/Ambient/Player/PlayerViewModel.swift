//
//  PlayerViewModel.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 19/03/2021.
//

import Foundation

enum VolumeLevel {
  case none, low, mid, high
}

class PlayerViewModel: ObservableObject {
  
  @Published private(set) var volume: VolumeLevel = .none
  @Published private(set) var isPlaying = false
  
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

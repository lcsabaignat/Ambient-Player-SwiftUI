//
//  SoundItem.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 07/04/2021.
//

import Foundation

struct SoundItem {
  
  var title: String
  var filePath: URL
  var colorScheme: [String]?
  
  init(title: String, filePath: URL, colorScheme: [String]?) {
    
    self.title = title
    self.filePath = filePath
    self.colorScheme = colorScheme
  }
}

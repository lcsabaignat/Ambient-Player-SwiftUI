//
//  MotionService.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 06/04/2021.
//

import Foundation
import CoreMotion

class MotionService {
  
  private let motion = CMMotionManager()
  private var timer: Timer!
  
  private var prevX: Double?
  private var prevY: Double?
  private var prevZ: Double?
  
  private var motionChangeCallback: (_ x: Double, _ y: Double, _ z: Double) -> ()
  
  init(motionChangeCallback: @escaping (_ x: Double, _ y: Double, _ z: Double) -> ()) {
    
    self.motionChangeCallback = motionChangeCallback
    startGyros()
  }
  
  deinit {
    
    stopGyros()
  }
  
  func startGyros() {
    
    if motion.isGyroAvailable {
      self.motion.gyroUpdateInterval = 1.0 / 30.0
      self.motion.startGyroUpdates()
      
      self.timer = Timer(fire: Date(),
                         interval: (1.0 / 30.0),
                         repeats: true,
                         block: { [weak self] (timer) in
                          
        guard let self = self else {
          return
        }
        
        if let data = self.motion.gyroData {
          let x = Double(round(10 * data.rotationRate.x) / 10)
          let y = Double(round(10 * data.rotationRate.y) / 10)
          let z = Double(round(10 * data.rotationRate.z) / 10)
          
          if self.prevX != x || self.prevY != y || self.prevZ != z {
            self.motionChangeCallback(x, y, z)
            self.prevX = x
            self.prevY = y
            self.prevZ = z
          }
        }
      })
      
      RunLoop.current.add(self.timer, forMode: .default)
    }
  }
  
  func stopGyros() {
    
    self.timer?.invalidate()
    self.timer = nil
    self.motion.stopGyroUpdates()
  }
}

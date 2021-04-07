//
//  MotionGradient.swift
//  Ambient
//
//  Created by Lorand Csaba Ignat on 06/04/2021.
//

import SwiftUI

struct MotionGradient: View {

  private var gradient: Gradient
  
  private let animationDuration = 1.0
  private let xMovementSensitivity = 0.5
  private let zMovementSensitivity = 0.75
  
  private let startPointXMin: CGFloat = -0.25
  private let startPointXMax: CGFloat = 1.25
  private let endPointXMin: CGFloat = -0.25
  private let endPointXMax: CGFloat = 1.25
  
  private let startPointYMin: CGFloat = -0.33
  private let startPointYMax: CGFloat = 0.33
  private let endPointYMin: CGFloat = 0.66
  private let endPointYMax: CGFloat = 1.33
  
  @State private var startPoint = UnitPoint.top
  @State private var endPoint = UnitPoint.bottom
  
  @State private var motionService: MotionService?
  
  init(gradient: Gradient) {
    
    self.gradient = gradient
  }
  
  var body: some View {
    LinearGradient(gradient: gradient,
                   startPoint: startPoint,
                   endPoint: endPoint)
      .onAppear {
        motionService = MotionService { (x, y, z) in
          withAnimation(.easeInOut(duration: animationDuration)) {
            
            startPoint.x = startPoint.x + CGFloat(z * zMovementSensitivity / 10)
            if startPoint.x < startPointXMin {
              startPoint.x = startPointXMin
            } else if startPoint.x > startPointXMax {
              startPoint.x = startPointXMax
            }
            
            endPoint.x = endPoint.x - CGFloat(z * zMovementSensitivity / 10)
            if endPoint.x < endPointXMin {
              endPoint.x = endPointXMin
            } else if endPoint.x > endPointXMax {
              endPoint.x = endPointXMax
            }
            
            startPoint.y = startPoint.y + CGFloat(x * xMovementSensitivity / 10)
            if startPoint.y < startPointYMin {
              startPoint.y = CGFloat(startPointYMin)
            } else if startPoint.y > startPointYMax {
              startPoint.y = CGFloat(startPointYMax)
            }
            
            endPoint.y = endPoint.y + CGFloat(x * xMovementSensitivity / 10)
            if endPoint.y < endPointYMin {
              endPoint.y = CGFloat(endPointYMin)
            } else if endPoint.y > endPointYMax {
              endPoint.y = CGFloat(endPointYMax)
            }
          }
        }
      }
      .onDisappear {
        motionService = nil
      }
  }
}

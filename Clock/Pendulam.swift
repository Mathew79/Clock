//
//  Pendulam.swift
//  Clock
//
//  Created by Johnson Mathew on 6/7/21.
//  Copyright © 2021 western union. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class Pendulam: UIView {
    
    var sector = 69
          var i = 1
    
    struct ColorPath {
          var path: UIBezierPath
          var color: UIColor
      }
      
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard  let context = UIGraphicsGetCurrentContext() else {
            return
        }
  
        if (sector == 110) {
            i = -1
        } else if (sector == 70) {
            i = 1
        }
        
        sector += i
        
        let center = CGPoint(x: self.bounds.width / 2, y:-100)
        let pendulamHeight = CGFloat(250.00)
        
     
             context.setFillColor(UIColor.clear.cgColor)
            let deg1 = CGFloat( CGFloat(sector) * .pi / 180)
                   let px = pendulamHeight * cos(deg1) + center.x
                   let py = pendulamHeight * sin(deg1) + center.y
                   
                 
                   context.setFillColor(UIColor.clear.cgColor)
                   context.setLineWidth(25)
                   context.move(to: center)
                   context.setStrokeColor(UIColor.black.cgColor)
                   context.addLine(to: CGPoint(x:px , y: py))
                   context.strokePath()

                   
                   let circlePoint = CGPoint(x: px , y: py)
                   context.move(to: circlePoint)
                  
                   var colorPath = ColorPath(path: UIBezierPath(), color: .clear)
                   colorPath.path = UIBezierPath(arcCenter: circlePoint, radius: 20,
                                                 startAngle: 0,
                                                 endAngle: 360,
                                                 clockwise: true)
                   context.addPath(colorPath.path.cgPath)
                   context.setStrokeColor(UIColor.black.cgColor)
                   context.strokePath()
        
        
       
        
        
    }
}


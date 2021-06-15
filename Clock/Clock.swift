//
//  Clock.swift
//  Clock
//
//  Created by Johnson Mathew on 5/28/21.
//  Copyright © 2021 western union. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class Clock: UIView {
    
    struct ColorPath {
        var path: UIBezierPath
        var color: UIColor
    }
    
    var paths = [ColorPath]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0)
        
    }
    
    func deg2rad(_ number: CGFloat) -> CGFloat {
        return (number * .pi / 180)
    }
    
    func time2deg(_ time: CGFloat) -> CGFloat {
        if (time >= 0 && time <= 90){
            return 270 + time;
        }else if (time >= 91 && time <= 360){
            return (time - 90)
        }
            else{
                 return time
            }
    }

    
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        //      let context = UIGraphicsGetCurrentContext()
        //      let radius = CGFloat(bounds.size.height / 2.1)
        //      let angle: CGFloat = 2.0 * .pi / 360
        //      var colorPath = ColorPath(path: UIBezierPath(), color: .clear)
        //
        //      center = CGPoint(x: bounds.width / 2.0,
        //                       y: bounds.height / 2.0)
        //
        //      for sector in 0..<360 {
        //
        //        let sector = CGFloat(sector)
        //
        //        colorPath.path = UIBezierPath(arcCenter: center, radius: radius,
        //                                      startAngle: sector * angle,
        //                                      endAngle: (sector + 1.0) * angle,
        //                                      clockwise: true)
        //
        //        colorPath.path.addLine(to: center)
        //        colorPath.path.close()
        //
        //        let color = UIColor(hue: sector / 360,
        //                            saturation: 1, brightness: 1, alpha: 1)
        //        color.setFill()
        //        color.setStroke()
        //
        //        colorPath.path.fill()
        //        context?.addPath(colorPath.path.cgPath)
        //        context?.strokePath()
        //        colorPath.color = color
        //
        //        paths.append(colorPath)
        //      }
        let date = Date()
        let calendar = Calendar.current

        
        var hour = calendar.component(.hour, from: date)

        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        if (hour > 12 ){
            hour = hour - 12
        }
        
        
        let center = CGPoint(x: self.bounds.width / 2, y: self.bounds.height/2)
        
        print(center)
        print(self.bounds)
        
        guard  let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.setFillColor(UIColor.clear.cgColor)
        
        context.setLineWidth(5.0)
        
        let hourtomin = CGFloat(hour * 5) + (CGFloat(minutes) / 60.0) * 5
        let deg2 = time2deg( CGFloat(hourtomin    * 6))
    
        let hx2 = (70 * cos(deg2rad(CGFloat(deg2)))) + center.x
        let hy2 = (70 * sin(deg2rad(CGFloat(deg2)))) + center.y
        context.move(to: center)
        context.setStrokeColor(UIColor.black.cgColor)
        context.addLine(to: CGPoint(x:CGFloat(hx2) , y: hy2))
        context.move(to: center)
        context.strokePath()
        
        context.setLineWidth(5.0)
        let deg1 = time2deg(CGFloat(minutes  * 6))
        let hx1 = (100 * cos(deg2rad(CGFloat(deg1)))) + center.x
        let hy1 = (100 * sin(deg2rad(CGFloat(deg1)))) + center.y
        context.move(to: center)
        context.setStrokeColor(UIColor.black.cgColor)
        context.addLine(to: CGPoint(x:CGFloat(hx1) , y: hy1))
        context.move(to: center)
        context.strokePath()
        
        
        
        context.setLineWidth(1.0)
        let deg = time2deg( CGFloat(seconds * 6))
        let hx = (120 * cos(deg2rad(CGFloat(deg)))) + center.x
        let hy = (120 * sin(deg2rad(CGFloat(deg)))) + center.y
        context.move(to: center)
        context.setStrokeColor(UIColor.red.cgColor)
        context.addLine(to: CGPoint(x:CGFloat(hx) , y: hy))
        context.strokePath()
        
        context.setLineWidth(4.0)
        let deg3 = time2deg( CGFloat(seconds * 6))
        let hx3 = (25 * cos(deg2rad(CGFloat(deg3 + 180)))) + center.x
        let hy3 = (25 * sin(deg2rad(CGFloat(deg3 + 180)))) + center.y
        context.move(to: center)
        context.setStrokeColor(UIColor.red.cgColor)
        context.addLine(to: CGPoint(x:CGFloat(hx3) , y: hy3))
        context.strokePath()
        
        
        context.move(to: center)
        var colorPath = ColorPath(path: UIBezierPath(), color: .clear)
        colorPath.path = UIBezierPath(arcCenter: center, radius: 4,
                                              startAngle: 0,
                                              endAngle: 360,
                                              clockwise: true)
        context.addPath(colorPath.path.cgPath)
        context.setStrokeColor(UIColor.black.cgColor)
        context.strokePath()
        
        
        context.closePath()
        
    }
    
    
    
}

//
//  ViewController.swift
//  Clock
//
//  Created by Johnson Mathew on 5/28/21.
//  Copyright © 2021 western union. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var face: Clock!
    
@IBOutlet weak var pendulam: Pendulam!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let timer = Timer(timeInterval: 1, repeats: true) {
               _ in
            self.face.setNeedsDisplay()
               }
        
        let pendulam = Timer(timeInterval: 0.02, repeats: true) {
                  _ in
               self.pendulam.setNeedsDisplay()
                  }
        
          RunLoop.current.add(timer, forMode: .common)
         RunLoop.current.add(pendulam, forMode: .common)
         
        
//        let center = face.center
//        print(center)
//        let aPath = UIBezierPath()
//        aPath.move(to: CGPoint(x:center.x, y:center.y))
//        aPath.addLine(to: CGPoint(x:center.x + 200, y:center.y + 100))
//        aPath.close()
//        UIColor.red.set()
//        aPath.lineWidth = 20
        
    }

    override func viewDidLayoutSubviews() {
      //  face.setNeedsDisplay()
    }
    
    
}


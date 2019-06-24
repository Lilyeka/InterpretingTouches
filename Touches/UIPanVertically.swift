//
//  UIPanVertically.swift
//  Touches
//
//  Created by Лилия Левина on 24/06/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

class UIPanVertically: UIPanGestureRecognizer {
    var origLoc: CGPoint?
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        self.origLoc = touches.first!.location(in: self.view!.superview)
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        if self.state == .possible {
            let loc = touches.first!.location(in: self.view!.superview)
            let deltaX = abs(loc.x - self.origLoc!.x)
            let deltaY = abs(loc.y - self.origLoc!.y)
            if deltaX >= deltaY {
                self.state = .failed
            }
        }
        super.touchesMoved(touches, with: event)
    }
    
    override func translation(in view: UIView?) -> CGPoint {
        var proposedTranslation = super.translation(in: view)
        proposedTranslation.x = 0
        return proposedTranslation
    }
}

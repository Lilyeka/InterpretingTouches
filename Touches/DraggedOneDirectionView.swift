//
//  DraggedOneDirectionView.swift
//  Touches
//
//  Created by Лилия Левина on 18/06/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class DraggedOneDirectionView: UIView {
    var decided: Bool = false
    var horiz: Bool = true
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.decided = false
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let t = touches.first!
        if !self.decided {
            self.decided = true
            let then = t.previousLocation(in: self)
            let now = t.location(in: self)
            let deltaX = abs(then.x - now.x)
            let deltaY = abs(then.y - now.y)
            self.horiz = deltaX >= deltaY
        }
        let loc = t.location(in: self.superview)
        let oldP = t.previousLocation(in: self.superview)
        let deltaX = loc.x - oldP.x
        let deltaY = loc.y - oldP.y
        var c = self.center
        if self.horiz {
            c.x += deltaX
        } else {
            c.y += deltaY
        }
        self.center = c
    }
}

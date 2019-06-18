//
//  TouchView.swift
//  Touches
//
//  Created by Лилия Левина on 18/06/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class DraggedView: UIView {
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let t = touches.first!
        let loc = t.location(in: self.superview)
        let oldP = t.previousLocation(in: self.superview)
        let deltaX = loc.x - oldP.x
        let deltaY = loc.y - oldP.y
        var c = self.center
        c.x += deltaX
        c.y += deltaY
        self.center = c
    }
}

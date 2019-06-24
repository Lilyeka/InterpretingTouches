//
//  ViewController.swift
//  Touches
//
//  Created by Лилия Левина on 18/06/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var time: TimeInterval?
    var single: Bool?
    
    var myDraggleView: DraggedView = {
        let v = DraggedView()
        v.frame = CGRect(x: 50, y: 50, width: 150, height: 150)
        v.backgroundColor = UIColor.red
        let label = UILabel()
        label.frame = v.bounds
        label.numberOfLines = 0
        label.text = "Custom view, dragged any direction"
        label.textColor = UIColor.white
        v.addSubview(label)
        return v
    }()
    
    var myDraggleOneDirectionView: DraggedOneDirectionView = {
       let v = DraggedOneDirectionView()
        v.frame = CGRect(x: 50, y: 250, width: 150, height: 150)
        v.backgroundColor = UIColor.blue
        let label = UILabel()
        label.frame = v.bounds
        label.numberOfLines = 0
        label.text = "Custom view, dragged only horizontally/vertically"
        label.textColor = UIColor.white
        v.addSubview(label)
        return v
    }()
    
    var myView: UIView = {
        let v = UIView()
        v.frame = CGRect(x: 50, y: 450, width: 150, height: 150)
        v.backgroundColor = UIColor.yellow
        let label = UILabel()
        label.frame = v.bounds
        label.numberOfLines = 0
        label.text = "UIView, dragged any directions"
        label.textColor = UIColor.black
        v.addSubview(label)
        return v
    }()
    
    var myOneDirectionView: UIView = {
        let v = UIView()
        v.frame = CGRect(x: 50, y: 650, width: 150, height: 150)
        v.backgroundColor = UIColor.green
        let label = UILabel()
        label.frame = v.bounds
        label.numberOfLines = 0
        label.text = "UIView, dragged only horizontally/vertically with custum gesture recognizers"
        label.textColor = UIColor.black
        v.addSubview(label)
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initObjects()
    }
    
    func initObjects() {
        view.addSubview(myDraggleView)
        view.addSubview(myDraggleOneDirectionView)
        view.addSubview(myView)
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(dragging))
        view.addSubview(myOneDirectionView)
        myView.addGestureRecognizer(gesture)
        let horizontalGesture = UIPanHorizontally(target: self, action: #selector(dragging))
        let verticalGesture = UIPanVertically(target: self, action: #selector(dragging))
        myOneDirectionView.addGestureRecognizer(horizontalGesture)
        myOneDirectionView.addGestureRecognizer(verticalGesture)
    }
   
    @objc func dragging(sender:UIPanGestureRecognizer) {
        let v = sender.view!
        switch sender.state {
        case .began, .changed:
            let delta = sender.translation(in: v.superview)
            var c = v.center
            c.x += delta.x; c.y += delta.y
            v.center = c
            sender.setTranslation(.zero, in: v.superview)
        default:
            break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.time = touches.first!.timestamp
        let ct = touches.first!.tapCount
        switch ct {
        case 2:
            self.single = false
        default:
            break
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let diff = event!.timestamp - self.time!
        if (diff < 0.4) {
            print("short")
        } else {
            print("long")
        }
        
        let ct = touches.first!.tapCount
        switch ct {
        case 1:
            self.single = true
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                if self.single! { // no second tap intervened
                    print("single tap")
                }
            })
        case 2:
           print("double tap")
        default:
            break
        }
    }
}


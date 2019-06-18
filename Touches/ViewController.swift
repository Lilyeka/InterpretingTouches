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
        return v
    }()
    
    var myDraggleOneDirectionView: DraggedOneDirectionView = {
       let v = DraggedOneDirectionView()
        v.frame = CGRect(x: 50, y: 250, width: 150, height: 150)
        v.backgroundColor = UIColor.blue
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myDraggleView)
        view.addSubview(myDraggleOneDirectionView)
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


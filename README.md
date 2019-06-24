# InterpretingTouches example and UIGestureRecognizer subclassing example

On the UIViewController's view I've add 4 objects:

DraggedView class object - the view can be dragged any direction


DraggedOneDirectionView class object - the view can be dragged only vertically or horizontally



UIView class object - the view can be dragged any direction (uses UIGestureRecognizer object) 


UIView class object - the view can be dragged only vertically or horizontally (uses 2 UIGestureRecognizer subclasses objects) 


UIViewController itself implements UIResponder methods for detect if touch is long or short and if it is double touch or single touch.


![A](https://github.com/Lilyeka/Emmiter/blob/master/Emitter/result.png "")


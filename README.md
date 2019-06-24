# InterpretingTouches example and UIGestureRecognizer subclassing example

On the UIViewController view I've add 4 objects:

DraggedView class object - the view can be dragged any direction


DraggedOneDirectionView class object - the view can be dragged only vertically or horizontally



UIView class object - the view can be dragged any direction (uses UIGEstureRecognizer object) 


UIView class object - the view can be dragged only vertically or horizontally (uses 2 UIGEstureRecognizer subclasses objects) 


UIViewController itself implements UIResponder methods for detect if touch is long or short and if it is double touch or single touch.


import UIKit

//MARK: - Constants
let height: UInt32 = 100 // View's height // ie. view.frame.height
let width: UInt32 = 100 // View's width // ie. view.frame.width


// MARK: - Example
let path = createBezierPath()


// MARK: - Create Random Bezier Path
func createBezierPath() -> UIBezierPath {
    // Create a path
    let path = UIBezierPath()
    
    // Starting point
    path.moveToPoint(offScreenCGPoint())
    
    // Curves
    let curves = Int(arc4random_uniform(4))
    for _ in 0...curves {
        path.addQuadCurveToPoint(randomCGPoint(), controlPoint: randomCGPoint())
    }
    
    // Ending point
    path.addQuadCurveToPoint(offScreenCGPoint(), controlPoint: offScreenCGPoint())
    
    return path
}


// MARK: - Random Points
func randomCGPoint() -> CGPoint {
    let xPoint = CGFloat(arc4random_uniform(width))
    let yPoint = CGFloat(arc4random_uniform(height))
    
    let point = CGPoint(x: xPoint, y: yPoint)
    return point
}

func offScreenCGPoint() -> CGPoint {
    var xPoint = CGFloat(arc4random_uniform(width))
    var yPoint = CGFloat(arc4random_uniform(height))
    
    let w = CGFloat(width / 2)
    if xPoint >= w {
        xPoint += w
    }
    else {
        xPoint -= w
    }
    
    let h = CGFloat(height / 2)
    if yPoint >= h {
        yPoint += h
    }
    else {
        yPoint -= h
    }
    
    let point = CGPoint(x: xPoint, y: yPoint)
    return point
}

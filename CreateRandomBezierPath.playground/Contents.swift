
import UIKit

// MARK: - Constants
let height: CGFloat = 100.0 // View's height // ie. view.frame.height
let width: CGFloat = 100.0 // View's width // ie. view.frame.width

// MARK: - Random Bezier Path
func randomBezierPath() -> UIBezierPath {
    // Create a path
    let path = UIBezierPath()
    
    // Starting point
    path.move(to: offScreenPoint())
    
    // Random curves
    let numberOfCurves = Int.random(in: 0..<4)
    for _ in 0...numberOfCurves {
        path.addQuadCurve(to: randomPoint(), controlPoint: randomPoint())
    }
    
    // Ending point
    path.addQuadCurve(to: offScreenPoint(), controlPoint: offScreenPoint())
    
    return path
}

// MARK: - Random Point Helpers
func randomPoint() -> CGPoint {
    let xPoint = CGFloat.random(in: 0.0..<width)
    let yPoint = CGFloat.random(in: 0.0..<height)
    return CGPoint(x: xPoint, y: yPoint)
}

func offScreenPoint() -> CGPoint {
    var xPoint = CGFloat.random(in: 0.0..<width)
    var yPoint = CGFloat.random(in: 0.0..<height)
    
    let midWidth: CGFloat = width / 2.0
    xPoint = xPoint >= midWidth
        ? xPoint + midWidth
        : xPoint - midWidth

    
    let midHeight: CGFloat = height / 2.0
    yPoint = yPoint >= midHeight
        ? yPoint + midHeight
        : yPoint - midHeight
    
    return CGPoint(x: xPoint, y: yPoint)
}

// MARK: - Run example
let path = randomBezierPath()

//
//  Glyph.swift
//  uikit
//
//  Created by Vladislav Muravyev on 05.12.2023.
//

import UIKit
import SVGPath

class GlyphVC: UIViewController {
    @IBOutlet weak var mainLogoView: UIView!
    @IBOutlet weak var lbl: UILabel!
    var label: String = "";
    //    override func awakeFromNib() {
//        super.awakeFromNib()
//        print("awakeFromNib")
//        // Initialization code
//        addGlyph()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view.
        if (label == "1"){
            addGlyph()
            addCanvas()
        }
        else
        {
        addGlyph()
        }
        lbl.text = label;
    }

    
    func addCanvas(){
        let subview = CanvasView(frame:CGRect(x: 0, y: 0, width: 320, height: 320))
        subview.backgroundColor = .yellow
//        mainLogoView.removeFromSuperview()
        mainLogoView.addSubview(subview)
        subview.layer.opacity = 0.5
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: mainLogoView.topAnchor, constant: 0),
            subview.leadingAnchor.constraint(equalTo: mainLogoView.leadingAnchor, constant: 0),
            subview.trailingAnchor.constraint(equalTo: mainLogoView.trailingAnchor, constant: 0),
            subview.bottomAnchor.constraint(equalTo: mainLogoView.bottomAnchor, constant: 0)
        ])
        subview.translatesAutoresizingMaskIntoConstraints = false
        mainLogoView.isUserInteractionEnabled = true
        subview.isUserInteractionEnabled = true
        // Call setNeedsLayout and layoutIfNeeded to update the view
        mainLogoView.setNeedsLayout()
        mainLogoView.layoutIfNeeded()
    }
    func addGlyph(){
//        let url = Bundle.main.l(forResource: "au", withExtension: "svg")!
//        do {
            let shapeLayer = CAShapeLayer()
            mainLogoView.layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.transform = CATransform3DMakeScale(CGFloat(mainLogoView.frame.width/170), CGFloat(mainLogoView.frame.height/170), 1)

            let starPath = UIBezierPath()
            starPath.move(to: CGPoint(x: 81.5, y: 7.0))
            starPath.addLine(to: CGPoint(x: 101.07, y: 63.86))
            starPath.addLine(to: CGPoint(x: 163.0, y: 64.29))
            starPath.addLine(to: CGPoint(x: 113.16, y: 99.87))
            starPath.addLine(to: CGPoint(x: 131.87, y: 157.0))
            starPath.addLine(to: CGPoint(x: 81.5, y: 122.13))
            starPath.addLine(to: CGPoint(x: 31.13, y: 157.0))
            starPath.addLine(to: CGPoint(x: 49.84, y: 99.87))
            starPath.addLine(to: CGPoint(x: 0.0, y: 64.29))
            starPath.addLine(to: CGPoint(x: 61.93, y: 63.86))
            starPath.addLine(to: CGPoint(x: 81.5, y: 7.0))

//            let rectanglePath = UIBezierPath()
//            rectanglePath.move(to: CGPoint(x: 81.5, y: 7.0))
//            rectanglePath.addLine(to: CGPoint(x: 163.0, y: 7.0))
//            rectanglePath.addLine(to: CGPoint(x: 163.0, y: 82.0))
//            rectanglePath.addLine(to: CGPoint(x: 163.0, y: 157.0))
//            rectanglePath.addLine(to: CGPoint(x: 163.0, y: 157.0))
//            rectanglePath.addLine(to: CGPoint(x: 82.0, y: 157.0))
//            rectanglePath.addLine(to: CGPoint(x: 0.0, y: 157.0))
//            rectanglePath.addLine(to: CGPoint(x: 0.0, y: 157.0))
//            rectanglePath.addLine(to: CGPoint(x: 0.0, y: 82.0))
//            rectanglePath.addLine(to: CGPoint(x: 0.0, y: 7.0))
//            rectanglePath.addLine(to: CGPoint(x: 81.5, y: 7.0))
        let rectanglePath = UIBezierPath()
    rectanglePath.move(to: CGPoint(x: 244.5, y: 81.3))
    rectanglePath.addLine(to: CGPoint(x: 243.3, y: 81.3))
    rectanglePath.addLine(to: CGPoint(x: 160.2, y: 0.9))
    rectanglePath.addLine(to: CGPoint(x: 138.9, y: 13.8))
    rectanglePath.addCurve(to: CGPoint(x: 224.7, y: 81.3), controlPoint1: CGPoint(x: 172.8, y: 42.9), controlPoint2: CGPoint(x: 201.3, y: 64.5))
    rectanglePath.addLine(to: CGPoint(x: 120.3, y: 81.3))
    rectanglePath.addLine(to: CGPoint(x: 120.3, y: 100.5))
    rectanglePath.addLine(to: CGPoint(x: 152.4, y: 100.5))
    rectanglePath.addLine(to: CGPoint(x: 152.4, y: 174.3))
    rectanglePath.addCurve(to: CGPoint(x: 126.6, y: 180.6), controlPoint1: CGPoint(x: 147, y: 177.6), controlPoint2: CGPoint(x: 138.6, y: 180.6))
    rectanglePath.addCurve(to: CGPoint(x: 98.1, y: 173.1), controlPoint1: CGPoint(x: 114.6, y: 180.6), controlPoint2: CGPoint(x: 105.3, y: 177.3))
    rectanglePath.addCurve(to: CGPoint(x: 80.4, y: 163.5), controlPoint1: CGPoint(x: 92.7, y: 168.3), controlPoint2: CGPoint(x: 86.4, y: 165))
    rectanglePath.addLine(to: CGPoint(x: 80.4, y: 162.3))
    rectanglePath.addCurve(to: CGPoint(x: 101.7, y: 125.7), controlPoint1: CGPoint(x: 90, y: 157.5), controlPoint2: CGPoint(x: 101.7, y: 144.3))
    rectanglePath.addCurve(to: CGPoint(x: 53.4, y: 81), controlPoint1: CGPoint(x: 101.7, y: 100.8), controlPoint2: CGPoint(x: 83.7, y: 81))
    rectanglePath.addCurve(to: CGPoint(x: 10.8, y: 100.2), controlPoint1: CGPoint(x: 33.6, y: 81), controlPoint2: CGPoint(x: 18.9, y: 89.7))
    rectanglePath.addLine(to: CGPoint(x: 26.7, y: 114.6))
    rectanglePath.addCurve(to: CGPoint(x: 52.8, y: 101.4), controlPoint1: CGPoint(x: 31.8, y: 107.4), controlPoint2: CGPoint(x: 39.9, y: 101.4))
    rectanglePath.addCurve(to: CGPoint(x: 78.9, y: 127.2), controlPoint1: CGPoint(x: 69, y: 101.4), controlPoint2: CGPoint(x: 78.9, y: 111.6))
    rectanglePath.addCurve(to: CGPoint(x: 47.7, y: 156.3), controlPoint1: CGPoint(x: 78.9, y: 145.2), controlPoint2: CGPoint(x: 66.3, y: 156.3))
    rectanglePath.addLine(to: CGPoint(x: 38.4, y: 156.3))
    rectanglePath.addLine(to: CGPoint(x: 38.4, y: 176.4))
    rectanglePath.addLine(to: CGPoint(x: 54.6, y: 176.4))
    rectanglePath.addCurve(to: CGPoint(x: 87.6, y: 203.1), controlPoint1: CGPoint(x: 75.9, y: 176.4), controlPoint2: CGPoint(x: 87.6, y: 186.3))
    rectanglePath.addCurve(to: CGPoint(x: 54, y: 233.7), controlPoint1: CGPoint(x: 87.6, y: 219.9), controlPoint2: CGPoint(x: 76.5, y: 233.7))
    rectanglePath.addCurve(to: CGPoint(x: 15.6, y: 215.4), controlPoint1: CGPoint(x: 35.4, y: 233.7), controlPoint2: CGPoint(x: 22.8, y: 223.8))
    rectanglePath.addLine(to: CGPoint(x: 0, y: 231))
    rectanglePath.addCurve(to: CGPoint(x: 54, y: 253.8), controlPoint1: CGPoint(x: 9.6, y: 240.9), controlPoint2: CGPoint(x: 27.9, y: 253.8))
    rectanglePath.addCurve(to: CGPoint(x: 110.4, y: 202.8), controlPoint1: CGPoint(x: 88.8, y: 253.8), controlPoint2: CGPoint(x: 110.4, y: 231.3))
    rectanglePath.addCurve(to: CGPoint(x: 109.8, y: 195.3), controlPoint1: CGPoint(x: 110.4, y: 200.1), controlPoint2: CGPoint(x: 110.1, y: 197.7))
    rectanglePath.addCurve(to: CGPoint(x: 132.3, y: 200.1), controlPoint1: CGPoint(x: 116.1, y: 198.3), controlPoint2: CGPoint(x: 123.6, y: 200.1))
    rectanglePath.addCurve(to: CGPoint(x: 152.4, y: 195.9), controlPoint1: CGPoint(x: 141, y: 200.1), controlPoint2: CGPoint(x: 147.6, y: 198))
    rectanglePath.addLine(to: CGPoint(x: 152.4, y: 273.9))
    rectanglePath.addLine(to: CGPoint(x: 175.2, y: 273.9))
    rectanglePath.addLine(to: CGPoint(x: 175.2, y: 100.5))
    rectanglePath.addLine(to: CGPoint(x: 234.3, y: 100.5))
    rectanglePath.addLine(to: CGPoint(x: 234.3, y: 273.9))
    rectanglePath.addLine(to: CGPoint(x: 256.8, y: 273.9))
    rectanglePath.addCurve(to: CGPoint(x: 256.8, y: 209.93), controlPoint1: CGPoint(x: 256.8, y: 267.73), controlPoint2: CGPoint(x: 256.8, y: 246.4))
    rectanglePath.addCurve(to: CGPoint(x: 256.8, y: 100.5), controlPoint1: CGPoint(x: 256.8, y: 173.45), controlPoint2: CGPoint(x: 256.8, y: 136.98))
    rectanglePath.addLine(to: CGPoint(x: 293.1, y: 100.5))
    rectanglePath.addLine(to: CGPoint(x: 293.1, y: 81.3))
    rectanglePath.addLine(to: CGPoint(x: 258, y: 81.3))
    rectanglePath.addLine(to: CGPoint(x: 228.3, y: 0))
    rectanglePath.addLine(to: CGPoint(x: 203.1, y: 6))
    rectanglePath.addLine(to: CGPoint(x: 244.5, y: 81.3))
    rectanglePath.close()
    rectanglePath.apply(CGAffineTransform(scaleX: 0.5, y: 0.5))
            // Set an initial path
            shapeLayer.path = starPath.cgPath

            let pathAnimation = CABasicAnimation(keyPath: "path")
            pathAnimation.toValue = rectanglePath.cgPath
            pathAnimation.duration = 0.75
            pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            pathAnimation.autoreverses = true
            pathAnimation.repeatCount = .greatestFiniteMagnitude

        let anim1 = CABasicAnimation(keyPath: "strokeEnd")
         anim1.fromValue         = 0.0
        anim1.fromValue = rectanglePath.cgPath
         anim1.toValue           = 1.0
         anim1.duration          = 4.0
         anim1.repeatCount       = 0
         anim1.autoreverses      = false
        anim1.isRemovedOnCompletion = false
        anim1.isAdditive = true
        anim1.fillMode = CAMediaTimingFillMode.forwards
//        shapeLayer.add(anim1, forKey: "pathAnimation")
        
            shapeLayer.add(pathAnimation, forKey: "pathAnimation")
//            if #available(iOS 13.0, *) {
//                // Call a function that can throw an error
//                         let svgPath = try SVGPath(string: "M244.5,81.3 L243.3,81.3 L160.2,0.9 L138.9,13.8 C172.8,42.9 201.3,64.5 224.7,81.3 L120.3,81.3 L120.3,100.5 L152.4,100.5 L152.4,174.3 C147,177.6 138.6,180.6 126.6,180.6 C114.6,180.6 105.3,177.3 98.1,173.1 C92.7,168.3 86.4,165 80.4,163.5 L80.4,162.3 C90,157.5 101.7,144.3 101.7,125.7 C101.7,100.8 83.7,81 53.4,81 C33.6,81 18.9,89.7 10.8,100.2 L26.7,114.6 C31.8,107.4 39.9,101.4 52.8,101.4 C69,101.4 78.9,111.6 78.9,127.2 C78.9,145.2 66.3,156.3 47.7,156.3 L38.4,156.3 L38.4,176.4 L54.6,176.4 C75.9,176.4 87.6,186.3 87.6,203.1 C87.6,219.9 76.5,233.7 54,233.7 C35.4,233.7 22.8,223.8 15.6,215.4 L0,231 C9.6,240.9 27.9,253.8 54,253.8 C88.8,253.8 110.4,231.3 110.4,202.8 C110.4,200.1 110.1,197.7 109.8,195.3 C116.1,198.3 123.6,200.1 132.3,200.1 C141,200.1 147.6,198 152.4,195.9 L152.4,273.9 L175.2,273.9 L175.2,100.5 L234.3,100.5 L234.3,273.9 L256.8,273.9 C256.8,267.727344 256.8,246.403125 256.8,209.927344 C256.8,173.451562 256.8,136.975781 256.8,100.5 L293.1,100.5 L293.1,81.3 L258,81.3 L228.3,0 L203.1,6 L244.5,81.3 Z")
//                let cgPath = CGPath.from(svgPath: svgPath)
//                            var layer:CAShapeLayer = CAShapeLayer()
//                            layer.transform = CATransform3DMakeScale(CGFloat(mainLogoView.frame.width/320), CGFloat(mainLogoView.frame.height/320), 1)
//                            layer.path = cgPath
//                            layer.lineWidth = 4
//                layer.strokeColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
//                layer.fillColor = UIColor.white.cgColor
////                layer.transform = CATransform3DMakeScale(2, 2, 1)
//                mainLogoView.layer.addSublayer(layer)
//            } else {
//                // Fallback on earlier versions
//            }
//
//            // Code to execute if the function call succeeds
//        } catch {
//            // Handle the error here
//            print("An error occurred: \(error)")
//        }

//        let bz = UIBezierPath(svgPath:url)
//            var layer:CAShapeLayer = CAShapeLayer()
//            layer.transform = CATransform3DMakeScale(CGFloat(mainLogoView.frame.width/svgWidth), CGFloat(mainLogoView.frame.height/svgHeight), 1)
//            layer.path = path.cgPath
//            layer.lineWidth = 4
//            layer.strokeColor = orangeColor.cgColor
//            layer.fillColor = UIColor.white.cgColor
//            layer.transform = CATransform3DMakeScale(2, 2, 1)
//            mainLogoView.layer.addSublayer(layer)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

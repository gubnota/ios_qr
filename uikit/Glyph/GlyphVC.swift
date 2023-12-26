//
//  Glyph.swift
//  uikit
//
//  Created by Vladislav Muravyev on 05.12.2023.
//

import UIKit
//import SVGPath

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
        else if (label == "2"){
            addAlt()
            addCanvas()
        }
        else
        {
            addCanvas()
        }
        lbl.text = label;
    }

    
    func addCanvas(){
        return;
//        let subview = CanvasView(frame:CGRect(x: 0, y: 0, width: 320, height: 320))
//        subview.backgroundColor = .yellow
////        mainLogoView.removeFromSuperview()
//        mainLogoView.addSubview(subview)
//        subview.layer.opacity = 0.5
//        NSLayoutConstraint.activate([
//            subview.topAnchor.constraint(equalTo: mainLogoView.topAnchor, constant: 0),
//            subview.leadingAnchor.constraint(equalTo: mainLogoView.leadingAnchor, constant: 0),
//            subview.trailingAnchor.constraint(equalTo: mainLogoView.trailingAnchor, constant: 0),
//            subview.bottomAnchor.constraint(equalTo: mainLogoView.bottomAnchor, constant: 0)
//        ])
//        subview.translatesAutoresizingMaskIntoConstraints = false
//        mainLogoView.isUserInteractionEnabled = true
//        subview.isUserInteractionEnabled = true
//        // Call setNeedsLayout and layoutIfNeeded to update the view
//        mainLogoView.setNeedsLayout()
//        mainLogoView.layoutIfNeeded()
    }
    func addGlyph(){
        return;
////        let url = Bundle.main.l(forResource: "au", withExtension: "svg")!
////        do {
//            let shapeLayer = CAShapeLayer()
//            mainLogoView.layer.addSublayer(shapeLayer)
//        shapeLayer.strokeColor = UIColor.red.cgColor//  CGColor(red: 1, green: 0, blue: 0, alpha: 1)
//        shapeLayer.fillColor = UIColor.white.cgColor
//        shapeLayer.transform = CATransform3DMakeScale(CGFloat(mainLogoView.frame.width/170), CGFloat(mainLogoView.frame.height/170), 1)
//
//        let starPath = Curves.get.getStar()
//
//
//        let rectanglePath = Curves.get.getAa()
//        
//            // Set an initial path
//            shapeLayer.path = starPath.cgPath
//
//            let pathAnimation = CABasicAnimation(keyPath: "path")
//            pathAnimation.toValue = rectanglePath.cgPath
//            pathAnimation.duration = 0.75
//            pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//            pathAnimation.autoreverses = true
//            pathAnimation.repeatCount = .greatestFiniteMagnitude
//
//        let anim1 = CABasicAnimation(keyPath: "strokeEnd")
//         anim1.fromValue         = 0.0
//        anim1.fromValue = rectanglePath.cgPath
//         anim1.toValue           = 1.0
//         anim1.duration          = 4.0
//         anim1.repeatCount       = 0
//         anim1.autoreverses      = false
//        anim1.isRemovedOnCompletion = false
//        anim1.isAdditive = true
//        anim1.fillMode = CAMediaTimingFillMode.forwards
////        shapeLayer.add(anim1, forKey: "pathAnimation")
//        
//            shapeLayer.add(pathAnimation, forKey: "pathAnimation")
////            if #available(iOS 13.0, *) {
////                // Call a function that can throw an error
////                         let svgPath = try SVGPath(string: "M244.5,81.3 L243.3,81.3 L160.2,0.9 L138.9,13.8 C172.8,42.9 201.3,64.5 224.7,81.3 L120.3,81.3 L120.3,100.5 L152.4,100.5 L152.4,174.3 C147,177.6 138.6,180.6 126.6,180.6 C114.6,180.6 105.3,177.3 98.1,173.1 C92.7,168.3 86.4,165 80.4,163.5 L80.4,162.3 C90,157.5 101.7,144.3 101.7,125.7 C101.7,100.8 83.7,81 53.4,81 C33.6,81 18.9,89.7 10.8,100.2 L26.7,114.6 C31.8,107.4 39.9,101.4 52.8,101.4 C69,101.4 78.9,111.6 78.9,127.2 C78.9,145.2 66.3,156.3 47.7,156.3 L38.4,156.3 L38.4,176.4 L54.6,176.4 C75.9,176.4 87.6,186.3 87.6,203.1 C87.6,219.9 76.5,233.7 54,233.7 C35.4,233.7 22.8,223.8 15.6,215.4 L0,231 C9.6,240.9 27.9,253.8 54,253.8 C88.8,253.8 110.4,231.3 110.4,202.8 C110.4,200.1 110.1,197.7 109.8,195.3 C116.1,198.3 123.6,200.1 132.3,200.1 C141,200.1 147.6,198 152.4,195.9 L152.4,273.9 L175.2,273.9 L175.2,100.5 L234.3,100.5 L234.3,273.9 L256.8,273.9 C256.8,267.727344 256.8,246.403125 256.8,209.927344 C256.8,173.451562 256.8,136.975781 256.8,100.5 L293.1,100.5 L293.1,81.3 L258,81.3 L228.3,0 L203.1,6 L244.5,81.3 Z")
////                let cgPath = CGPath.from(svgPath: svgPath)
////                            var layer:CAShapeLayer = CAShapeLayer()
////                            layer.transform = CATransform3DMakeScale(CGFloat(mainLogoView.frame.width/320), CGFloat(mainLogoView.frame.height/320), 1)
////                            layer.path = cgPath
////                            layer.lineWidth = 4
////                layer.strokeColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
////                layer.fillColor = UIColor.white.cgColor
//////                layer.transform = CATransform3DMakeScale(2, 2, 1)
////                mainLogoView.layer.addSublayer(layer)
////            } else {
////                // Fallback on earlier versions
////            }
////
////            // Code to execute if the function call succeeds
////        } catch {
////            // Handle the error here
////            print("An error occurred: \(error)")
////        }
//
////        let bz = UIBezierPath(svgPath:url)
////            var layer:CAShapeLayer = CAShapeLayer()
////            layer.transform = CATransform3DMakeScale(CGFloat(mainLogoView.frame.width/svgWidth), CGFloat(mainLogoView.frame.height/svgHeight), 1)
////            layer.path = path.cgPath
////            layer.lineWidth = 4
////            layer.strokeColor = orangeColor.cgColor
////            layer.fillColor = UIColor.white.cgColor
////            layer.transform = CATransform3DMakeScale(2, 2, 1)
////            mainLogoView.layer.addSublayer(layer)
    }
    func addAlt() -> Void {
        return;
//        let shapeLayer = CAShapeLayer()
//        mainLogoView.layer.addSublayer(shapeLayer)
//        let starPath = Curves.get.getAltAa()!
//        shapeLayer.path = starPath.cgPath
//        shapeLayer.strokeColor = UIColor.red.cgColor //CGColor(red: 1, green: 0, blue: 0, alpha: 1)
//    shapeLayer.fillColor = UIColor.white.cgColor
//    shapeLayer.transform = CATransform3DMakeScale(CGFloat(mainLogoView.frame.width/170), CGFloat(mainLogoView.frame.height/170), 1)
//
////        let shapeLayer = CAShapeLayer()
////        let path = Curves.get.getAltAa()
////        
////            // Set an initial path
////            shapeLayer.path = path!.cgPath
////        mainLogoView.layer.addSublayer(shapeLayer)
////    shapeLayer.strokeColor = CGColor(red: 1, green: 0, blue: 0, alpha: 1)
////    shapeLayer.fillColor = UIColor.white.cgColor
////    shapeLayer.transform = CATransform3DMakeScale(CGFloat(mainLogoView.frame.width/170), CGFloat(mainLogoView.frame.height/170), 1)
////        mainLogoView.setNeedsLayout()
////        mainLogoView.layoutIfNeeded()
//
////
////        let pathAnimation = CABasicAnimation(keyPath: "path")
////        pathAnimation.toValue = path!.cgPath
////        pathAnimation.duration = 0.75
////        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
////        pathAnimation.autoreverses = true
////        pathAnimation.repeatCount = .greatestFiniteMagnitude
////
////    let anim1 = CABasicAnimation(keyPath: "strokeEnd")
////     anim1.fromValue         = 0.0
////    anim1.fromValue = path!.cgPath
////     anim1.toValue           = 1.0
////     anim1.duration          = 4.0
////     anim1.repeatCount       = 0
////     anim1.autoreverses      = false
////    anim1.isRemovedOnCompletion = false
////    anim1.isAdditive = true
////    anim1.fillMode = CAMediaTimingFillMode.forwards
//////        shapeLayer.add(anim1, forKey: "pathAnimation")
////    
////        shapeLayer.add(pathAnimation, forKey: "pathAnimation");
//  
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

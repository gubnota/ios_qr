//
//  ViewController.swift
//  uikit
//
//  Created by Vladislav Muravyev on 04.12.2023.
//

import UIKit

class ViewController: UIViewController {
    var pm: ParticipantManager = ParticipantManager.shared;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.createNewView()
    }
    override func viewWillAppear(_ animated: Bool) {
        print("scanned \(pm.scannedCode)")
//        createNewView()
    }
    
    
    func createNewView() -> Void {
        self.view.subviews.first?.removeFromSuperview()
        let newV = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        newV.backgroundColor = UIColor(red: 0.2, green: 0.4, blue: 1, alpha: 0.2)
        newV.translatesAutoresizingMaskIntoConstraints = false
        newV.layer.cornerRadius = 20
        self.view.addSubview(newV)
        NSLayoutConstraint.activate([
            newV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor,constant: 20),
            newV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20),
            newV.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 20),
            newV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -20),
        ])
        newV.clipsToBounds = true
        addButton()
    }
    func addButton() -> Void {
        let newV = UIButton(frame: CGRect(x: 0, y: 0, width: 343, height: 164))
        
            if let bgImg = UIImage(named: "pockemon/abra", in: Bundle.main, compatibleWith: nil) {
                newV.setBackgroundImage(bgImg, for: .normal)
            
        }
        newV.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        newV.frame = CGRect(x: 0, y: 0, width:self.view.subviews.first?.frame.width ?? 200, height: self.view.subviews.first?.frame.width ?? 164);
        newV.frame = CGRect(x: 0, y: 0, width:380, height: 300);
        // NSLayoutConstraint.activate([
        // newV.leadingAnchor.constraint(equalTo: self.view.subviews.first!.leadingAnchor,constant: 20),
        // newV.trailingAnchor.constraint(equalTo: self.view.subviews.first!.trailingAnchor,constant: -20),
        // newV.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 20),
        // newV.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: -20),
        // ])
        let tV = UITextView(frame: CGRect(x: 0, y: 400, width: 380, height: 300))
        tV.frame = CGRect(x: 0, y: 400, width:380, height: 300);
        tV.text = "scanned \(pm.scannedCode)";
        self.view.subviews.first?.addSubview(tV)
        self.view.subviews.first?.addSubview(newV)
    }
    @objc func buttonTapped(){
        print("tapped")
        let destCtrlr = Qr_VC(nibName: "Qr_VC", bundle: nil)
        self.navigationController?.pushViewController(destCtrlr, animated: true)
    }
    


}


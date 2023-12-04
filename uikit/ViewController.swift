//
//  ViewController.swift
//  uikit
//
//  Created by Vladislav Muravyev on 04.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.createNewView()
    }
    
    func createNewView() -> Void {
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
    }


}


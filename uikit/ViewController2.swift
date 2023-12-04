//
//  ViewController2.swift
//  uikit
//
//  Created by Vladislav Muravyev on 04.12.2023.
//

import UIKit

class ViewController2: UIViewController {

//    init(){
//        super.init(nibName: "View2", bundle: nil)
//    }
//    
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
////        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load the view from the xib file
        if let view = Bundle.main.loadNibNamed("View2", owner: self, options: nil)?.first as? UIView {
            self.view = view
        }
        // Do any additional setup after loading the view.
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

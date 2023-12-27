//
//  Portrait_VC.swift
//  gopicar
//
//  Created by Vladislav Muravyev on 27.12.2023.
//

import UIKit

class Portrait_VC: UIViewController {
    var pm: ParticipantManager = ParticipantManager.shared;

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

    
    @IBOutlet weak var ava: UIImageView!
    @IBOutlet weak var bg: UIView!
    @IBOutlet weak var qr: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = pm.participant?.fullname;
        let image = generateQRCode(from: "\(pm.participant?.fullname ?? ""):\(pm.participant?.id ?? "")")
        qr.image = image
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

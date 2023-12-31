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
        let data = string.data(using: String.Encoding.utf8)

        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y: 3)

            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }

        return nil
    }

    @IBOutlet weak var bg: UIView!
    @IBOutlet weak var ava: UIImageView!
    @IBOutlet weak var no: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var qr: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = pm.participant?.fullname;
        let image = generateQRCode(from: "\(pm.participant?.fullname ?? ""):\(pm.participant?.id ?? "")")
        qr.image = image
        ava.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        ava.layer.borderWidth = 1.0
        ava.layer.cornerRadius = 32
        bg.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        bg.layer.cornerRadius = 10.0
        bg.layer.borderWidth = 10.0
        if(pm.participant?.number != nil && pm.participant!.number > 0 ) {
//            NotificationBanner.show("Пользователь был зарегистрирован!")
            pm.showToast(message: "Пользователь был зарегистрирован!")
            no.text = "\(pm.participant!.number)"
            ava.image = pm.getAvatar(i: pm.participant!.number)
        }
        else {
            no.text = ""
//            NotificationBanner.show("Пользователь был зарегистрирован!")
//            pm.showToast(message: "Пользователь успешно зарегистрирован!")
        }
        // Do any additional setup after loading the view.
        pm.play()
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

//
//  ParticipantCell.swift
//  gopicar
//
//  Created by Vladislav Muravyev on 27.12.2023.
//

import UIKit

class ParticipantCell: UITableViewCell {
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var no: UILabel!
    @IBOutlet weak var name: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    static func nib() -> UINib {
        return UINib(nibName: "ParticipantCell", bundle: nil)
    }
}


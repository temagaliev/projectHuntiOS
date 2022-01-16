//
//  JoinButtonCell.swift
//  projectHunt
//
//  Created by Артем Галиев on 21.12.2021.
//

import UIKit

class JoinButtonCell: UITableViewCell {

    @IBOutlet weak var joinButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        joinButton.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func joinButtonAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("join"), object: nil)

    }
}

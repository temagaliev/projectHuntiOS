//
//  UserJoinCell.swift
//  projectHunt
//
//  Created by Артем Галиев on 11.01.2022.
//

import UIKit

class UserJoinCell: UITableViewCell {

    @IBOutlet weak var joinButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        joinButton.isHidden = true
        joinButton.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

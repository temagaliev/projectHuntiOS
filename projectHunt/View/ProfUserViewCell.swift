//
//  ProfUserViewCell.swift
//  projectHunt
//
//  Created by Артем Галиев on 11.01.2022.
//

import UIKit

class ProfUserViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var telegramLabel: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var cornorView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cornorView.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

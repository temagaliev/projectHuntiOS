//
//  AboutMeCell.swift
//  projectHunt
//
//  Created by Артем Галиев on 11.01.2022.
//

import UIKit

class AboutMeCell: UITableViewCell {

    @IBOutlet weak var cornorLabel: UIView!
    @IBOutlet weak var aboutMeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cornorLabel.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

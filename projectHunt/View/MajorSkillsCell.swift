//
//  MajorSkillsCell.swift
//  projectHunt
//
//  Created by Артем Галиев on 11.01.2022.
//

import UIKit

class MajorSkillsCell: UITableViewCell {

    @IBOutlet weak var cornorView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var majorSkillLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cornorView.layer.cornerRadius = 15
        blueView.layer.cornerRadius = 5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

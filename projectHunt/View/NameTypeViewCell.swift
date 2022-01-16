//
//  NameTypeViewCell.swift
//  projectHunt
//
//  Created by Артем Галиев on 06.01.2022.
//

import UIKit

class NameTypeViewCell: UITableViewCell {

    @IBOutlet weak var typeCornorView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var nameProject: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        typeCornorView.layer.cornerRadius = 5
        typeCornorView.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        typeCornorView.layer.borderWidth = 0.5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

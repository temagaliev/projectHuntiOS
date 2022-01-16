//
//  SeclectEventCell.swift
//  projectHunt
//
//  Created by Артем Галиев on 11.01.2022.
//

import UIKit

class SeclectEventCell: UITableViewCell {
    @IBOutlet weak var but: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        but.layer.cornerRadius = 10
        let ck = {(action: UIAction) in
            NotificationCenter.default.post(name: Notification.Name("ck"), object: nil)
        }
        let ck2 = {(action: UIAction) in
            NotificationCenter.default.post(name: Notification.Name("ck2"), object: nil)
        }
        but.menu = UIMenu(children: [
            UIAction(title: "Проектный практикум", handler: ck),
            UIAction(title: "Моделирование", handler: ck2)

        ])
        but.showsMenuAsPrimaryAction = true
        but.changesSelectionAsPrimaryAction = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}



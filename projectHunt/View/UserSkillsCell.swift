//
//  UserSkillsCell.swift
//  projectHunt
//
//  Created by Артем Галиев on 11.01.2022.
//

import UIKit

class UserSkillsCell: UITableViewCell {
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var fourView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var cornorLabel: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

        firstView.layer.cornerRadius = 5
        secondView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        fourView.layer.cornerRadius = 5
        cornorLabel.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refreshTablePeople(model: [String]) {
        switch model.count {
        case 0:
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = true
            fourView.isHidden = true
        case 1:
            firstView.isHidden = false
            secondView.isHidden = true
            thirdView.isHidden = true
            fourView.isHidden = true
            firstLabel.text = model[0]
        case 2:
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = true
            fourView.isHidden = true
            firstLabel.text = model[0]
            secondLabel.text = model[1]
        case 3:
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = false
            fourView.isHidden = true
            firstLabel.text = model[0]
            secondLabel.text = model[1]
            thirdLabel.text = model[2]
        case 4:
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = false
            fourView.isHidden = false
            firstLabel.text = model[0]
            secondLabel.text = model[1]
            thirdLabel.text = model[2]
            fourLabel.text = model[3]
        default:
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = true
            fourView.isHidden = true
        }

    }

}

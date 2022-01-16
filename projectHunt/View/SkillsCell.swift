//
//  SkillsCell.swift
//  projectHunt
//
//  Created by Артем Галиев on 21.12.2021.
//

import UIKit

class SkillsCell: UITableViewCell {

    @IBOutlet weak var sFourLabel: UILabel!
    @IBOutlet weak var sThirdLabel: UILabel!
    @IBOutlet weak var sSecondLabel: UILabel!
    @IBOutlet weak var viewSkills: UIView!
    @IBOutlet weak var sFirstLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewSkills.layer.cornerRadius = 15
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func refreshSkills(model: ProjectsModel) {
        var textSkills = ""
//        if model.firstSkillsPerson != "" {
//            textSkills = textSkills + "\(model.firstSkillsPerson); "
//        }
//        if model.secondSkillsPerson != "" {
//            textSkills = textSkills + "\(model.secondSkillsPerson); "
//        }
//        if model.thirdSkillsPerson != "" {
//            textSkills = textSkills + "\(model.thirdSkillsPerson); "
//        }
//        if model.fourSkillsPerson != "" {
//            textSkills = textSkills + "\(model.fourSkillsPerson); "
//        }
        
        textSkills = "Ищем в проект: \(textSkills)"
        sFirstLabel.text = textSkills
    }
}

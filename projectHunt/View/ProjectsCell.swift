//
//  projectsCell.swift
//  projectHunt
//
//  Created by Артем Галиев on 20.12.2021.
//

import UIKit

class ProjectsCell: UITableViewCell {

    @IBOutlet weak var dateProject: UILabel!
    @IBOutlet weak var nameProject: UILabel!
    @IBOutlet weak var cornerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
            cornerView.layer.cornerRadius = 20
            cornerView.layer.masksToBounds = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Заполнение ячеек
    func refreshTable(model: EventModel) {
        nameProject.text = model.eventName
        dateProject.text = model.eventDate
    }
    
    func refreshPeople(model: PeopleModel) {
        nameProject.text = model.name + " " + model.secondName
        var text = ""
        for nameSkills in model.skills {
            text = text + "\(nameSkills); "
        }
        dateProject.text = "Мои навыки: \(text)"
    }
    


}

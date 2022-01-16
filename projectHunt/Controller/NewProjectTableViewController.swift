//
//  NewProjectTableViewController.swift
//  projectHunt
//
//  Created by Артем Галиев on 21.12.2021.
//

import UIKit

class NewProjectTableViewController: UITableViewController {

    @IBOutlet weak var nameProjectTextField: UITextField!
    @IBOutlet weak var skillsFirstPersonTextField: UITextField!
    @IBOutlet weak var skillsSecondPersonTextField: UITextField!
    @IBOutlet weak var skillsThirdPersonTextField: UITextField!
    @IBOutlet weak var skillsFourPersonTextField: UITextField!
    @IBOutlet weak var contactTextField: UITextField!
    @IBOutlet weak var discTextView: UITextView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        discTextView.layer.cornerRadius = 5
        discTextView.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        discTextView.layer.borderWidth = 0.5
        skillsFirstPersonTextField.layer.cornerRadius = 5
        skillsFirstPersonTextField.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        skillsFirstPersonTextField.layer.borderWidth = 0.5
        skillsSecondPersonTextField.layer.cornerRadius = 5
        skillsSecondPersonTextField.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        skillsSecondPersonTextField.layer.borderWidth = 0.5
        skillsThirdPersonTextField.layer.cornerRadius = 5
        skillsThirdPersonTextField.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        skillsThirdPersonTextField.layer.borderWidth = 0.5
        skillsFourPersonTextField.layer.cornerRadius = 5
        skillsFourPersonTextField.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        skillsFourPersonTextField.layer.borderWidth = 0.5
        nameProjectTextField.layer.cornerRadius = 5
        nameProjectTextField.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        nameProjectTextField.layer.borderWidth = 0.5
        contactTextField.layer.cornerRadius = 5
        contactTextField.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        contactTextField.layer.borderWidth = 0.5


    }


    func anCorrectBorder(_ textField: UITextField) {
        if textField.text == Optional("") {
            textField.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        } else {
            textField.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        }
    }

    @IBAction func clouseActionButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    @IBAction func createProjectAction(_ sender: UIBarButtonItem) {
        if nameProjectTextField.text != Optional("") && discTextView.text != Optional("") && contactTextField.text != Optional("") && discTextView.text != Optional("Описание проекта...") {
            var arraySkills: [String] = []
            if skillsFirstPersonTextField.text != Optional("") {
                arraySkills.append(skillsFirstPersonTextField.text ?? "")
            }
            if skillsSecondPersonTextField.text != Optional("") {
                arraySkills.append(skillsSecondPersonTextField.text ?? "")
            }
            if skillsThirdPersonTextField.text != Optional("") {
                arraySkills.append(skillsThirdPersonTextField.text ?? "")
            }
            if skillsFourPersonTextField.text != Optional("") {
                arraySkills.append(skillsFourPersonTextField.text ?? "")
            }
            let item = ProjectsModel(idProject: ProjectViewController.projectsArray.count + 1, projectName: nameProjectTextField.text ?? "", projectDisc: discTextView.text ?? "", skills: arraySkills, projectContact: contactTextField.text ?? "", peopleInProject: [])
            
            ProjectViewController.projectsArray.append(item)
            NotificationCenter.default.post(name: Notification.Name(NotificationKey.newItem.rawValue), object: nil)
            dismiss(animated: true)
            
        } else {
            anCorrectBorder(nameProjectTextField)
            anCorrectBorder(contactTextField)
            if discTextView.text == Optional("") || discTextView.text == Optional("Описание проекта...") {
                discTextView.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            } else {
                discTextView.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
            }
        }
    }
    

}

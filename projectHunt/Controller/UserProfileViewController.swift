//
//  UserProfileViewController.swift
//  projectHunt
//
//  Created by Артем Галиев on 22.12.2021.
//

import UIKit

class UserProfileViewController: UIViewController {
    var isCk = true
    @IBOutlet weak var userTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        userTable.dataSource = self
        userTable.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(ck), name: NSNotification.Name("ck"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ck2), name: NSNotification.Name("ck2"), object: nil)
    }
    
    
    @objc private func ck() {
        isCk = true
        userTable.reloadData()
    }
    @objc private func ck2() {
        isCk = false
        userTable.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
}

extension UserProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0: return 160
        case 1: return 65
        case 2: return 90
        case 3: return 55
        case 4: return 55
        case 5: return 70
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 2: return "Обо мне"
        case 3: return "Ключевые навыки"
        case 4: return "Предпочительная роль"
        default:
            return ""
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        if isCk {
            return 6
        } else {
            return 2
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let nameTypeCell = tableView.dequeueReusableCell(withIdentifier: "profUserCell") as? ProfUserViewCell {
                nameTypeCell.userName.text = ProjectViewController.namePop + " " + ProjectViewController.secondNamePop
                nameTypeCell.telegramLabel.text = ProjectViewController.telegramPop
                nameTypeCell.numberLabel.text = ProjectViewController.numberPhonePop
                return nameTypeCell
            }
        case 1:
            if let eventCell = tableView.dequeueReusableCell(withIdentifier: "selectEventCell") as? SeclectEventCell {
                return eventCell
            }
        case 2:
            if let aboutMeCell = tableView.dequeueReusableCell(withIdentifier: "aboutMeCell", for: indexPath) as? AboutMeCell {
                aboutMeCell.aboutMeLabel.text =  ProjectViewController.abountMePop
                return aboutMeCell
            }
        case 3:
            if let allSkills = tableView.dequeueReusableCell(withIdentifier: "userSkillsCell") as? UserSkillsCell {
                if ProjectViewController.pastProjectsArray.count != 0 {
                    print("Proverockja")
                    print(ProjectViewController.skillsPop)
                    let item = ProjectViewController.skillsPop
                    allSkills.refreshTablePeople(model: item)
                    return allSkills
                } else {
                    return UITableViewCell()
                }
            }
        case 4:
            if let majorSkills = tableView.dequeueReusableCell(withIdentifier: "majorSkillsCell") as? MajorSkillsCell {
                majorSkills.majorSkillLabel.text = ProjectViewController.skillsPop[0]
                return majorSkills
            }
        case 5:
            if let joinCell = tableView.dequeueReusableCell(withIdentifier: "userJoinCell") as? UserJoinCell {

                return joinCell
            }
        default:
            print("dw")
        }

        return UITableViewCell()
        
    }
    
    
    
}

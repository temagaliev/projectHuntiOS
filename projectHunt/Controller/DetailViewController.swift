//
//  DetailViewController.swift
//  projectHunt
//
//  Created by Артем Галиев on 21.12.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var popButton: UIButton!
    @IBOutlet weak var endJoinButton: UIButton!
    @IBOutlet weak var joinView: UIView!
    
    var selectSkill = "iOS"
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.dataSource = self
        detailTableView.delegate = self
        joinView.isHidden = true
        joinView.layer.cornerRadius = 15
        NotificationCenter.default.addObserver(self, selector: #selector(noti), name: NSNotification.Name("join"), object: nil)
        // Do any additional setup after loading the view.
        popButton.layer.cornerRadius = 10
        endJoinButton.layer.cornerRadius = 10
        let ck = {(action: UIAction) in
            self.selectSkill = "iOS"
        }
        let ck2 = {(action: UIAction) in
            self.selectSkill = "Дизайн"
        }
        let ck3 = {(action: UIAction) in
            self.selectSkill = "Web"
        }
        let ck4 = {(action: UIAction) in
            self.selectSkill = "Back-end"
        }
        popButton.menu = UIMenu(children: [
            UIAction(title: "iOS", handler: ck),
            UIAction(title: "Дизайн", handler: ck2),
            UIAction(title: "Web", handler: ck3),
            UIAction(title: "Back-end", handler: ck4)

        ])
        popButton.showsMenuAsPrimaryAction = true
        popButton.changesSelectionAsPrimaryAction = true
    }
    @IBAction func endJoinAction(_ sender: Any) {
        detailTableView.isHidden = false
        joinView.isHidden = true
        ProjectViewController.peopleInProject.append(PeopleModel(idPeople: 3, name: "Артем", secondName: "Галиев", skills: [selectSkill], aboutMe: "Люблю верстать сайты", whatWantDo: "Фронтенд", telegram: "@artem", numberPhone: "+7999999999"))
        detailTableView.reloadData()
    }
    
    @objc private func noti() {
        detailTableView.isHidden = true
        joinView.isHidden = false

//        let alertVC = UIAlertController(title: "Запрос отправлен", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
//        alertVC.addAction(action)
//        self.present(alertVC, animated: true, completion: nil)
        
        detailTableView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1: return "Описание проекта:"
        case 2: return "Цель:"
        case 3: return "Итоговый продукт:"
        case 4: return "В проекте участвуют:"
        case 5: return "Дополнительная информация:"
        default:
            return ""
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 4 {
            return ProjectViewController.peopleInProject.count
        } else {
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let nameTypeCell = tableView.dequeueReusableCell(withIdentifier: "nameTypeCell") as? NameTypeViewCell {
                nameTypeCell.nameProject.text = ProjectViewController.projectNamePop
                nameTypeCell.typeLabel.text = "Web+Mob"
                return nameTypeCell
            }
        case 1:
            if let discCell = tableView.dequeueReusableCell(withIdentifier: "discInfoProject") as? DiscCell {
                discCell.discLabel.text = ProjectViewController.projectDiscPop
                return discCell
            }
        case 2:
            if let discCell = tableView.dequeueReusableCell(withIdentifier: "discInfoProject") as? DiscCell {
                discCell.discLabel.text = "Как составная часть программы, представляющая собой форму конкретизации и содержательного наполнения приоритетных направлений развития социокультурной жизнитерритории."
                return discCell
            }
        case 3:
            if let discCell = tableView.dequeueReusableCell(withIdentifier: "discInfoProject") as? DiscCell {
                discCell.discLabel.text = "Как самостоятельный вариант решения локальной проблемы, адресованный конкретной аудитории."
                return discCell
            }
        case 4:
            
            if let cellPeople = tableView.dequeueReusableCell(withIdentifier: "projectsCell", for: indexPath) as? ProjCell {
                    if ProjectViewController.pastProjectsArray.count != 0 {
                        let item = ProjectViewController.peopleInProject[indexPath.row]
                        cellPeople.refreshTablePeople(model: item)
                    } else {
                        return UITableViewCell()
                    }

                return cellPeople
            }
        case 5:
            if let contactCell = tableView.dequeueReusableCell(withIdentifier: "contactInfo") as? ContactInfoCell {
                contactCell.contactLabel.text = ProjectViewController.projectContactPop
                return contactCell
            }
        case 6:
            if let joinCell = tableView.dequeueReusableCell(withIdentifier: "joinTeam") as? JoinButtonCell {
                return joinCell
            }
        default:
            print("dw")
        }

        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 4:
            ProjectViewController.namePop = ProjectViewController.pastProjectsArray[indexPath.row].name
            ProjectViewController.secondNamePop = ProjectViewController.pastProjectsArray[indexPath.row].secondName
            ProjectViewController.skillsPop = ProjectViewController.pastProjectsArray[indexPath.row].skills
            ProjectViewController.idPeoplePop = ProjectViewController.pastProjectsArray[indexPath.row].idPeople
            ProjectViewController.abountMePop = ProjectViewController.pastProjectsArray[indexPath.row].aboutMe
            ProjectViewController.whatWantDoPop = ProjectViewController.pastProjectsArray[indexPath.row].whatWantDo
            ProjectViewController.telegramPop = ProjectViewController.pastProjectsArray[indexPath.row].telegram
            ProjectViewController.numberPhonePop = ProjectViewController.pastProjectsArray[indexPath.row].numberPhone
            let pushViewController = storyboard?.instantiateViewController(withIdentifier: "UserProfile")
            navigationController?.pushViewController(pushViewController!, animated: true)
        default: print("error")
        }
    }
    

}

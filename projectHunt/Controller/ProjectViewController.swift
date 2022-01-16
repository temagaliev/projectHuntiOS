//
//  ProjectViewController.swift
//  projectHunt
//
//  Created by Артем Галиев on 22.12.2021.
//

import UIKit

class ProjectViewController: UIViewController {
    


    static var projectsArray: [ProjectsModel] = [ProjectsModel(idProject: 0, projectName: "Сервис по поиску проектов Project Hunt", projectDisc: "Проект - это ограниченное во времени предприятие (мероприятие), направленное на создание уникальных продуктов и услуг или получение принципиально новых результатов.Проект может существовать в двух формах.", skills: ["Дизайн", "Project Manager"],  projectContact: "Контакты для связи: +79999999999", peopleInProject: pastProjectsArray)]
    static var pastProjectsArray: [PeopleModel] = [PeopleModel(idPeople: 0, name: "Гасан", secondName: "Гасанов", skills: ["web", "js", "VSCode"], aboutMe: "Разрабатывал cайты, имею опыт в дизайне", whatWantDo: "Fornt-end",telegram: "@gas",numberPhone: "+7(909)000-01-01"), PeopleModel(idPeople: 1, name: "Александр", secondName: "Шоркин", skills: ["Дизайн", "Project Manager"], aboutMe: "Разрабатывал мобильные приложения под iOS, имею опыт в разработке сайтов", whatWantDo: "Дизайн",telegram: "@alexsh",numberPhone: "+7(909)000-00-00")]
    var buttonStateFromCell: ButtonState = .currentButton

    static var projectNamePop: String = ""
    static var idProjectPop: Int = 0
    static var projectDiscPop: String = ""
    static var skillsProjectPop: [String] = []
    static var projectContactPop: String = ""
    static var peopleInProject: [PeopleModel] = []

    static var idPeoplePop: Int = 0
    static var namePop: String = ""
    static var secondNamePop: String = ""
    static var skillsPop: [String] = []
    static var abountMePop: String = ""
    static var whatWantDoPop: String = ""
    static var telegramPop: String = ""
    static var numberPhonePop: String = ""

    private let buttonsCell: String = "buttonsCell"
    private let projectsCell: String = "projectsCell"

    @IBOutlet weak var noEventView: UIStackView!
    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        
        //addSub romoveSuper
        super.viewDidLoad()
        createObserver()
        
        self.settingsImageNoEvent()
    
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        NotificationCenter.default.post(name: Notification.Name(NotificationKey.updateCell.rawValue), object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        mainTableView.reloadData()
        NotificationCenter.default.post(name: Notification.Name(NotificationKey.updateCell.rawValue), object: nil)
    }
    
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(clickCurrentButtonFromCell), name: NSNotification.Name(NotificationKey.clickCurrent.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(clickPastButtonFromCell), name: NSNotification.Name(NotificationKey.clickPast.rawValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTable), name: NSNotification.Name(NotificationKey.newItem.rawValue), object: nil)
    }
    
    
    @objc private func updateTable() {
        mainTableView.reloadData()
        settingsImageNoEvent()
    }
    
    @objc private func clickCurrentButtonFromCell() {
        print(ButtonsCell.buttonState)
        buttonStateFromCell = .currentButton
        settingsImageNoEvent()
        mainTableView.reloadData()
    }
    @objc private func clickPastButtonFromCell() {
        print(ButtonsCell.buttonState)
        buttonStateFromCell = .pastButton
        settingsImageNoEvent()
        mainTableView.reloadData()
    }
    
    func settingsImageNoEvent() {
        switch buttonStateFromCell {
        case .currentButton:
            if ProjectViewController.projectsArray.count != 0 {
                noEventView.isHidden = true
            } else {
                noEventView.isHidden = false
            }
        case .pastButton:
            if ProjectViewController.pastProjectsArray.count != 0 {
                noEventView.isHidden = true
            } else {
                noEventView.isHidden = false
            }
        }
    }
}



extension ProjectViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch buttonStateFromCell {
        case .currentButton:
            if indexPath.section == 0  {
                return 60.0
            } else {
                return 150.0
            }
        case .pastButton:
            if indexPath.section == 0  {
                return 60.0
            } else {
                return 120.0
            }
        
        }

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch buttonStateFromCell {
        case .currentButton:
            switch section {
                case 0: return 1
            case 1: return ProjectViewController.projectsArray.count
            default: return 0
            }
        case .pastButton:
            switch section {
                case 0: return 1
            case 1: return ProjectViewController.pastProjectsArray.count
            default: return 0
            }
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0  {
            if let cellSeg = tableView.dequeueReusableCell(withIdentifier: buttonsCell) as? ButtonsCell {
                switch buttonStateFromCell {
                case .currentButton:
                    cellSeg.currentButton.titleLabel?.textColor = .white
                    cellSeg.pastButton.titleLabel?.textColor = .black
                case .pastButton:
                    cellSeg.currentButton.titleLabel?.textColor = .black
                    cellSeg.pastButton.titleLabel?.textColor = .white
                    
                }
                return cellSeg
            }
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: projectsCell, for: indexPath) as? ProjCell {
            switch buttonStateFromCell {
            case .currentButton:
                switch indexPath.section {
                case 0: break
                case 1:
                    
                    let item = ProjectViewController.projectsArray[indexPath.row]
                    print(item)
                    cell.refreshTable(model: item)
                default: print("error")
                }
                return cell
            case .pastButton:
                switch indexPath.section {
                case 0: break
                case 1:
                    if ProjectViewController.pastProjectsArray.count != 0 {
                        let item = ProjectViewController.pastProjectsArray[indexPath.row]
                        cell.refreshTablePeople(model: item)
                    } else {
                        return UITableViewCell()
                    }

                default: print("error")
                }
                return cell
            }

        }
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch buttonStateFromCell {
        case .currentButton:
            switch indexPath.section {
            case 1:
                ProjectViewController.projectNamePop = ProjectViewController.projectsArray[indexPath.row].projectName
                ProjectViewController.skillsProjectPop = ProjectViewController.projectsArray[indexPath.row].skills
                ProjectViewController.projectDiscPop = ProjectViewController.projectsArray[indexPath.row].projectDisc
                ProjectViewController.projectContactPop = ProjectViewController.projectsArray[indexPath.row].projectContact
                ProjectViewController.idProjectPop = ProjectViewController.projectsArray[indexPath.row].idProject
                ProjectViewController.peopleInProject = ProjectViewController.projectsArray[indexPath.row].peopleInProject
                print("Get info - \(ProjectViewController.skillsProjectPop)")
            default: print("error")
            }
        case .pastButton:
            switch indexPath.section {
            case 1:
                ProjectViewController.namePop = ProjectViewController.pastProjectsArray[indexPath.row].name
                ProjectViewController.secondNamePop = ProjectViewController.pastProjectsArray[indexPath.row].secondName
                ProjectViewController.skillsPop = ProjectViewController.pastProjectsArray[indexPath.row].skills
                ProjectViewController.idPeoplePop = ProjectViewController.pastProjectsArray[indexPath.row].idPeople
                ProjectViewController.abountMePop = ProjectViewController.pastProjectsArray[indexPath.row].aboutMe
                ProjectViewController.whatWantDoPop = ProjectViewController.pastProjectsArray[indexPath.row].whatWantDo
                ProjectViewController.telegramPop = ProjectViewController.pastProjectsArray[indexPath.row].telegram
                ProjectViewController.numberPhonePop = ProjectViewController.pastProjectsArray[indexPath.row].numberPhone
                

            default: print("error")
            }
        }
        if indexPath.section == 0 { } else {
            switch buttonStateFromCell {
            case .currentButton:
                let pushViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController")
                navigationController?.pushViewController(pushViewController!, animated: true)
            case .pastButton:
                let pushViewController = storyboard?.instantiateViewController(withIdentifier: "UserProfile")
                navigationController?.pushViewController(pushViewController!, animated: true)
            }

        }
        
    }

}

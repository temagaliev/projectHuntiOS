//
//  ViewController.swift
//  projectHunt
//
//  Created by Артем Галиев on 20.12.2021.
//

import UIKit

class MainViewController: UIViewController {
    

    static var projectsArray: [EventModel] = [EventModel(eventName: "Проектный практикум 4 курс", eventDate: "Заканчивается - 25.01.2022", eventId: 1)]
    static var pastProjectsArray: [EventModel] = []
    var buttonStateFromCell: ButtonState = .currentButton

    static var eventNamePop: String = ""
    static var eventDatePop: String = ""
    static var eventIdPop: Int = 0
    
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
            if MainViewController.projectsArray.count != 0 {
                noEventView.isHidden = true
            } else {
                noEventView.isHidden = false
            }
        case .pastButton:
            if MainViewController.pastProjectsArray.count != 0 {
                noEventView.isHidden = true
            } else {
                noEventView.isHidden = false
            }
        }
    }
}



extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0  {
            return 60.0
        } else {
            return 110.0
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
            case 1: return MainViewController.projectsArray.count
            default: return 0
            }
        case .pastButton:
            switch section {
                case 0: return 1
            case 1: return MainViewController.pastProjectsArray.count
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
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: projectsCell, for: indexPath) as? ProjectsCell {
            switch buttonStateFromCell {
            case .currentButton:
                switch indexPath.section {
                case 0: break
                case 1:
                    let item = MainViewController.projectsArray[indexPath.row]
                    cell.refreshTable(model: item)
                default: print("error")
                }
                return cell
            case .pastButton:
                switch indexPath.section {
                case 0: break
                case 1:
                    if MainViewController.pastProjectsArray.count != 0 {
                        let item = MainViewController.pastProjectsArray[indexPath.row]
                        cell.refreshTable(model: item)
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
                MainViewController.eventNamePop = MainViewController.projectsArray[indexPath.row].eventName
                MainViewController.eventDatePop = MainViewController.projectsArray[indexPath.row].eventDate
                MainViewController.eventIdPop = MainViewController.projectsArray[indexPath.row].eventId
            default: print("error")
            }
        case .pastButton:
            switch indexPath.section {
            case 1:
                MainViewController.eventNamePop = MainViewController.pastProjectsArray[indexPath.row].eventName
                MainViewController.eventDatePop = MainViewController.pastProjectsArray[indexPath.row].eventDate
                MainViewController.eventIdPop = MainViewController.pastProjectsArray[indexPath.row].eventId
            default: print("error")
            }
        }
        if indexPath.section == 0 { } else {
            let pushViewController = storyboard?.instantiateViewController(withIdentifier: "ProjectVC")
            navigationController?.pushViewController(pushViewController!, animated: true)
        }
        
    }

}

//
//  ProfileViewController.swift
//  projectHunt
//
//  Created by Артем Галиев on 21.12.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var numberPhoneTextField: UITextField!
    @IBOutlet weak var telegaTextField: UITextField!
    @IBOutlet weak var workNameTextField: UITextField!
    @IBOutlet weak var skillsTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var aboutMeTextView: UITextView!
    @IBOutlet weak var redactView: UIView!
    @IBOutlet weak var redactButton: UIButton!
    @IBOutlet weak var nameWorkLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var telegaLabel: UILabel!
    @IBOutlet weak var nameUser: UILabel!
    @IBOutlet weak var imageUserProfile: UIImageView!
    
    var aboutMeInfo: String = "О себе: разрабатывал мобильные приложения под iOS, имею опыт в разработке сайтов. "
    var fioInfo: String = "Галиев Артем"
    var skillsInfo: String = "Навыки: iOS, Swift, Xcode, JS, VS Code, API."
    var workNameInfo: String = "Чем хочу заниматься в проекте: разрабатывать мобильное приложение."
    var telegramInfo: String = "@artemgaliev"
    var numberInfo: String = "+7(908)-003-05-02"
    
    var isRedact: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redactView.isHidden = true
        aboutMeTextView.layer.cornerRadius = 5
        aboutMeTextView.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        aboutMeTextView.layer.borderWidth = 0.5
        redactButton.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        redactView.isHidden = true
        redactButton.titleLabel?.text = "Редактировать,"
        redactButton.setTitle("Редактировать", for: .normal)
        navigationItem.title = "Профиль"
    }
    @IBAction func dissmisKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func reductButtonAction(_ sender: UIButton) {
        isRedact = !isRedact
        switch isRedact {
        case true:
            redactView.isHidden = false
            redactButton.titleLabel?.text = "Сохранить"
            redactButton.setTitle("Сохранить", for: .normal)
            aboutMeTextView.text = aboutMeInfo
            userNameTextField.text = fioInfo
            skillsTextField.text = skillsInfo
            workNameTextField.text = workNameInfo
            telegaTextField.text = telegramInfo
            numberPhoneTextField.text = numberInfo
            navigationItem.title = "Редакатирование"
        case false:
            aboutMeInfo = aboutMeTextView.text ?? ""
            fioInfo = userNameTextField.text ?? ""
            skillsInfo = skillsTextField.text ?? ""
            workNameInfo = workNameTextField.text ?? ""
            telegramInfo = telegaTextField.text ?? ""
            numberInfo = numberPhoneTextField.text ?? ""
            aboutMeLabel.text = aboutMeInfo
            nameUser.text = fioInfo
            skillsLabel.text = skillsInfo
            nameWorkLabel.text = workNameInfo
            telegaLabel.text = telegramInfo
            numberLabel.text = numberInfo
            redactView.isHidden = true
            redactButton.titleLabel?.text = "Редактировать"
            redactButton.setTitle("Редактировать", for: .normal)
            navigationItem.title = "Профиль"
        }
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

//
//  AutirizationViewController.swift
//  projectHunt
//
//  Created by Артем Галиев on 22.12.2021.
//

import UIKit

class AutirizationViewController: UIViewController {


    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var firstPasswordTextField: UITextField!
    @IBOutlet weak var secondPasswordTextField: UITextField!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    let correctEmail = "test@test.com"
    let correctPassword = "1234"
    
    var isRegMode = false
    var isLogIn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isLogIn == true {
            mainStackView.isHidden = true
            loginButton.isHidden = true
            secondButton.isHidden = true
            performSegue(withIdentifier: "id", sender: nil)
        }
        userNameTextField.isHidden = true
        secondNameTextField.isHidden = true
        secondPasswordTextField.isHidden = true
        
        emailTextField.layer.cornerRadius = 15
        loginButton.layer.cornerRadius = 15
        
        userNameTextField.layer.cornerRadius = 5
        userNameTextField.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        userNameTextField.layer.borderWidth = 0.7
        secondNameTextField.layer.cornerRadius = 5
        secondNameTextField.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        secondNameTextField.layer.borderWidth = 0.7
        secondPasswordTextField.layer.cornerRadius = 5
        secondPasswordTextField.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        secondPasswordTextField.layer.borderWidth = 0.7
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        emailTextField.layer.borderWidth = 0.7
        firstPasswordTextField.layer.cornerRadius = 5
        firstPasswordTextField.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        firstPasswordTextField.layer.borderWidth = 0.7


        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        
        if emailTextField.text == correctEmail && firstPasswordTextField.text == correctPassword {
            performSegue(withIdentifier: "id", sender: nil)
        } else {
            if emailTextField.text != correctEmail {
                emailTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            } else {
                emailTextField.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
            }
            if firstPasswordTextField.text != correctPassword {
                firstPasswordTextField.layer.borderColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            } else {
                firstPasswordTextField.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
            }
        }
    }
    @IBAction func secondButtonAction(_ sender: UIButton) {
        isRegMode = !isRegMode
        if isRegMode {
            textLabel.text = "Зарегистрируйтесь"
            userNameTextField.isHidden = false
            secondNameTextField.isHidden = false
            secondPasswordTextField.isHidden = false
            loginButton.setTitle("Создать аккаунт", for: .normal)
            secondButton.setTitle("Есть аккаунт", for: .normal)
        } else {
            textLabel.text = "Войдите в аккаунт"
            userNameTextField.isHidden = true
            secondNameTextField.isHidden = true
            secondPasswordTextField.isHidden = true
            loginButton.setTitle("Войти", for: .normal)
            secondButton.setTitle("Зарегистрироваться", for: .normal)
        }
    }
    @IBAction func dissmisKeyBoard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func emailAction(_ sender: UITextField) {
        sender.layer.cornerRadius = 5
        sender.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        sender.layer.borderWidth = 1
    }
    
    @IBAction func endWriteText(_ sender: UITextField) {
        sender.layer.cornerRadius = 5
        sender.layer.borderColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        sender.layer.borderWidth = 0.7
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

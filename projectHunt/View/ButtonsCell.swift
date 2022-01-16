//
//  Buttons.swift
//  projectHunt
//
//  Created by Артем Галиев on 20.12.2021.
//

import UIKit

class ButtonsCell: UITableViewCell {

    
    @IBOutlet weak var pastButton: UIButton!
    @IBOutlet weak var currentButton: UIButton!
    
    static var buttonState: ButtonState = .currentButton
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pastButton.layer.cornerRadius = 15
        currentButton.layer.cornerRadius = 15
        currentButton.titleLabel?.textColor = .white
        pastButton.titleLabel?.textColor = .black
        currentButton.setTitleColor(.white, for: .normal)
        pastButton.setTitleColor(.black, for: .normal)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCell), name: NSNotification.Name(NotificationKey.updateCell.rawValue), object: nil)
        
    }
    
//    override func prepareForReuse() {
//            super.prepareForReuse()
//        currentButton.titleLabel?.textColor = .red
//        pastButton.titleLabel?.textColor = .red
//            // Reset the state of cell's properties, e.g. selected state background color
//        }
    
    @objc private func updateCell() {
        print("Poche,u ne")
        print(ButtonsCell.buttonState)
        switch ButtonsCell.buttonState {
        case .currentButton:
            currentButton.backgroundColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
            pastButton.backgroundColor = .secondarySystemBackground
            currentButton.titleLabel?.textColor = .white
            pastButton.titleLabel?.textColor = .black
        case .pastButton:
            pastButton.backgroundColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
            pastButton.titleLabel?.textColor = .white
            currentButton.backgroundColor = .secondarySystemBackground
            currentButton.titleLabel?.textColor = .black
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

    @IBAction func clickCurrentButton(_ sender: UIButton) {
    
        NotificationCenter.default.post(name: Notification.Name(NotificationKey.clickCurrent.rawValue), object: nil)
        ButtonsCell.buttonState = .currentButton
        currentButton.backgroundColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        pastButton.backgroundColor = .secondarySystemBackground
        currentButton.titleLabel?.textColor = .white
        pastButton.titleLabel?.textColor = .black
        currentButton.setTitleColor(.white, for: .normal)
        pastButton.setTitleColor(.black, for: .normal)

    }
    
    @IBAction func clickPastButton(_ sender: UIButton) {
     
        NotificationCenter.default.post(name: Notification.Name(NotificationKey.clickPast.rawValue), object: nil)
        ButtonsCell.buttonState = .pastButton
        pastButton.backgroundColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
//        pastButton.titleLabel?.textColor = .white
        currentButton.backgroundColor = .secondarySystemBackground
        currentButton.titleLabel?.textColor = .black
        pastButton.titleLabel?.textColor = .white
        currentButton.setTitleColor(.black, for: .normal)
        pastButton.setTitleColor(.white, for: .normal)


        
        
    }
    

}

//NotificationCenter.default.addObserver(self, selector: #selector(updateSegmentStatus), name: NSNotification.Name(NotifiKey.updateStatus.rawValue), object: nil)
//@objc private func updateSegmentStatus() {
//    print(MainViewController.segmentStatus)
//    mainTableView.reloadData()
//}
//NotificationCenter.default.post(name: Notification.Name(updateStatus), object: nil)

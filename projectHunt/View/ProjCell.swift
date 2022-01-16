//
//  ProjCell.swift
//  projectHunt
//
//  Created by Артем Галиев on 28.12.2021.
//

import UIKit

class ProjCell: UITableViewCell{

    @IBOutlet weak var defLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    @IBOutlet weak var fourView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cornerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        typeView.layer.cornerRadius = 5
        typeView.layer.borderColor = #colorLiteral(red: 0.3991005421, green: 0.404093802, blue: 0.6900689006, alpha: 1)
        typeView.layer.borderWidth = 0.5
        firstView.layer.cornerRadius = 5
        secondView.layer.cornerRadius = 5
        thirdView.layer.cornerRadius = 5
        fourView.layer.cornerRadius = 5
        cornerView.layer.cornerRadius = 20
//        mainCollectView.delegate = self
//        mainCollectView.dataSource = self
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func refreshTable(model: ProjectsModel) {
        nameLabel.text = model.projectName
        typeLabel.text = "Web"
        defLabel.text = "В поисках:"
        switch model.skills.count {
        case 0:
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = true
            fourView.isHidden = true
        case 1:
            firstView.isHidden = false
            secondView.isHidden = true
            thirdView.isHidden = true
            fourView.isHidden = true
            firstLabel.text = model.skills[0]
        case 2:
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = true
            fourView.isHidden = true
            firstLabel.text = model.skills[0]
            secondLabel.text = model.skills[1]
        case 3:
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = false
            fourView.isHidden = true
            firstLabel.text = model.skills[0]
            secondLabel.text = model.skills[1]
            thirdLabel.text = model.skills[2]
        case 4:
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = false
            fourView.isHidden = false
            firstLabel.text = model.skills[0]
            secondLabel.text = model.skills[1]
            thirdLabel.text = model.skills[2]
            fourLabel.text = model.skills[3]
        default:
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = true
            fourView.isHidden = true
        }
    }
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            print("Count is \(model.skills.count)")
//            return model.skills.count
//        }
//        
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            if let cell = mainCollectView.dequeueReusableCell(withReuseIdentifier: "colview", for: indexPath) as? ProjectCollectionViewCell {
//                print("Create viewcell normal good")
//                let item = model.skills[indexPath.row]
//                cell.refreshPr(model: item, i: indexPath.row)
//            }
//            return UICollectionViewCell()
//        }
//    }
    func refreshTablePeople(model: PeopleModel) {
        nameLabel.text = model.name + " " + model.secondName
        typeLabel.text = model.skills[0]
        defLabel.text = "Ключевые навыки:"
        switch model.skills.count {
        case 0:
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = true
            fourView.isHidden = true
        case 1:
            firstView.isHidden = false
            secondView.isHidden = true
            thirdView.isHidden = true
            fourView.isHidden = true
            firstLabel.text = model.skills[0]
        case 2:
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = true
            fourView.isHidden = true
            firstLabel.text = model.skills[0]
            secondLabel.text = model.skills[1]
        case 3:
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = false
            fourView.isHidden = true
            firstLabel.text = model.skills[0]
            secondLabel.text = model.skills[1]
            thirdLabel.text = model.skills[2]
        case 4:
            firstView.isHidden = false
            secondView.isHidden = false
            thirdView.isHidden = false
            fourView.isHidden = false
            firstLabel.text = model.skills[0]
            secondLabel.text = model.skills[1]
            thirdLabel.text = model.skills[2]
            fourLabel.text = model.skills[3]
        default:
            firstView.isHidden = true
            secondView.isHidden = true
            thirdView.isHidden = true
            fourView.isHidden = true
        }

    }
//        
//        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            print("hello hahahah")
//            return 1
//        }
//        
//        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//            if let cell = mainCollectView.dequeueReusableCell(withReuseIdentifier: "colview", for: indexPath) as? ProjectCollectionViewCell {
//                cell.nameLabel.text = "ios"
//                return cell
//            }
//            return UICollectionViewCell()
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("hello")
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        if let cell = mainCollectView.dequeueReusableCell(withReuseIdentifier: "colview", for: indexPath) as? ProjectCollectionViewCell {
//            cell.nameLabel.text = "ios"
//            return cell
//        }
//        return UICollectionViewCell()
//    }

}



//extension ProjCell: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//}

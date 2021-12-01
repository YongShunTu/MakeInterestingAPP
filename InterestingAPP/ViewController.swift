//
//  ViewController.swift
//  InterestingAPP
//
//  Created by 姜又寧 on 2021/11/30.
//

import UIKit
import Foundation
enum Cat: String, CaseIterable {
    case 布偶貓, 波斯貓, 美短, 英短
}

class ViewController: UIViewController {
    
    @IBOutlet weak var catBackgroundView: UIImageView!
    
    @IBOutlet weak var catImageView: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var segmantedControl: UISegmentedControl!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var backgroundSwitch: UISwitch!
    
    @IBOutlet weak var imageTitleLabel: UILabel!
    
    @IBOutlet weak var imageDateLabel: UILabel!
    
    @IBOutlet weak var labelSilder: UISlider!
    
    var imageIndex : Int = 0 {
        didSet {
            let catArray = Cat.allCases
            self.catImageView.image = UIImage(named: "\(catArray[imageIndex])")
        }
    }
    
    var labelFont : CGFloat = 0 {
        didSet {
            imageTitleLabel.font = UIFont.systemFont(ofSize: labelFont)
            imageDateLabel.font = UIFont.systemFont(ofSize: labelFont)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelSilder.maximumValue = 50
        labelSilder.minimumValue = 10
        updataUI()
    }
    
    func updataUI() {
        let allCat = Cat.allCases
        for i in 0...(allCat.count - 1) {
            segmantedControl.setTitle("\(allCat[i])", forSegmentAt: i)
        }
    }
    
    @IBAction func getImageLabel(_ sender: Any) {
        imageTitleLabel.text = textField.text
        view.endEditing(true)
        textField.text = ""
    }
    
    @IBAction func getImageView(_ sender: UISegmentedControl) {
        let number = sender.selectedSegmentIndex
        imageIndex = number
    }
    
    @IBAction func changeBackground(_ sender: Any) {
        if backgroundSwitch.isOn {
            catBackgroundView.image = UIImage(named: "白天")
            self.catImageView.backgroundColor = .clear
        }else if backgroundSwitch.isEnabled {
            catBackgroundView.image = UIImage(named: "星空")
            self.catImageView.backgroundColor = .clear
        }
    }
    
    @IBAction func gatDateLabel(_ sender: Any) {
        let date = datePicker.date
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyy年MM月dd日"
        imageDateLabel.text = dataFormatter.string(from: date)
    }
    

    @IBAction func changeLabelFont(_ sender: UISlider) {
        self.labelFont = CGFloat(sender.value)
    }
    
    @IBAction func randomLabelFont(_ sender: Any) {
        labelSilder.value = Float(Int.random(in: Int(labelSilder.minimumValue)...Int(labelSilder.maximumValue)))
        self.labelFont = CGFloat(labelSilder.value)
        
    }

    
}


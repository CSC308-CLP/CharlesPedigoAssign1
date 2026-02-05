//
//  ViewController.swift
//  CharlesPedigoAssign1
//
//  Created by Pedigo, Charles L. on 2/4/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var unitConLabel: UILabel!
    @IBOutlet weak var unitConInput: UITextField!
    @IBOutlet weak var unitConOutput: UILabel!
    
    @IBOutlet weak var unitConType: UIButton!
    @IBAction func unitConTypeButton(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Select Unit Conversion", message: nil, preferredStyle: .actionSheet)
        let CtoF = UIAlertAction(title: "Celsius to Fahrenheit", style: .default) { (_) in
            self.unitConType.setTitle("Celsius to Fahrenheit", for: .normal)
        }
        actionSheet.addAction(CtoF)
        let FtoC = UIAlertAction(title: "Fahrenheit to Celsius", style: .default) { (_) in
            self.unitConType.setTitle("Fahrenheit to Celsius", for: .normal)
        }
        actionSheet.addAction(FtoC)
        let KMtoMiles = UIAlertAction(title: "Kilometers to Miles", style: .default) { (_) in
            self.unitConType.setTitle("Kilometers to Miles", for: .normal)
        }
        actionSheet.addAction(KMtoMiles)
        let MilestoKM = UIAlertAction(title: "Miles to Kilometers", style: .default) { (_) in
            self.unitConType.setTitle("Miles to Kilometers", for: .normal)
        }
        actionSheet.addAction(MilestoKM)
        
        present(actionSheet, animated: true)
        
    }
    
    @IBAction func unitConvertButton(_ sender: Any) {
        guard !unitConInput.text!.isEmpty else {
            unitConOutput.text = "Error"
            return
        }
        guard let inputValue = Double(unitConInput.text!) else {
            unitConOutput.text = "Error"
            return
        }
        
        if unitConType.titleLabel?.text == "Celsius to Fahrenheit" {
            let outputValue = ((inputValue * 9.0 / 5.0) + 32.0)
            unitConOutput.text = String(format: "%.1f", outputValue) + "°F"
        }else if unitConType.titleLabel?.text == "Fahrenheit to Celsius" {
            let outputValue = (inputValue - 32.0) * 5.0 / 9.0
            unitConOutput.text = String(format: "%.1f", outputValue) + "°C"
        }else if unitConType.titleLabel?.text == "Kilometers to Miles" {
            let outputValue = inputValue * 0.621371
            unitConOutput.text = String(format: "%.1f", outputValue) + " miles"
        }else if unitConType.titleLabel?.text == "Miles to Kilometers" {
            let outputValue = inputValue / 0.621371
            unitConOutput.text = String(format: "%.1f", outputValue) + " km"
        }else{
            unitConOutput.text = "Invalid Conversion Type"
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


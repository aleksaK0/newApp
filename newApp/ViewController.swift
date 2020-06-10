//
//  ViewController.swift
//  newApp
//
//  Created by Aleksa on 10.06.2020.
//  Copyright © 2020 Aleksa. All rights reserved.
//

import UIKit

class Currencies {
    var curFrom: String
    var curTo: [String]
    
    init(curFrom: String, curTo: [String]) {
        self.curFrom = curFrom
        self.curTo = curTo
    }
}

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var fromToCurLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var currencies = [Currencies]()
    var cur_From = ""
    var cur_To = ""
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) { self.view.endEditing(true) }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        let selectedCurFrom = pickerView.selectedRow(inComponent: 0)
        let selectedCurTo = pickerView.selectedRow(inComponent: 1)
        let curFrom = currencies[selectedCurFrom].curFrom
        let curTo = currencies[selectedCurFrom].curTo[selectedCurTo]
        
        fromToCurLabel.text = "Convert from \(curFrom) to \(curTo)?"
        
        cur_From = curFrom
        cur_To = curTo
        
    }
    
    var amountConverted: Double = 0
    
    @IBAction func convertButton(_ sender: UIButton) {
        let amountDouble: Double? = Double(amountTextField.text!)
        
        switch cur_From {
        case "RUB":
            switch cur_To {
                case "USD": amountConverted = amountDouble! * 1
                case "EUR": amountConverted = amountDouble! * 2
                case "GBP": amountConverted = amountDouble! * 3
                case "JPY": amountConverted = amountDouble! * 4
            default: print(1)
            }
        case "USD":
            switch cur_To {
                case "RUB": amountConverted = amountDouble! * 1
                case "EUR": amountConverted = amountDouble! * 2
                case "GBP": amountConverted = amountDouble! * 3
                case "JPY": amountConverted = amountDouble! * 4
            default: print(1)
            }
        case "EUR":
            switch cur_To {
                case "RUB": amountConverted = amountDouble! * 1
                case "USD": amountConverted = amountDouble! * 2
                case "GBP": amountConverted = amountDouble! * 3
                case "JPY": amountConverted = amountDouble! * 4
            default: print(1)
            }
        case "GBP":
            switch cur_To {
                case "RUB": amountConverted = amountDouble! * 1
                case "USD": amountConverted = amountDouble! * 2
                case "EUR": amountConverted = amountDouble! * 3
                case "JPY": amountConverted = amountDouble! * 4
            default: print(1)
            }
        case "JPY":
            switch cur_To {
                case "RUB": amountConverted = amountDouble! * 1
                case "USD": amountConverted = amountDouble! * 2
                case "EUR": amountConverted = amountDouble! * 3
                case "GBP": amountConverted = amountDouble! * 4
            default: print(1)
        }
        default: print(1)
        }
        
        let amountConvertedStr = String(amountConverted)
        resultLabel.text = amountConvertedStr
    }

    
    override func viewDidLoad() {
        pickerView.delegate = self
        pickerView.dataSource = self
        currencies.append(Currencies(curFrom: "RUB", curTo: ["USD", "EUR", "GBP", "JPY"]))
        currencies.append(Currencies(curFrom: "USD", curTo: ["RUB", "EUR", "GBP", "JPY"]))
        currencies.append(Currencies(curFrom: "EUR", curTo: ["RUB", "USD", "GBP", "JPY"]))
        currencies.append(Currencies(curFrom: "GBP", curTo: ["RUB", "USD", "EUR", "JPY"]))
        currencies.append(Currencies(curFrom: "JPY", curTo: ["RUB", "USD", "EUR", "GBP"]))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {return 2}
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {return currencies.count}
        else {
            let selectedCurFrom = pickerView.selectedRow(inComponent: 0)
            return currencies[selectedCurFrom].curTo.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {return currencies[row].curFrom}
        else {
            let selectedCurFrom = pickerView.selectedRow(inComponent: 0)
            return currencies[selectedCurFrom].curTo[row]
        }
    }
    
    

    
    
}


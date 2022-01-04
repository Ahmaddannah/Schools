//
//  FilterVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit

class FilterVC: UIViewController {

    var arr : [String] = ["حكومي","اهلي","عالمي"]
    
    @IBOutlet weak var textF: UITextField!
        
    var pickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickerView.delegate = self
        pickerView.dataSource = self
        textF.inputView = pickerView
        textF.textAlignment = .right
        
    }
    


}

extension FilterVC : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return arr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return arr[row]

    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        textF.text = arr[row]
        textF.resignFirstResponder()

    }
}


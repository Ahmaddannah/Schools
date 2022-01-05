//
//  NewSchoolAccount2VC.swift
//  Schools
//
//  Created by Ahmad MacBook on 05/01/2022.
//

import UIKit

class NewSchoolAccount2VC: UIViewController {

    @IBOutlet weak var schoolType: UITextField!
    
    @IBOutlet weak var schoolStage: UITextField!
    
    @IBOutlet weak var schoolCategory: UITextField!
    
    @IBOutlet weak var schoolCapacity: UITextField!
    
    @IBOutlet weak var schoolStatus: UITextField!
    
    @IBOutlet weak var schoolLocation: UITextField!
    
    @IBOutlet weak var schoolMaximumNum: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func createAccountSchoolButton(_ sender: Any) {
        
    }
    
    
    func hideKeyboardWhenTappedAround() {
       
      let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
      tap.cancelsTouchesInView = false
      view.addGestureRecognizer(tap)
     }
      
     @objc func dismissKeyboard() {
      view.endEditing(true)
     }

    
    
}

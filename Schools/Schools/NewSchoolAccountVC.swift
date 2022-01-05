//
//  NewAccountVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase

class NewSchoolAccountVC: UIViewController {
    
    let db = Firestore.firestore()

    @IBOutlet weak var nameSchool: UITextField!
    
    @IBOutlet weak var phoneSchool: UITextField!
    
    @IBOutlet weak var emailSchool: UITextField!
    
    @IBOutlet weak var passwordSchool: UITextField!
    
    @IBOutlet weak var passwordSchool2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = "الرجوع"
        
        hideKeyboardWhenTappedAround()
        
        passwordSchool.isSecureTextEntry = true
        passwordSchool2.isSecureTextEntry = true
    }
            
    

    @IBAction func nextPageForNewSchool(_ sender: Any) {
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "NewSchoolAccount2VC") as! NewSchoolAccount2VC
        
        navigationController?.pushViewController(nextVC, animated: true)
        
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


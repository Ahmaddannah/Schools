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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = "الرجوع"
        
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




//    func checkData(){
//
//
//        if nameTextField.text!.isEmpty {
//
//        }else if phoneTextField.text!.isEmpty {
//
//        }else if emailTextField.text!.isEmpty {
//
//        }else if password1TextField.text!.isEmpty {
//
//        }else if password2TextField.text!.isEmpty {
//
//        }else if password1TextField.text != password2TextField.text {
//
//        }
//
//    }
    
    


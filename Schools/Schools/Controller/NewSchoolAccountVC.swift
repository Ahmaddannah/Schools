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
        
        Check()
        
        let nextVC = storyboard?.instantiateViewController(withIdentifier: "NewSchoolAccount2VC") as! NewSchoolAccount2VC
        
        nextVC.nameSchool = nameSchool.text!
        nextVC.phoneSchool = phoneSchool.text!
        nextVC.emailSchool = emailSchool.text!
        nextVC.passwordSchool = passwordSchool.text!
        
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    func Check(){
        
        if nameSchool.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال اسم المدرسة", isAdd: true )
            
        }else if phoneSchool.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال رقم المدرسة", isAdd: true )
            
        }else if emailSchool.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال البريد للمدرسة", isAdd: true )
            
        }else if passwordSchool.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال كلمة المرور ", isAdd: true )
            
        }else if passwordSchool2.text!.isEmpty{
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال التحقق من كلمة المرور", isAdd: true )
            
        }else if passwordSchool.text != passwordSchool2.text {
            
            myCustomAlert(title: "تنبيه", message: "كلمة المرور لا تشبه كلمة مرور التحقق", isAdd: true )
        }
    }
    
    
    
    func hideKeyboardWhenTappedAround() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func myCustomAlert(title :String , message : String , isAdd: Bool) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if isAdd{
            
            let action = UIAlertAction(title: "نعم", style: .default) { action in
                
            }
            alert.addAction(action)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}


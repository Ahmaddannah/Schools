//
//  ProfileVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase
import SwiftUI

class ProfileVC : UIViewController ,  RefreshDelegate {
    
    func refresh(check: Bool) {
        if check {
            print("show")
        }else{
            print("noooo")
        }
    }
    
    let db = Firestore.firestore()

    
    @IBOutlet weak var PersonalProfile: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var messageForUserNotSignIn: UILabel!
        
    @IBOutlet weak var signInButton: UIBarButtonItem!
    
    override func viewWillAppear(_ animated: Bool) {
        checkUserSignIn()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
        let login = storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! SignInVC
        
        navigationController?.pushViewController(login, animated: true)
    }
    
    @IBAction func schoolAcount(_ sender: Any) {
        
        let toSchool = storyboard?.instantiateViewController(withIdentifier: "NewSchoolAccountVC") as! NewSchoolAccountVC
        
        navigationController?.pushViewController(toSchool, animated: true)
        
    }
    
    
    
    func checkUserSignIn(){
        
        if Auth.auth().currentUser?.uid == nil {
            
            signInButton.customView?.isHidden = false
            PersonalProfile.isHidden = true
            nameLabel.isHidden = true
            phoneLabel.isHidden = true
            emailLabel.isHidden = true
            messageForUserNotSignIn.isHidden = false
            
        }else {
            signInButton.customView?.isHidden = true
            PersonalProfile.isHidden = false
            nameLabel.isHidden = false
            phoneLabel.isHidden = false
            emailLabel.isHidden = false
            messageForUserNotSignIn.isHidden = true
        }
    }
    
    
    
    
    
    @IBAction func settingButton(_ sender: Any) {
        
        if Auth.auth().currentUser?.uid == nil {

            myCustomAlert(title: "تنبيه", message: "قم بتسجيل الدخول للوصول للاعدادات", isAdd: true)

        }else {
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
            
            self.navigationController?.pushViewController(vc, animated: true)
        }

        
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
    
    
    
    func hideKeyboardWhenTappedAround() {
       
      let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
      tap.cancelsTouchesInView = false
      view.addGestureRecognizer(tap)
     }
      
     @objc func dismissKeyboard() {
      view.endEditing(true)
     }
    
}

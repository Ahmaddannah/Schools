//
//  ProfileVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase


class ProfileVC : UIViewController {
    
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
        
        if Auth.auth().currentUser?.uid == nil {
            
            let login = storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! SignInVC
            navigationController?.pushViewController(login, animated: true)
            
        } else {
            
            myCustomAlert(title: "تنبيه", message: "لقد سجلت دخولك بالفعل", isAdd: true)
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
    
}// end of the class


extension ProfileVC {
    
    func checkUserSignIn(){
        
        if Auth.auth().currentUser?.uid == nil {
            
            PersonalProfile.isHidden = true
            nameLabel.isHidden = true
            phoneLabel.isHidden = true
            emailLabel.isHidden = true
            messageForUserNotSignIn.isHidden = false
            
            
        }else {
            
            getDataFromFireBase()
            PersonalProfile.isHidden = false
            nameLabel.isHidden = false
            phoneLabel.isHidden = false
            emailLabel.isHidden = false
            messageForUserNotSignIn.isHidden = true
        }
    }
    
    
    func getDataFromFireBase(){
        
        db.collection("Users").getDocuments { querySnapshot, error in
            if error == nil {
                
                querySnapshot?.documents.forEach({ QueryDocumentSnapshot in
                    
                    let name : String = (QueryDocumentSnapshot.get("name") as? String)!
                    let phone : String = (QueryDocumentSnapshot.get("phone") as? String)!
                    let email : String = (QueryDocumentSnapshot.get("email") as? String)!
                    
                    self.nameLabel.text = name
                    self.phoneLabel.text = phone
                    self.emailLabel.text = email
                    
                }
                                                 
                )}
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

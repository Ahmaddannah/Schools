//
//  SettingVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase

class SettingVC: UIViewController {
    
    let db = Firestore.firestore()
    var userId = Auth.auth().currentUser?.uid
    var defaults = UserDefaults.standard
    
    @IBOutlet weak var darkLightModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        darkLightModeSwitch.isOn = false
        
    }
    
    @IBAction func darkLightModeSwitchAction(_ sender: Any) {
        
        if defaults.bool(forKey: "mode") == false {
            
            if darkLightModeSwitch.isOn == true {
                
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .dark}
            }else {
                
                if #available(iOS 10.0, *) {
                    
                    UIApplication.shared.windows.forEach { window in
                        window.overrideUserInterfaceStyle = .light }
                }
            }
        }else{
            
        }
    }
    
    
    @IBAction func changePasswordButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPassword") as! ForgotPasswordVC
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBAction func signOutButton(_ sender: Any) {
        
        navigationController?.popViewController(animated: false)
        
        do {
            try Auth.auth().signOut()
            
            myCustomAlert(title: " ", message: "تم تسجيل الخروج بنجاح ", isAdd: true)
            
        } catch {
            print("Error in SignOut")
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

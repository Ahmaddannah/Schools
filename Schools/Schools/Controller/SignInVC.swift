//
//  ViewController.swift
//  Schools
//
//  Created by Ahmad MacBook on 03/01/2022.
//

import UIKit
import Firebase

class SignInVC: UIViewController{
    
    let db = Firestore.firestore()
    var userId = Auth.auth().currentUser?.uid
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
        emailTextField.keyboardType = .numberPad
        
        passwordTextField.isSecureTextEntry = true
        
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        
        let toForgot = storyboard?.instantiateViewController(withIdentifier: "ForgotPassword") as! ForgotPasswordVC
        
        navigationController?.pushViewController(toForgot, animated: true)
        
    }
    
    
    
    
    @IBAction func signInButton(_ sender: Any){
        
        signIn()
        dismiss(animated: true, completion: .none)
    }
    
    
    @IBAction func createAccountButton(_ sender: Any) {
        
        let toCreate = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        
        navigationController?.pushViewController(toCreate, animated: true)
        
    }
    
    
    @IBAction func schoolAccountButton(_ sender: Any) {
       
        let toCreateAccountSchool = storyboard?.instantiateViewController(withIdentifier: "NewSchoolAccountVC") as! NewSchoolAccountVC
        
        navigationController?.pushViewController(toCreateAccountSchool, animated: true)
        
    }
    
    
    func signIn(){
        
            if emailTextField.text != "" && passwordTextField.text != "" {
                Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text! , completion: { user, error in
                    
                    if error == nil {
                        
               self.navigationController?.popViewController(animated: true)
                        
                        
                    }else{
                        
                        let alert = UIAlertController(title: "تنبيه", message: error?.localizedDescription, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "حسناً", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                })
            } else {
                let alert = UIAlertController(title: "بيانات ناقصة", message: "الرجاء التأكد من إدخال البريد الإلكتروني و كلمة المرور", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "حسناً", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
    }
    
    
    
    func hideKeyboardWhenTappedAround(){
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

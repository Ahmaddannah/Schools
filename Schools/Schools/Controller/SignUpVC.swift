//
//  SignUpVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 11/01/2022.
//

import UIKit
import Firebase

class SignUpVC: UIViewController {
    
    let db = Firestore.firestore()
    var userId = Auth.auth().currentUser?.uid
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        phoneTextField.keyboardType = .numberPad
        passwordTextField.isSecureTextEntry = true
        hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func createButton(_ sender: Any) {
        
        signUpAction()

    }
    
}


extension SignUpVC {
    
    
    func signUpAction(){
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { user, Error in
                
                if Error != nil {

                    let alert = UIAlertController(title: "تنبيه", message: Error?.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "حسناً", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                    
                } else {
                    
                    self.addUser(userId: (user?.user.uid)!)
                    self.myCustomAlert(title: "", message: "تم انشاء الحساب", isAdd: true)
                    self.navigationController?.popViewController(animated: false)
                    self.navigationController?.popViewController(animated: true)


                }
            }
            
            
        } else {
            
            let alert = UIAlertController(title: "بيانات ناقصة", message: "الرجاء التأكد من إدخال البريد الإلكتروني و كلمة المرور", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "حسناً", style: .default, handler: nil))
            
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    
    func addUser(userId: String) {
        
        self.db.collection("Users")
            .document(userId).setData(
                [
                    "uid" : Auth.auth().currentUser!.uid ,
                    "name" : self.nameTextField.text!,
                    "phone" : self.phoneTextField.text!,
                    "email": emailTextField.text!,
                    "password": passwordTextField.text!
                ])
        {(error) in
            if error == nil {
                print("Added Succ..")
                
            }else {
                print(error!.localizedDescription)
                
            }
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
    
    
    func hideKeyboardWhenTappedAround(){
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

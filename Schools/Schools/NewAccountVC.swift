//
//  NewAccountVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase

class NewAccountVC: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var typeOfUsersSegment: UISegmentedControl!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var password1TextField: UITextField!
    
    @IBOutlet weak var password2TextField: UITextField!
    
    @IBOutlet weak var newAccountOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        typeOfUsersSegment.selectedSegmentIndex = 1
        
        password1TextField.isSecureTextEntry = true
        password2TextField.isSecureTextEntry = true
    }
    
    @IBAction func segmentTypeOfUsersAction(_ sender: Any) {
        
        if typeOfUsersSegment.selectedSegmentIndex == 0{
            
            nameTextField.placeholder = "اسم المدرسة"
            phoneTextField.placeholder = "رقم المدرسة"
            emailTextField.placeholder = "البريد الالكتروني للمدرسة"
            
        }else {
            nameTextField.placeholder = "الاسم"
            phoneTextField.placeholder = "رقم الجوال"
            emailTextField.placeholder = "البريد الالكتروني"
        }
    }
    
    @IBAction func newAccountButton(_ sender: Any) {
        
        if nameTextField.text == nil {
            
        }else if phoneTextField.text == nil {
            
        }else if emailTextField.text == nil {
            
        }else if password1TextField.text == nil {
            
        }else if password2TextField.text == nil {
            
        }else if password1TextField.text != password2TextField.text {
            print("hi")
        }
    }
    
}

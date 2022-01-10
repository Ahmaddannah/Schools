//
//  NewSchoolAccount2VC.swift
//  Schools
//
//  Created by Ahmad MacBook on 05/01/2022.
//

import UIKit
import Firebase

class NewSchoolAccount2VC: UIViewController {
    
    let db = Firestore.firestore()
    
    var nameSchool: String = ""
    
    var phoneSchool: String = ""
    
    var emailSchool: String = ""
    
    var passwordSchool: String = ""
    
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
        
        check()
        uploadData()
        dismiss(animated: false, completion: .none)
        dismiss(animated: false, completion: .none)
        
    }
    
    func uploadData(){
        
        db.collection("School").addDocument(data: [
            
            "schoolName" : nameSchool ,
            "schoolEmail" : emailSchool ,
            "schoolPhone" : phoneSchool ,
            "schoolPassword" : passwordSchool ,
            "schoolType" : schoolType.text! ,
            "schoolStage" : schoolStage.text! ,
            "schoolCategory" : schoolCategory.text! ,
            "schoolCapacity" : schoolCapacity.text!,
            "schoolStatus" : schoolStatus.text! ,
            "schoolLocation" : schoolLocation.text! ,
            "schoolMaximumNum" : schoolMaximumNum.text!
            
        ]){error in
            if error == nil {
                
                self.myCustomAlert(title: "تنبيه", message: "تم اضافة المدرسة بنجاح", isAdd: true )
                
            }else {
                self.myCustomAlert(title: "تنبيه", message: "حصلت مشكلة ما الرجاء المحاولة مره اخرى", isAdd: true )            }
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
    
    
    func check(){
        
        if schoolType.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال نوع المدرسة ", isAdd: true )
            
        }else if schoolStage.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال مرحلة المدرسة ", isAdd: true )
            
        }else if schoolCategory.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال فئة المدرسة ", isAdd: true )
            
        }else if schoolCapacity.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال الفئة الاستيعابية للمدرسة ", isAdd: true )
            
        }else if schoolStatus.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال حالة التسجيل للمدرسة  ", isAdd: true )
            
        }else if schoolLocation.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال موقع المدرسة ", isAdd: true )
            
        }else if schoolMaximumNum.text!.isEmpty{
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال الحد الاقصى لعدد الطلاب بالفصل  ", isAdd: true )
            
        }
    }

    
    func myCustomAlert(title :String , message : String , isAdd: Bool) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if isAdd{
            
            let action = UIAlertAction(title: "موافق", style: .default) { action in
                
            }
            alert.addAction(action)
        }
        
        self.present(alert, animated: true, completion: nil)
        
    }
}


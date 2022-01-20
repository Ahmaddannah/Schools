//
//  EditDataVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 20/01/2022.
//

import UIKit
import Firebase

class EditDataVC: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var newNameTextField: UITextField!
    @IBOutlet weak var newPhoneTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func doneButton(_ sender: Any) {
        
        checkData()
        updateDataToFireBase()
    }
    
    
    
    
    
}

extension EditDataVC {
    
    func checkData(){
        
        if newNameTextField.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال الاسم", isAdd: true )
            
        } else if newPhoneTextField.text!.isEmpty {
            
            myCustomAlert(title: "تنبيه", message: "لم تقم بأدخال رقم الجوال", isAdd: true )
            
        }else {
            
        }
    }
    
    
    func updateDataToFireBase(){
        
        let newData = [
            
            "uid":Auth.auth().currentUser!.uid,
            "name" : self.newNameTextField.text!,
            "phone" : self.newPhoneTextField.text!,
            
        ]
        
        
        db.collection("Users").whereField("uid", isEqualTo: Auth.auth().currentUser!.uid as Any).getDocuments { [self] (result, error) in
            
            if error == nil {
                
                for document in result!.documents{
                    
                    db.collection("Users").document(document.documentID).setData(newData , merge: true)
                }
                
                myCustomAlert(title: "حسنا", message: "تم تغيير البيانات بنجاح", isAdd: true )

            }else {
                print(error!.localizedDescription , "Error Edit Data")
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
    
}

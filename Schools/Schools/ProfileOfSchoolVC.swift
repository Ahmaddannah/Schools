//
//  ProfileOfSchool.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase


class ProfileOfSchoolVC: UIViewController {

    @IBOutlet weak var schoolType: UILabel!
    
    @IBOutlet weak var schoolStage: UILabel!
    
    @IBOutlet weak var schoolCategory: UILabel!
    
    @IBOutlet weak var schoolCapacity: UILabel!
    
    @IBOutlet weak var schoolAvailability: UILabel!
    
    @IBOutlet weak var schoolMaximumNumberInClass: UILabel!
    
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        
    }
    
    
    
    @IBAction func schoolPhotoButton(_ sender: Any) {
        
    }
    
    
    @IBAction func schoolPhoneButton(_ sender: Any) {
        
        if let phoneURL = NSURL(string: ("tel://" + "0532955544")) {
                           UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func schoolLocationButton(_ sender: Any) {
        
    }
    
    
    @IBAction func schoolCommentButton(_ sender: Any) {
//
        
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

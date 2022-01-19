//
//  ProfileOfSchool.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase
import WebKit

class ProfileOfSchoolVC: UIViewController {
    
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var schoolType: UILabel!
    @IBOutlet weak var schoolStage: UILabel!
    @IBOutlet weak var schoolCategory: UILabel!
    @IBOutlet weak var schoolCapacity: UILabel!
    @IBOutlet weak var schoolAvailability: UILabel!
    @IBOutlet weak var schoolMaximumNumberInClass: UILabel!
    
    var schoolObject : School? = nil
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = "الرجوع"
        getDataFromObjectSchools()
        hideKeyboardWhenTappedAround()
        
    }
    
    @IBAction func schoolChat(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChatVC") as! CommentVC
        vc.takeID = schoolObject!.id
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    
    @IBAction func schoolPhoneButton(_ sender: Any) {
        
        if let phoneURL = NSURL(string: ("tel://" + schoolObject!.schoolPhone)) {
            UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func schoolLocationButton(_ sender: Any) {
        
        let x = storyboard?.instantiateViewController(withIdentifier: "WebMapVC") as! WebMapVC
        x.url = schoolObject!.schoolLocation
        navigationController?.pushViewController(x, animated: true)
        
    }
    
    
    @IBAction func schoolEmail(_ sender: Any) {
        
        if let url = URL(string: "mailto:\(schoolObject?.schoolEmail ?? "")") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    
    
}


extension ProfileOfSchoolVC {
    
    
    func getDataFromObjectSchools(){
        
        schoolName.text = schoolObject?.schoolName
        schoolType.text = schoolObject?.schoolType
        schoolStage.text = schoolObject?.schoolStage
        schoolCategory.text = schoolObject?.schoolCategory
        schoolAvailability.text = schoolObject?.schoolStatus
        schoolMaximumNumberInClass.text = schoolObject?.schoolMaximumNum
        schoolCapacity.text = schoolObject?.schoolCapacity
        
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

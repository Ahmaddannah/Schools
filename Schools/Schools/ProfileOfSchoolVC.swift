//
//  ProfileOfSchool.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase



class ProfileOfSchoolVC: UIViewController {

    @IBOutlet weak var schoolName: UILabel!
    
    @IBOutlet weak var schoolType: UILabel!
    
    @IBOutlet weak var schoolStage: UILabel!
    
    @IBOutlet weak var schoolCategory: UILabel!
    
    @IBOutlet weak var schoolCapacity: UILabel!
    
    @IBOutlet weak var schoolAvailability: UILabel!
    
    @IBOutlet weak var schoolMaximumNumberInClass: UILabel!
    
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromFireBase()
        
        hideKeyboardWhenTappedAround()
        
    }
    
    
    
    func getDataFromFireBase(){
        
        db.collection("School").getDocuments { querySnapshot, error in
            if error == nil {
                
                querySnapshot?.documents.forEach({ QueryDocumentSnapshot in
                    
                    self.schoolName.text = QueryDocumentSnapshot.get("schoolName") as? String
                    
                    self.schoolType.text = QueryDocumentSnapshot.get("schoolType") as? String
                    
                    self.schoolStage.text = QueryDocumentSnapshot.get("schoolStage") as? String
                    
                    self.schoolCategory.text = QueryDocumentSnapshot.get("schoolCategory") as? String
                    
                    self.schoolAvailability.text = QueryDocumentSnapshot.get("schoolStatus") as? String
                    
                    self.schoolCapacity.text = QueryDocumentSnapshot.get("schoolCapacity") as! String?
                    
                    self.schoolMaximumNumberInClass.text = QueryDocumentSnapshot.get("schoolMaximumNum") as? String
            
//                    self.schoolName.text = QueryDocumentSnapshot.get("schoolPhone") as! String
//
//                    self.schoolName.text = QueryDocumentSnapshot.get("schoolLocation") as! String
//
//                    self.schoolName.text = QueryDocumentSnapshot.get("schoolEmail") as! String

                })
                
            }else{
                
                print(error!.localizedDescription)
                
            }
        }
    }

    
    
    
    @IBAction func schoolPhotoButton(_ sender: Any) {
        
        
    }
    
    
    @IBAction func schoolPhoneButton(_ sender: Any) {
        
        if let phoneURL = NSURL(string: ("tel://" + "0532955544")) {
                           UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func schoolLocationButton(_ sender: Any) {
        
        let strawberryUrl = URL(string: "https://goo.gl/maps/L86tGtEYpGPccgDw5")
                 let strawberryRequest = URLRequest(url: strawberryUrl!)
       
//        var x = MapsVC()
//        x.map.load(strawberryRequest)
//
//        locationWeb.load(strawberryRequest)


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

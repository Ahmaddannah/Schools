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
    
    var schoolObject : School? = nil
    
    let db = Firestore.firestore()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataFromObjectSchools()
        hideKeyboardWhenTappedAround()
        
    }
    
    
    func getDataFromObjectSchools(){
        
        schoolName.text = schoolObject?.schoolName
        schoolType.text = schoolObject?.schoolType
        schoolStage.text = schoolObject?.schoolStage
        schoolCategory.text = schoolObject?.schoolCategory
        schoolAvailability.text = schoolObject?.schoolStatus
        schoolMaximumNumberInClass.text = schoolObject?.schoolMaximumNum
        
    }

    
    @IBAction func schoolPhotoButton(_ sender: Any) {
        
    }
    
    
    @IBAction func schoolPhoneButton(_ sender: Any) {
        
        if let phoneURL = NSURL(string: ("tel://" + schoolObject!.schoolPhone)) {
                           UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func schoolLocationButton(_ sender: Any) {
        
//        let strawberryUrl = URL(string: "https://goo.gl/maps/L86tGtEYpGPccgDw5")
//                 let strawberryRequest = URLRequest(url: strawberryUrl!)
//
//        var x = MapsVC()
//        x.map.load(strawberryRequest)
//
//        locationWeb.load(strawberryRequest)


    }
    
    
    @IBAction func schoolCommentButton(_ sender: Any) {
        
        
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

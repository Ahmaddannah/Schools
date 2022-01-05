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

    }
    
    
    
    
    @IBAction func schoolPhotoButton(_ sender: Any) {
        
    }
    
    
    @IBAction func schoolPhoneButton(_ sender: Any) {
        
    }
    
    @IBAction func schoolLocationButton(_ sender: Any) {
        
    }
    
    
    @IBAction func schoolCommentButton(_ sender: Any) {
        
//        let comment = storyboard?.instantiateViewController(withIdentifier: "CommentOfSchoolVC") as! CommentOfSchoolVC
//
//        comment.modalPresentationStyle = .fullScreen
//
//        self.present(comment, animated: true, completion: nil)
    }
    
    
}

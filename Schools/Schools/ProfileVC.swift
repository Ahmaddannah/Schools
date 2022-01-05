//
//  ProfileVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    let db = Firestore.firestore()
    
//    override func viewWillAppear(_ animated: Bool) {
//
//
//
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func settingButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

//
//  SettingVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase

class SettingVC: UIViewController {
    
        let db = Firestore.firestore()
    
    @IBOutlet weak var darkLightModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        darkLightModeSwitch.isOn = false
        
    }
    
    @IBAction func darkLightModeSwitchAction(_ sender: Any) {
        
        if darkLightModeSwitch.isOn == true {
            overrideUserInterfaceStyle = .dark
        }else{
            overrideUserInterfaceStyle = .light
        }
    }
    
    @IBAction func changePasswordButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ForgotPassword") as! ForgotPasswordVC
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

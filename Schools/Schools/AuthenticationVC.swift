//
//  AuthenticationVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 05/01/2022.
//

import UIKit
import Firebase

class AuthenticationVC: UIViewController {

        let db = Firestore.firestore()
    
    var time = 59
    var miuntes = 2

    
    var timer: Timer? = nil
    
    @IBOutlet weak var timerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        action()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        
    }
    
    @objc func action(){
        time -= 1
        if time == 0 {
           miuntes -= 1
            time = 59
        }
        timerLabel.text = String(miuntes) + ":" + String(time)

    }
    

    @IBAction func checkButton(_ sender: Any) {
        
//        PhoneAuthProvider().verifyPhoneNumber(<#T##phoneNumber: String##String#>, uiDelegate: <#T##AuthUIDelegate?#>, completion: <#T##VerificationResultCallback?##VerificationResultCallback?##(String?, Error?) -> Void#>)
    }
    
}

//
//  ViewController.swift
//  Schools
//
//  Created by Ahmad MacBook on 03/01/2022.
//

import UIKit
import Firebase

class LogInVC: UIViewController {

        let db = Firestore.firestore()
    
    
    
    @IBOutlet weak var numberTextField: UITextField!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    @IBAction func sendButton(_ sender: Any) {
        
        let toAuthen = storyboard?.instantiateViewController(withIdentifier: "AuthenticationVC") as! AuthenticationVC
        
        navigationController?.pushViewController(toAuthen, animated: true)
        
        
    }
}

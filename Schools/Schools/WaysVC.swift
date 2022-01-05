//
//  WaysVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 05/01/2022.
//

import UIKit

class WaysVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    @IBAction func toSignInButton(_ sender: Any) {
        
        let login = storyboard?.instantiateViewController(withIdentifier: "LogInVC") as! LogInVC
        
        navigationController?.pushViewController(login, animated: true)
        
    }
    
    @IBAction func backToMainButton(_ sender: Any) {
        
        dismiss(animated: true, completion: .none)
        
        
    }
}

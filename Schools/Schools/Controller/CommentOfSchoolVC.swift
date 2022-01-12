//
//  CommentOfSchoolVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 05/01/2022.
//

import UIKit

class CommentOfSchoolVC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
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

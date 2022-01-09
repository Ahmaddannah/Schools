//
//  SchoolsVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase

class SchoolsTableViewVC: UIViewController {
    
    let db = Firestore.firestore()
    
    var arraySchool : [String] = ["","","","","","","","",""]
    
    @IBOutlet weak var tableViewOfSchools: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        tableViewOfSchools.dataSource = self
        tableViewOfSchools.delegate = self
    }
    

    @IBAction func filterButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "FilterVC") as? FilterVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    func hideKeyboardWhenTappedAround() {
       
      let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
      tap.cancelsTouchesInView = false
      view.addGestureRecognizer(tap)
     }
      
     @objc func dismissKeyboard() {
      view.endEditing(true)
     }
    
    

    
}// end of the class

extension SchoolsTableViewVC : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arraySchool.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewOfSchools.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//        cell.schoolName.text = arraySchool[indexPath.row].schoolName.text
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileOfSchoolVC") as? ProfileOfSchoolVC
        
        vc!.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc!, animated: true)
            }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}


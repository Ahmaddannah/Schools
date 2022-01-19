//
//  SchoolsVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase

class SchoolsTableViewVC : UIViewController {
    
    let db = Firestore.firestore()
    
    var arraySchool : [School] = []
    
    @IBOutlet weak var tableViewOfSchools: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        tableViewOfSchools.dataSource = self
        tableViewOfSchools.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        arraySchool.removeAll()
        getDataFromFireBase()
        tableViewOfSchools.reloadData()
    }
    
    
}// end of the class



extension SchoolsTableViewVC : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arraySchool.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewOfSchools.dequeueReusableCell(withIdentifier: "cellOfSchool", for: indexPath) as! SchoolsTableViewCell
        
        cell.schoolName.text = arraySchool[indexPath.row].schoolName
        cell.schoolTypeLabel.text = arraySchool[indexPath.row].schoolType
        cell.schoolStageLabel.text =  arraySchool[indexPath.row].schoolStage
        
        cell.schoolTypeView.backgroundColor = #colorLiteral(red: 0, green: 0.485999465, blue: 0.4348026514, alpha: 1)
        cell.schoolStageView.backgroundColor = #colorLiteral(red: 0.2662078142, green: 0.6913960576, blue: 0.7334350944, alpha: 1)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileOfSchoolVC") as? ProfileOfSchoolVC
        vc?.schoolObject = arraySchool[indexPath.row]
        vc!.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}//end of the extension for the class (( TableView ))






extension SchoolsTableViewVC {
    
    func hideKeyboardWhenTappedAround() {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    func getDataFromFireBase(){
        
        db.collection("School").getDocuments { querySnapshot, error in
            if error == nil {
                
                querySnapshot?.documents.forEach({ QueryDocumentSnapshot in
                    
                    let schoolName : String = (QueryDocumentSnapshot.get("schoolName") as? String)!
                    
                    let schoolType : String = (QueryDocumentSnapshot.get("schoolType") as? String)!
                    
                    let schoolStage : String = (QueryDocumentSnapshot.get("schoolStage") as? String)!
                    
                    let schoolCategory : String = (QueryDocumentSnapshot.get("schoolCategory") as? String)!
                    
                    let schoolStatus : String =  (QueryDocumentSnapshot.get("schoolStatus") as? String)!
                    
                    let schoolCapacity : String =
                    (QueryDocumentSnapshot.get("schoolCapacity") as! String?)!
                    
                    let schoolMaximum : String =
                    (QueryDocumentSnapshot.get("schoolMaximumNum") as? String)!
                    
                    let schoolPhone : String = QueryDocumentSnapshot.get("schoolPhone") as! String
                    
                    let schoolLocation : String =  QueryDocumentSnapshot.get("schoolLocation") as! String
                    
                    let schoolEmail : String =  QueryDocumentSnapshot.get("schoolEmail") as! String
                    
                    let schoolPassword : String = QueryDocumentSnapshot.get("schoolPassword")as! String
                    
                    let id : String = QueryDocumentSnapshot.get("id") as! String
                    
                    self.arraySchool.append(School(id: id , schoolName: schoolName, schoolPhone: schoolPhone, schoolEmail: schoolEmail, schoolCapacity: schoolCapacity, schoolCategory: schoolCategory, schoolLocation: schoolLocation, schoolMaximumNum: schoolMaximum, schoolPassword: schoolPassword, schoolStage: schoolStage, schoolStatus: schoolStatus, schoolType: schoolType))
                    
                    self.tableViewOfSchools.reloadData()
                })
                
                
            }else{
                
                print(error!.localizedDescription)
                
            }
        }
    }
    
}

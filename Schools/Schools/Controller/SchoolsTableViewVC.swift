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
    
    var arraySchool : [School] = []
    
    @IBOutlet weak var tableViewOfSchools: UITableView!
    
    var selectedCat : String = "ahmad1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedCat)
        hideKeyboardWhenTappedAround()
        
        tableViewOfSchools.dataSource = self
        tableViewOfSchools.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        arraySchool.removeAll()
        getDataFromFireBase()
        tableViewOfSchools.reloadData()
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
                    
                    self.arraySchool.append(School(schoolName: schoolName, schoolPhone: schoolPhone, schoolEmail: schoolEmail, schoolCapacity: schoolCapacity, schoolCategory: schoolCategory, schoolLocation: schoolLocation, schoolMaximumNum: schoolMaximum, schoolPassword: schoolPassword, schoolStage: schoolStage, schoolStatus: schoolStatus, schoolType: schoolType))
                    
                    self.tableViewOfSchools.reloadData()
                })
                
            }else{
                
                print(error!.localizedDescription)
                
            }
        }
    }
    
    
    
    
    
}// end of the class

extension SchoolsTableViewVC : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arraySchool.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewOfSchools.dequeueReusableCell(withIdentifier: "cellOfSchool", for: indexPath) as! SchoolsTableViewCell
        
        cell.schoolName.text = arraySchool[indexPath.row].schoolName
        
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
    
}


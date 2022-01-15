//
//  SchoolsVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase

class SchoolsTableViewVC: UIViewController , UISearchBarDelegate {
    
    let db = Firestore.firestore()
    
    var arraySchool : [School] = []
    //    var arraySchoolString : [String]?
    //    var filteredData: [String]!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableViewOfSchools: UITableView!
    
    var selectedCat : String = "ahmad1"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(selectedCat)
        hideKeyboardWhenTappedAround()
        
        searchBar.delegate = self
        tableViewOfSchools.dataSource = self
        tableViewOfSchools.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        arraySchool.removeAll()
        getDataFromFireBase()
        tableViewOfSchools.reloadData()
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
                    
                    //                    self.appendShoolsName()
                    
                    self.tableViewOfSchools.reloadData()
                })
                
                //                self.appendShoolsName()
                
                
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
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //
    //        appendShoolsName()
    //        print(searchText)
    //        let filterd = arraySchoolString?.filter({ schoolString in
    //
    //            schoolString.contains(searchText)
    //
    //
    //        })
    //        print("Filtered : " )
    //
    //        if (filterd?.count == 0 ) {
    //            appendShoolsName()
    //        }else{
    //            arraySchoolString = filterd
    //
    //        }
    //        tableViewOfSchools.reloadData()
    //
    //    }
    //
    //
    //
    //    func appendShoolsName(){
    //
    //        arraySchoolString = arraySchool.map { $0.schoolName }
    //        //    tableViewOfSchools.reloadData()
    //        print("Array : " , arraySchoolString)
    //
    //    }
    
    
}


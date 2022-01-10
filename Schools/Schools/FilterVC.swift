//
//  FilterVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase

class FilterVC: UIViewController {
    
        let db = Firestore.firestore()

    @IBOutlet weak var schoolTypeSegment: UISegmentedControl!
    @IBOutlet weak var schoolStageSegment: UISegmentedControl!
    @IBOutlet weak var schoolGenderSegment: UISegmentedControl!
    
    @IBOutlet weak var applyButtonOutlet: UIButton!
    
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        schoolTypeSegment.selectedSegmentIndex = 3
        schoolStageSegment.selectedSegmentIndex = 4
        schoolGenderSegment.selectedSegmentIndex = 1
        
        applyButtonOutlet.layer.cornerRadius = 10
        cancelButtonOutlet.layer.cornerRadius = 10
    }
    
    @IBAction func applyFilterButton(_ sender: Any) {
        
//        var home = SchoolsTableViewVC()
        
//        home.selectedCat = "ahmad"
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        

        navigationController?.popViewController(animated: true)
        
    }
    
    
}//end of class

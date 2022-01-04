//
//  SchoolsVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit

class SchoolsVC: UIViewController {
    var arr : [Int] = [1,2,3,4,5,6,7,8,9]
    
    
    @IBOutlet weak var tableViewOfSchools: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewOfSchools.dataSource = self
        tableViewOfSchools.delegate = self
    }
    

    @IBAction func filterButton(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "FilterVC") as? FilterVC
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}// end of the class

extension SchoolsVC : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewOfSchools.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileOfSchool") as? ProfileOfSchool
        
        vc!.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc!, animated: true)
            }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


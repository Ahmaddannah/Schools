//
//  ChatVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 18/01/2022.
//

import UIKit
import Firebase

class CommentVC: UIViewController {
    
    let db = Firestore.firestore()
    
    var arrComment : [Comment] = []
    
    var takeID : String? = nil
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
        
        listener()
        
        hideKeyboardWhenTappedAround()
        
    }
    
    
    @IBAction func sendCommentButton(_ sender: Any) {
        
        if Auth.auth().currentUser?.uid != nil {
            
            sendMessage()
            commentTextField.text = nil
            tableView.reloadData()
        }else{
            
            myCustomAlert(title: "تنبيه", message: "قم بتسجيل الدخول لأضافة تعليق", isAdd: true)
        }
    }
}

extension CommentVC {
    
    func listener(){
        
                                                 // order(by:"time").
        db.collection("Message").whereField("id", isEqualTo: takeID).addSnapshotListener { documentSnapshot , error in
            
            guard documentSnapshot != nil else {
                print("Error fetching document: \(error!)")
                return
            }
            
            
            self.arrComment.removeAll()
            
            for item in documentSnapshot!.documents {
                
                let data = item.data()
                let message = data["content"] as! String
                
                self.arrComment.append(Comment(message: message))
                
            }
            
            self.tableView.reloadData()
        }
    }
    
    
    func sendMessage(){
        
        
        db.collection("Message").document().setData([
            
            "id" : takeID ,
            "content" : commentTextField.text! ,
            "time" :  Timestamp()
        ])
        
        tableView.reloadData()
    }
    
    
    func myCustomAlert(title :String , message : String , isAdd: Bool) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if isAdd{
            
            let action = UIAlertAction(title: "نعم", style: .default) { action in
                
            }
            alert.addAction(action)
        }
        
        self.present(alert, animated: true, completion: nil)
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



extension CommentVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrComment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CommentTableViewCell
        
        cell.massageLabel.text = arrComment[indexPath.row].message
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

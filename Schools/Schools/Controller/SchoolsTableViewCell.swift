//
//  SchoolsTableViewCell.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase

class SchoolsTableViewCell: UITableViewCell {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var schoolCellView: UIView!
    @IBOutlet weak var schoolImage: UIImageView!
    @IBOutlet weak var schoolName: UILabel!
    @IBOutlet weak var schoolTypeView: UIView!
    @IBOutlet weak var schoolTypeLabel: UILabel!
    @IBOutlet weak var schoolStageView: UIView!
    @IBOutlet weak var schoolStageLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        schoolCellView.layer.cornerRadius = 15
        schoolTypeView.layer.cornerRadius = 10
        schoolStageView.layer.cornerRadius = 10
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}


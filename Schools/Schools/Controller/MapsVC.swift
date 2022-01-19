//
//  MapsVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase
import MapKit

class MapsVC: UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

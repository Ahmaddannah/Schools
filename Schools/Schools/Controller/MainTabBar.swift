//
//  TabBar.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit
import Firebase

class MainTabBar: UITabBarController , UITabBarControllerDelegate {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var mainTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    //    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    //
    //        if viewController is ProfileNavigation {
    //
    //            if Auth.auth().currentUser?.uid == nil {
    //
    //                let login = storyboard?.instantiateViewController(withIdentifier: "loginNavigationController") as! LoginNavigationController
    //
    //                login.modalPresentationStyle = .fullScreen
    //
}

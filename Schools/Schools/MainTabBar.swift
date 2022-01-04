//
//  TabBar.swift
//  Schools
//
//  Created by Ahmad MacBook on 04/01/2022.
//

import UIKit

class MainTabBar: UITabBarController , UITabBarControllerDelegate {
    
    @IBOutlet weak var mainTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        if viewController is profileNavigation {
            
            let login = storyboard?.instantiateViewController(withIdentifier: "loginNavigationController") as! loginNavigationController
            
//            login.modalPresentationStyle = .fullScreen
            
            self.present(login, animated: true, completion: nil)
            
        }else {
            
        }
        
    }
}

//
//  WebMapVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 15/01/2022.
//

import UIKit
import WebKit
class WebMapVC: UIViewController {

    @IBOutlet weak var web: WKWebView!
    
    var url : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlReq = URL(string: url!)
        
        let req = URLRequest(url: urlReq!)
        web.load(req)
        
    }

}

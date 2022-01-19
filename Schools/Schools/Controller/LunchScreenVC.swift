//
//  LunchScreenVC.swift
//  Schools
//
//  Created by Ahmad MacBook on 19/01/2022.
//

import UIKit
import Lottie

class LunchScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAnimation()

    }
    
    func configureAnimation() {
        
          let animation = Animation.named("lf30_editor_zxri9fxa")
          let animationView = AnimationView(animation:animation)
          animationView.contentMode = .scaleAspectFill
          animationView.frame = CGRect(x: 0, y: 70, width: 400, height: 400)
          animationView.center = view.center
          view.addSubview(animationView)
          animationView.play()
          animationView.loopMode = .loop
          animationView.animationSpeed = 1
          DispatchQueue.main.asyncAfter(deadline: .now()+3, execute:{
              self.performSegue(withIdentifier: "move", sender: self)
          })
      }
}


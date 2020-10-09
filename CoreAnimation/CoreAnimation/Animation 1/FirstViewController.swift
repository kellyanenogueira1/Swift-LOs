//
//  FirstViewController.swift
//  CoreAnimation
//
//  Created by Kellyane Nogueira on 09/10/20.
//

import UIKit
import ViewAnimator

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myView = UIView(frame: CGRect(x:0, y:0, width: 200, height: 200))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemPurple
        
        myView.animate(animations: [AnimationType.rotate(angle: .pi/5)], delay: 2, duration: 3)
    }
    
}

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let myView = UIView(frame: CGRect(x:0, y:0, width: 200, height: 200))
        myView.center = view.center
        view.addSubview(myView)
        myView.backgroundColor = .systemPurple
        
        myView.animate(animations: [AnimationType.zoom(scale: 4)], delay: 2, duration: 3)
    }
    
}

//
//  AnimationViewController.swift
//  CoreAnimation
//
//  Created by Kellyane Nogueira on 09/10/20.
//

import UIKit

class AnimationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var passwordTextfield: ShakingTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextfield.delegate = self
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        passwordTextfield.shake()

    }
    
    override func didReceiveMemoryWarning() {
            
    }
}

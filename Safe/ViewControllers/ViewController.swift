//
//  ViewController.swift
//  Safe
//
//  Created by Yasser Farahi.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTopLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var autoLoginSwitch: UISwitch!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var verticalStackConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Setup the corner radius for login button
        passwordContainerView.layer.cornerRadius = 15
        passwordContainerView.clipsToBounds = true
        
        
    }
    

    //MARK: Handeling appp events when user interacts with the login button
    @IBAction func aButtonWasTapped( sender: (UIButton) ) {
        
        switch sender.tag {
        case 0 :
            print("This is the log in button")
            
        case 1:
            print("This is the Auto login switch controller")
        
        default: break
        }
        
    }
    
}


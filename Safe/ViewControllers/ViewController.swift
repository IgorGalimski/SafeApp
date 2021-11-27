//
//  ViewController.swift
//  Safe
//
//  Created by Yasser Farahi.
//

import UIKit

class ViewController: UIViewController, AutoLoginProtocol, UITextFieldDelegate
{
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTopLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var autoLoginSwitch: UISwitch!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var verticalStackConstraint: NSLayoutConstraint!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //MARK: Setup the corner radius for login button
        passwordContainerView.layer.cornerRadius = 15
        passwordContainerView.clipsToBounds = true
        
        logInButton.layer.cornerRadius = 15
        logInButton.clipsToBounds = true
        
        SetupElementsState()
        
        passwordField.delegate = self
    }
    
    private func SetupElementsState()
    {
        if(UserDefaultsService.Instance.isPasswordSet)
        {
            autoLoginSwitch.isOn = UserDefaultsService.Instance.autoLogin
            
            if(UserDefaultsService.Instance.autoLogin)
            {
                passwordField.text = UserDefaultsService.Instance.password
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                    [weak self] in
                    
                    self?.performSegue(withIdentifier: "GoToSafe", sender: nil)
                }
            }
            else
            {
                passwordField.text = ""
                passwordTopLabel.text = "Enter a password"
            }
        }
        else
        {
            passwordTopLabel.text = "Choose a password"
        }
    }
    
    private func HandlePassword()
    {
        if(UserDefaultsService.Instance.isPasswordSet)
        {
            if(!passwordField.text!.isEmpty)
            {
                if(passwordField.text! == UserDefaultsService.Instance.password)
                {
                    performSegue(withIdentifier: "GoToSafe", sender: nil)
                }
                else
                {
                    passwordTopLabel.text = "Wrong password!"
                }
            }
        }
        else
        {
            if(!passwordField.text!.isEmpty)
            {
                UserDefaultsService.Instance.password = passwordField.text!
                UserDefaultsService.Instance.isPasswordSet = true
                
                performSegue(withIdentifier: "GoToSafe", sender: nil)
            }
        }
    }
    
    func enableAutoLogin(value: Bool)
    {
        UserDefaultsService.Instance.autoLogin = value
        autoLoginSwitch.isOn = value
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "GoToSafe"
        {
            let destination = segue.destination as! SafeViewController
            destination.delegate = self
            destination.autoLoginState = autoLoginSwitch.isOn
        }
    }

    @IBAction func aButtonWasTapped( sender: (UIButton) )
    {
        switch sender.tag
        {
            case 0 :
                HandlePassword()
                
            case 1:
                UserDefaultsService.Instance.autoLogin = self.autoLoginSwitch.isOn
            
            default: break
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        HandlePassword()
        
        return true
    }
}


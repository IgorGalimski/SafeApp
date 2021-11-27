//
//  SafeViewController.swift
//  Safe
//
//  Created by Yasser Farahi.
//

import UIKit

class SafeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var safeTableView: UITableView!
    @IBOutlet weak var autoLoginSwitch: UISwitch!
    
    var autoLoginState: Bool = false
    
    var delegate: AutoLoginProtocol?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        safeTableView.dataSource = self
        safeTableView.delegate = self
        safeTableView.register(UINib(nibName: "CustomCell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
        
        UITableView.appearance().backgroundColor = .clear
        
        autoLoginSwitch.isOn = autoLoginState
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return sensetiveData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        let currentUser = sensetiveData[indexPath.row]
        
        cell.userNameLabel.text! += currentUser.userName
        cell.passwordLabel.text! += currentUser.password
        cell.siteLabel.text! += currentUser.siteName
        
        return cell
    }
    
    @IBAction func switchWasToggled(_ sender: Any)
    {
        autoLoginState = !autoLoginState
        autoLoginSwitch.isOn = autoLoginState
        
        delegate?.enableAutoLogin(value: autoLoginState)
    }
}

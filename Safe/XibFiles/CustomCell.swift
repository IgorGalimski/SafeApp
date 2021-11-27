//
//  CustomCell.swift
//  Safe
//
//  Created by IgorGalimski on 27/11/2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var siteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        userNameLabel.text = "Username: "
        passwordLabel.text = "Password: "
        siteLabel.text = "Site: "
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

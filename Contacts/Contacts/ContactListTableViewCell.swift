//
//  ContactListTableViewCell.swift
//  Contacts
//
//  Created by Britney Smith on 9/8/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//


import UIKit

class ContactListTableViewCell: UITableViewCell {

    @IBOutlet weak var contactNameListLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // contactNameListLabel.text = "Test" // works!
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

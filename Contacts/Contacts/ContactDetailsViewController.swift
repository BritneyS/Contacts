//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created by Britney Smith on 9/8/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

import UIKit

protocol ContactDetailsViewControllerDelegate: class {
    
    func contactDetailsViewControllerDidCancel(_ controller: ContactDetailsViewController)
    
    func contactDetailsViewController(_ controller: ContactDetailsViewController, didShow item: Contact)
}

class ContactDetailsViewController: UIViewController {

    @IBOutlet weak var contactNameLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    weak var delegate: ContactDetailsViewControllerDelegate?
    
    var contactName: String? = ""
    var phoneNumber: String? = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        showContact()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showContact() {
        contactNameLabel.text = self.contactName
        phoneNumberLabel.text = self.phoneNumber
    }
    
    //    func showContact() {
    //        let contact = Contact(name: contactNames.name, phoneNumber: contactNames.phoneNumber)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

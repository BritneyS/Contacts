//
//  ContactListTableViewController.swift
//  Contacts
//
//  Created by Britney Smith on 9/6/18.
//  Copyright © 2018 Britney Smith. All rights reserved.
//

/*
 Build an iOS app that stores and manages a contact list
 Your app should utilize Model-View-Controller architecture
 On the main page, your app should list each contact’s name in a table view
 The user should be able to swipe to delete items
 Your app should have a button which allows the user to add contacts to the list
 When the user clicks on a name in the table view, they should be taken to a detail page that displays the contact’s name and phone number
 BONUS: Give the user the ability to edit contact details
 */


import UIKit




class ContactListTableViewController: UITableViewController, ContactDetailsViewControllerDelegate, AddContactTableViewControllerDelegate {
    
    
    
    
    // implements ContactDetails protocol
    func contactDetailsViewControllerDidCancel(_ controller: ContactDetailsViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func contactDetailsViewController(_ controller: ContactDetailsViewController, didShow item: Contact) {
        
    }
    
    // implements AddContact protocol
    func addContactTableViewControllerDidCancel(_ controller: AddContactTableViewController) {
        navigationController?.popViewController(animated: true)
    }

   

    
    
    var contactNames: [Contact] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Start")
        populateContactNames()
        navigationController?.navigationBar.prefersLargeTitles = true //large titles
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }

    // MARK: - Table view data source

    func populateContactNames() {
        let contactList = ContactList()
        for contact in contactList.contacts {
            let newContact = Contact(name: contact.name, phoneNumber: contact.phoneNumber)
            contactNames.append(newContact)
        }
        print(contactNames)
        
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contactNameCellID = ElementIdentity.contactName.rawValue
        let cell = tableView.dequeueReusableCell(withIdentifier: contactNameCellID, for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = "\(contactNames[indexPath.row].name)"
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            swipeToDelete(indexPath: indexPath)
        }
    }
    
    func swipeToDelete(indexPath: IndexPath) {
        contactNames.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addContact = SegueIdentity.addContact.rawValue
        let contactDetails = SegueIdentity.contactDetails.rawValue
        if segue.identifier == contactDetails {
            //segue to contact details page
            let controller = segue.destination as! ContactDetailsViewController //as : casting object (downcasting), can be nil
            controller.delegate = self //self as delegate
//            controller.contactNameLabel.text = "\(contactNames[indexPath.row].name)"
            
            
        } else if segue.identifier == addContact {
            //segue to add item page
        }
    

    }
}

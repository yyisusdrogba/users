//
//  RegisterViewController.swift
//  User_List
//
//  Created by Jesus Gonzalez on 26/10/23.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    @IBOutlet weak var tf_userName: UITextField!
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_phone: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    @IBOutlet weak var tf_passwordRepeat: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Register")
    }

    @IBAction func btn_register(_ sender: UIButton) {
        
        if tf_email.text == "" || tf_userName.text == "" || tf_phone.text == ""{
            print("Te faltan llenar campos")
        }else if   tf_password.text != tf_passwordRepeat.text{
            print("The password not are similars")
        }else{
            let manageObjectContext = CoreDataManager.shared.persistenceContainer.viewContext
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: manageObjectContext) as! User
            
            newUser.userName = tf_userName.text
            newUser.email = tf_email.text
            newUser.phone = tf_phone.text
            newUser.password = tf_password.text
            
            CoreDataManager.shared.saveContext()
            
            dismiss(animated: true)
        }
    }
    
}

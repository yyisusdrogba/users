//
//  LoginViewController.swift
//  User_List
//
//  Created by Jesus Gonzalez on 26/10/23.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {
    @IBOutlet weak var tf_email: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    let context = CoreDataManager.shared.persistenceContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Login")
    }
    
    @IBAction func btn_login(_ sender: UIButton) {
        guard let email = tf_email.text, let password = tf_password.text else {return}
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)
        
        do{
            let user = try context.fetch(fetchRequest)
            if let user = user.first{
                print("El nombre de el usuario es: \(user.userName ?? "sin nombre") Su email es:\(user.email ?? "sin nombre") El telefono es: \(user.phone!) las contraseña es: \(user.password!)")
                performSegue(withIdentifier: "users", sender: nil)
                
            }else{
                print("Credenciales incorrectas")
            }
        }catch{
            print(error)
        }
        
    }
    
    @IBAction func proubeButton(_ sender: UIButton) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            // 3. Ejecuta la solicitud para recuperar los registros
            let usuarios = try context.fetch(fetchRequest) as! [NSManagedObject]

            // 4. Itera a través de los registros y muestra los datos
            for usuario in usuarios {
                if let email = usuario.value(forKey: "email") as? String,
                   let contraseña = usuario.value(forKey: "password") as? String {
                    print("Email: \(email), Contraseña: \(contraseña)")
                }
            }
        } catch {
            print("Error al recuperar los datos de CoreData: \(error)")
        }

    }
    
}

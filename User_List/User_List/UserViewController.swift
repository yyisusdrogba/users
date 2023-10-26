//
//  UserViewController.swift
//  User_List
//
//  Created by Jesus Gonzalez on 26/10/23.
//

import UIKit
import CoreData

class UserViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    @IBOutlet weak var tableView: UITableView!
    let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
    var searchResult: Array<User> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("User view")
        do{
            searchResult = try getContext().fetch(fetchRequest)
            
        }catch{
            print("Error al traer la data")
        }
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if searchResult.count > 0 {
            let name = searchResult[indexPath.row].userName
            let email = searchResult[indexPath.row].email
            
            if name != nil{
                cell.textLabel?.text = name
                cell.detailTextLabel?.text = email
            }else{
                cell.textLabel?.text = "Error in DB name"
                cell.detailTextLabel?.text = "Error DB email"
            }
        }
        
        return cell
    }
    
    private func getContext() -> NSManagedObjectContext{
        return CoreDataManager.shared.persistenceContainer.viewContext
    }
    
    
}

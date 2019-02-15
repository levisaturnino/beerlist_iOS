//
//  TableViewController.swift
//  projeto
//
//  Created by aluno on 10/01/19.
//  Copyright © 2019 cesar. All rights reserved.
//

import UIKit

class BeerListTableViewController: UITableViewController {
    
    @IBOutlet var addButton: UIBarButtonItem!
    
    @IBOutlet weak var itemMap: UIBarButtonItem!
    var beers: Array<Beer> = []
    
    var usuario: String?
    
    @IBAction func itemButtonAbout(_ sender: Any) {
        
        let controller = AboutViewController()
        
        if let navigator = navigationController {
            navigator.pushViewController(controller, animated: true)
        }
    }
    
    @IBAction func itemButtonMap(_ sender: Any) {
        
        var controller =  MapKitViewController()
        
        if let navigator = navigationController {
            navigator.pushViewController(controller, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backItem?.title = "Login"
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "List in Beers"
        
        if(usuario == "admin"){
            showNavigationButton()
        }else if(usuario == "levi"){
            hideNavigationButton()
        }
        
    }
    
    func hideNavigationButton() {
        addButton?.isEnabled = false
        addButton?.tintColor = UIColor.clear
    }
    
    func showNavigationButton() {
        addButton?.isEnabled = true
        addButton?.tintColor = UIColor.red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Defaults.saveListBeer(Database.shared.list())
        
      //  self.beers = Defaults.
        tableView.reloadData()
    }

    @IBAction func itemAdd(_ sender: Any) {
        
        var controller: InsertViewController
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "insertViewID") as! InsertViewController
        
        if let navigator = navigationController {
            navigator.pushViewController(controller, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let linha = (indexPath as NSIndexPath).row

        if editingStyle == UITableViewCell.EditingStyle.delete {
            Database.shared.delete(add: self.beers[ linha])
            beers.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CervejaCell", for: indexPath)

        let row = (indexPath as NSIndexPath).row
    
        let beer = self.beers[row]
    
        cell.textLabel?.text = "Name: \(beer.name)           Price: R$ \(beer.price)"

        return cell
    }
    
}

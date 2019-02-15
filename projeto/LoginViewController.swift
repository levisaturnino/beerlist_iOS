//
//  ViewController.swift
//  projeto
//
//  Created by aluno on 10/01/19.
//  Copyright © 2019 cesar. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var senhaText: UITextField!
    
    @IBOutlet weak var loginText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Name's Beer"
        
    }
        
    
    @IBAction func entrarTableView(_ sender: Any) {
        
        var controller: BeerListTableViewController
        
        controller = self.storyboard?.instantiateViewController(withIdentifier: "tableViewID") as! BeerListTableViewController
        
        controller.usuario = loginText.text
        
        if(loginText.text == "levi" && senhaText.text == "123"){
            
            if let navigator = navigationController {
                loginText.text = ""
                senhaText.text = ""
                navigator.pushViewController(controller, animated: true)
            }
            
            }else if(loginText.text == "admin" && senhaText.text == "123"){
                if let navigator = navigationController {
                    loginText.text = ""
                    senhaText.text = ""
                    navigator.pushViewController(controller, animated: true)
                }
            
            }else{
                let alertController = UIAlertController(title: "Alert", message:"Login ou Senha, incorrentos!", preferredStyle: UIAlertController.Style.alert)
            
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: { (alertController) -> Void in
                }))
            
           
            
            present(alertController, animated: true, completion: nil)
        }
      
    }

}


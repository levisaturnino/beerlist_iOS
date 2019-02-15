//
//  InsertViewController.swift
//  projeto
//
//  Created by aluno on 10/01/19.
//  Copyright © 2019 cesar. All rights reserved.
//

import UIKit


class InsertViewController: UIViewController {

    @IBOutlet var insertTextField: UITextField!
    
    @IBOutlet var priceTextField: UITextField!
    
    @IBAction func insertButtonAction(_ sender: Any) {
        
        
        let beer = Beer(name: insertTextField.text ?? "",price: priceTextField.text ?? "")
        
        Database.shared.insert(add: beer)
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)

    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Input Name Beer e Price"
        
    }

}

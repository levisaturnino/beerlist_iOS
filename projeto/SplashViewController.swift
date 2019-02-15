//
//  SplashViewController.swift
//  projeto
//
//  Created by iMac Mobilicidade on 14/02/2019.
//  Copyright © 2019 cesar. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
   
            let isFlow = Defaults.getFlow()
            
            if( isFlow == false){
      
                self.performSegue(withIdentifier: "collection", sender: nil)
           
            }else{
                self.performSegue(withIdentifier: "beerList", sender: nil)
                
            }
        }
    }
    
}

//
//  CollectionViewController.swift
//  projeto
//
//  Created by iMac Mobilicidade on 13/02/2019.
//  Copyright © 2019 cesar. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {

    @IBOutlet var proCollectionView: UICollectionView!
    
    private let reuseIdentifier = "proCell"
    
    var arrayTitles = ["Here you list your beer price",
                       "Call your friends and tell them you bought the beer!",
                       "On the maps you locate the sales sites",
                       "Let's register the drinks?" ]
    
    var arrayImages = ["beers.jpg", "beer_friends.jpg", "maps.jpg", "beer.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        proCollectionView.dataSource = self
        proCollectionView.delegate = self
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        AppUtility.lockOrientation(.portrait)
        // Or to rotate and lock
        // AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return arrayTitles.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "proCell", for: indexPath) as? CollectionViewCell
        
        let number = indexPath.row
        
        if((arrayTitles.count - 1) == number){
            cell?.btnfinish.isHidden = false
            cell?.btnfinish.addTarget(self, action: #selector(CollectionViewController.actionButtonFinish(_:)), for: .touchUpInside)

        }else{
            cell?.btnfinish.isHidden = true
            
        }
        
        cell?.lbTitle.text = arrayTitles[number]
        cell?.imageView.image = UIImage(named:arrayImages[number])
        return cell!
    }
    
    
    @objc func actionButtonFinish(_ sender: Any) {
        
        Defaults.saveFlow(true)
        
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "tableViewID") as? BeerListTableViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

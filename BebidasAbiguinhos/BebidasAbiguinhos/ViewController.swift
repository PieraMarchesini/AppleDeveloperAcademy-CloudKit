//
//  ViewController.swift
//  BebidasAbiguinhos
//
//  Created by Piera Marchesini on 04/10/17.
//  Copyright © 2017 Piera Marchesini. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let drink = Drink(nome: "Giovanni2", categoria: .beer, foto: UIImage(named: "tequila")!)!
        let manager: CKDrinkManager = CKDrinkManager.shared
//        manager.save(drink: drink, type: .privateDB)
        manager.fetchAllDrinks(type: .publicDB, callback: { (drinks, error) in
            drinks?.forEach({ (drink) in
                print(drink.string())
            })
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


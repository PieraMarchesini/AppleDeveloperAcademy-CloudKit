//
//  BeveragesTableViewController.swift
//  BebidasAbiguinhos
//
//  Created by Piera Marchesini on 04/10/17.
//  Copyright © 2017 Piera Marchesini. All rights reserved.
//

import UIKit

class BeveragesTableViewController: UITableViewController {

    var drinks = [Drink]()
    var dc: DC?
    var filteredDrinks = [Drink]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let dc = dc else {return}
        filteredDrinks = drinks.filter({ (drink) -> Bool in
            return drink.categoria == dc
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDrinks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let drink = filteredDrinks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeveragesTableViewCell

        do {
            try cell.drinkImageView.image = UIImage(data: Data(contentsOf: drink.foto.fileURL))
        }catch{
            print("Erro ao carregar fotenha")
            cell.drinkImageView.image = Drink.defaultImage()
        }

        cell.nameLabel.text = drink.nome
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: filteredDrinks[indexPath.row])
    }

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let detailView = segue.destination as? BeverageDetailViewController {
                if let beverage = sender as? Drink {
                    detailView.beverage = beverage
                }
            }
        }
    }

}

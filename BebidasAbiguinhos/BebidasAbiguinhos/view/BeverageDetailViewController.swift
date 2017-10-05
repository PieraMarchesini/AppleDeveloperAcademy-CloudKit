//
//  BeverageDetailViewController.swift
//  BebidasAbiguinhos
//
//  Created by Piera Marchesini on 04/10/17.
//  Copyright © 2017 Piera Marchesini. All rights reserved.
//

import UIKit
import CloudKit

class BeverageDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var beverageImage: UIImageView?
    @IBOutlet weak var beverageNameLabel: UILabel?
    @IBOutlet weak var beverageCategoryLabel: UILabel?
    
    //MARK: - Atributes
    var beverage: Drink?
    
    //MARK: - ViewController life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if beverage != nil {
            if let imageURL = beverage?.foto.fileURL {
                do {
                    try beverageImage?.image = UIImage(data: Data(contentsOf: imageURL))
                }catch{
                    print("Erro ao carregar fotenha")
                    beverageImage?.image = Drink.defaultImage()
                }
            }
            if let name = beverage?.nome {
                beverageNameLabel?.text = name
            }
            if let category = beverage?.categoria.description {
                beverageCategoryLabel?.text = category
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Action
    @IBAction func shareBeverage(_ sender: Any) {
        let share = CKShare(rootRecord: CKRecord(recordType: "Drink"))
        share[CKShareTitleKey] = "Share test" as CKRecordValue
        share.publicPermission = .readOnly
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

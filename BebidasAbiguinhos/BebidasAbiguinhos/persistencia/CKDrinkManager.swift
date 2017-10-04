//
//  CloudKitManager.swift
//  BebidasAbiguinhos
//
//  Created by Giovanni Bruno on 04/10/17.
//  Copyright © 2017 Piera Marchesini. All rights reserved.
//

import Foundation
import CloudKit


enum DBType: Int {
    case publicDB = 0, privateDB
}

class CKDrinkManager {
    static let shared = CKDrinkManager()
    
    // Represents the default container specified in the iCloud section of the Capabilities tab for the project.
    private let container: CKContainer
    private let publicDB: CKDatabase
    private let privateDB: CKDatabase
    
    private static let DrinkType = "Drink"
    
    // MARK: - Initializers
    init() {
        container = CKContainer.default()
        publicDB = container.publicCloudDatabase
        privateDB = container.privateCloudDatabase
    }
    
    func save(drink: Drink, type: DBType){
        let record = CKRecord(recordType: CKDrinkManager.DrinkType)
        record[.nome] = drink.nome
        record[.categoria] = drink.categoria.rawValue
        record[.foto] = drink.foto
        
        ckDBFrom(type: type).save(record) { (record, error) in
            guard error == nil else {
                print("Problema ao tentar salvar o registro")
                return
            }
            
            print("Registro salvo com sucesso")
        }
    }
    
    func fetchAllDrinks(type: DBType,callback: @escaping ([Drink]?, Error?)->Void) {
        
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: CKDrinkManager.DrinkType, predicate: predicate)
        
        ckDBFrom(type: type).perform(query, inZoneWith: nil) { (records, error) in
            guard error == nil else {
                callback(nil, error)
                return
            }
            
            guard let drinkRecords = records else {
                let e = NSError(domain: "", code: 500, userInfo: nil)
                callback(nil, e)
                return
            }
            
            let drinks = drinkRecords.map({ (record) -> Drink in
                let nome = record.value(forKey: DrinkKey.nome.rawValue) as? String ?? ""
                let cat = DC(rawValue: record.value(forKey: DrinkKey.categoria.rawValue) as? String ?? "") ?? DC.beer
                let foto = record.value(forKey: DrinkKey.foto.rawValue) as? CKAsset ?? Drink.defaultCKAsset()!
                
                return Drink(nome: nome, categoria: cat, foto: foto)
            })
            
            callback(drinks, nil)
        }
    }
    
    private func ckDBFrom (type: DBType) -> CKDatabase{
        switch type {
        case .privateDB:
            return privateDB
        case .publicDB:
            return publicDB
        }
    }
    
}

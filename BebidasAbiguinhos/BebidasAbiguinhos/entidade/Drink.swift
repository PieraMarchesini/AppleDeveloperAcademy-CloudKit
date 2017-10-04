//
//  Drink.swift
//  BebidasAbiguinhos
//
//  Created by Giovanni Bruno on 04/10/17.
//  Copyright © 2017 Piera Marchesini. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

typealias DC = DrinkCategoria

enum DrinkCategoria: String {
    case caipirinha
    case beer
    case gin
    case wine
    case drink
    case shot
    case tequila
    case cachaça
    case others
    
    
}

enum DrinkKey: String {
    case nome
    case categoria
    case foto
}

class Drink {
    var nome: String = ""
    var categoria: DC
    var foto: CKAsset
    
    init(nome: String, categoria: DC, foto: CKAsset) {
        self.nome = nome
        self.categoria = categoria
        self.foto = foto
    }
    
    init?(nome: String, categoria: DC, foto: UIImage) {
        self.nome = nome
        self.categoria = categoria
        
        do {
            let tempDirectoryURL = NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
            
            let targetURL = tempDirectoryURL.appendingPathComponent("\(categoria).\(nome).\(arc4random_uniform(5000))")
            
            let image = foto
            let data = UIImagePNGRepresentation(image)
            try data?.write(to: targetURL)
            let asset = CKAsset(fileURL: targetURL)
            
            self.foto = asset
           
        }
        catch {
            print("Error writing data", error)
            return nil
        }
    }
    
    static func defaultCKAsset() -> CKAsset? {
        do {
            let tempDirectoryURL = NSURL.fileURL(withPath: NSTemporaryDirectory(), isDirectory: true)
            
            let targetURL = tempDirectoryURL.appendingPathComponent("x.y.z.w")
            
            let image = UIImage(named: "tequila")
            let data = UIImagePNGRepresentation(image!)
            try data?.write(to: targetURL)
            let asset = CKAsset(fileURL: targetURL)
            
            return asset
        }
        catch {
            print("Error writing data", error)
            return nil
        }
    }
    
    func string() -> String{
        return "\(nome) - \(categoria)"
    }
}

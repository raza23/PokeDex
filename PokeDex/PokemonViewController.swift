//
//  PokemonViewController.swift
//  PokeDex
//
//  Created by Raza Shareef on 5/6/20.
//  Copyright © 2020 raza_s. All rights reserved.
//

//import Foundation
// TESTING TESTING TESTING
import UIKit

class PokemonViewController: UIViewController {
//    let spriteUrl = URL(string: pokemon.sprite)
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
//    @IBOutlet var spriteLabel:UILabel!
    @IBOutlet  var type1: UILabel!
//    @IBOutlet  var type2label: UILabel!
    @IBOutlet var type2: UILabel!
    //    @IBOutlet weak var spriteView: UIImageView!
     
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        type1.text = ""
        type2.text = ""
        
        let url = URL(string: pokemon.url)
        guard let u = url else {
            return
        }
        
        URLSession.shared.dataTask(with: u) {(data,response,error) in
            guard let data = data else {
                return
            }
            do{
                let pokemonData = try JSONDecoder().decode(PokemonData.self, from: data)
                
                DispatchQueue.main.async {
                    
                
                self.nameLabel.text = self.pokemon.name
                self.numberLabel.text = String(format: "#%03d",pokemonData.id)
                
                for typeEntry in pokemonData.types{
                    if typeEntry.slot == 1 {
                        self.type1.text = typeEntry.type.name
                    }
                    else if typeEntry.slot == 2 {
                        self.type2.text = typeEntry.type.name
                    }
                }
                }
            }
            catch let error {
                print("\(error)")
            }
        }.resume()
        
//        nameLabel.text = pokemon.name
//        numberLabel.text = String(pokemon.number)
//        numberLabel.text = String(format: "#%03d",pokemon.number)
        
//       spriteLabel.text = pokemon.sprite
//        downloadImage(with: URL(string: pokemon.sprite)!)
}
//    func downloadImage(with url:URL){
//        URLSession.shared.dataTask(with: url){
//            (data,respone,error) in
//            if error != nil{
//                print(error!)
//                return
//            }
//            DispatchQueue.main.async {
////            self.spriteView.image = UIImage(data: data!)
//
//            }
//        }.resume()
//
//    }
    
}

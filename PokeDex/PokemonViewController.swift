//
//  PokemonViewController.swift
//  PokeDex
//
//  Created by Raza Shareef on 5/6/20.
//  Copyright © 2020 raza_s. All rights reserved.
//

//import Foundation
import UIKit

class PokemonViewController: UIViewController {
//    let spriteUrl = URL(string: pokemon.sprite)
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
//    @IBOutlet var spriteLabel:UILabel!
    @IBOutlet weak var spriteView: UIImageView!
    
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name
//        numberLabel.text = String(pokemon.number)
        numberLabel.text = String(format: "#%03d",pokemon.number)
        
//       spriteLabel.text = pokemon.sprite
        downloadImage(with: URL(string: pokemon.sprite)!)
}
    func downloadImage(with url:URL){
        URLSession.shared.dataTask(with: url){
            (data,respone,error) in
            if error != nil{
                print(error!)
                return
            }
            DispatchQueue.main.async {
            self.spriteView.image = UIImage(data: data!)

            }
        }.resume()
        
    }
    
}

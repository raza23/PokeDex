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

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
//    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
//        guard let url = URL(string: link) else { return }
//        downloaded(from: url, contentMode: mode)
//    }
}

class PokemonViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberLabel: UILabel!
    @IBOutlet  var type1: UILabel!
    @IBOutlet var type2: UILabel!
    @IBOutlet var SpriteView: UIImageView!
     
    
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
                    let urlString = URL(string:pokemonData.sprites.front_default)
//                let url = URL(string: urlString)
                    
                self.nameLabel.text = self.pokemon.name
                self.numberLabel.text = String(format: "#%03d",pokemonData.id)
                self.SpriteView.downloaded(from: urlString!)
                
                
                
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
    }
}
        



//
//  ViewController.swift
//  PokeDex
//
//  Created by Raza Shareef on 5/6/20.
//  Copyright © 2020 raza_s. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let pokemon = [
        Pokemon(name:"Bulbasaur", number:1,sprite: "https://img.pokemondb.net/sprites/black-white/normal/bulbasaur.png"),
        Pokemon(name:"Ivysaur",number:2,sprite:"https://img.pokemondb.net/sprites/black-white/normal/ivysaur.png"),
        Pokemon(name: "Venasaur", number: 3,sprite: "https://img.pokemondb.net/sprites/black-white/normal/venusaur.png")
    ]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)
        cell.textLabel?.text = pokemon[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonSegue" {
            if let destination = segue.destination as? PokemonViewController {
                destination.pokemon = pokemon[tableView.indexPathForSelectedRow!.row]
            }
        }
    }
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }


}


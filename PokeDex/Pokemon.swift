//
//  Pokemon.swift
//  PokeDex
//
//  Created by Raza Shareef on 5/6/20.
//  Copyright © 2020 raza_s. All rights reserved.
// testing new branch

import Foundation

struct PokemonList: Codable {
    let results: [Pokemon]
}

struct Pokemon: Codable {
    let name: String
//    let number: Int
    let url: String
//    let sprite: String
}

struct PokemonData: Codable {
    let id: Int
    let types: [PokemonTypeEntry]
}


struct PokemonType: Codable {
    let name: String
    let url: String
}

struct PokemonTypeEntry: Codable {
    let slot: Int
    let type : PokemonType
}

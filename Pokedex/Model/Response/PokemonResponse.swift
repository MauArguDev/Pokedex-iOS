//
//  PokemonResponse.swift
//  Pokedex
//
//  Created by Mauricio Argumedo on 3/10/22.
//

import ObjectMapper

struct PokemonResponse: Codable, Identifiable {
  let id: Int
  let name: String
  let imageUrl: String
  let description: String
  let type: String
  let height: Int
  let weight: Int
  let attack: Int
  let defense: Int
}

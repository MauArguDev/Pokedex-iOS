//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Mauricio Argumedo on 2/10/22.
//

import SwiftUI
import RxSwift
import Action

class PokemonViewModel: ObservableObject {
  var pokemonService: PokemonServiceProtocol = PokemonService()
  
  @Published var pokemonList = [PokemonResponse]()
  
  init() {
    fetchPokemons.execute()
  }
  
  lazy var fetchPokemons = CocoaAction { _ in
    return self.pokemonService.getPokemons()
      .do( onError: { error -> Void in
        print("Error \(error)")
        return
      }).asObservable()
        .flatMap { response -> Observable<Void> in
          let pokemons = response.compactMap { $0 }
          self.pokemonList = pokemons
          return Observable.empty()
        }
  }
  
  func backgroundColor(forType type: String) -> UIColor {
    switch type {
      case "fight": return .fighting
      case "fire": return .fire
      case "poison": return .poison
      case "water": return .water
      case "electric": return .electric
      case "psychic": return .psychic
      case "normal": return .normal
      case "ground": return .ground
      case "flying": return .flying
      case "fairy": return .fairy
      case "dark": return .dark
      case "grass": return .grass
      case "ice": return .ice
      case "bug": return .bug
      case "rock": return .rock
      case "dragon": return .dragon
      case "steel": return .steel
      case "ghost": return .ghost
      default: return .systemIndigo
    }
  }
}

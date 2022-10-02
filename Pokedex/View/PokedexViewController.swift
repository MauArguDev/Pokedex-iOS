//
//  PokedexViewController.swift
//  Pokedex
//
//  Created by Mauricio Argumedo on 1/10/22.
//

import SwiftUI

struct PokedexViewController: View {
  private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
  @ObservedObject var viewModel = PokemonViewModel()
    var body: some View {
      NavigationView {
        ScrollView {
          LazyVGrid(columns: gridItems, spacing: 20) {
            ForEach(viewModel.pokemon) { pokemon in
              PokemonCell(pokemon: pokemon, viewModel: viewModel)
            }
          }
        }.navigationTitle("Pokedex")
      }
    }
}

struct PokedexViewController_Previews: PreviewProvider {
    static var previews: some View {
        PokedexViewController()
    }
}

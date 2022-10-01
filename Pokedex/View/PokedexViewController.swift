//
//  PokedexViewController.swift
//  Pokedex
//
//  Created by Mauricio Argumedo on 1/10/22.
//

import SwiftUI

struct PokedexViewController: View {
  private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
      NavigationView {
        ScrollView {
          LazyVGrid(columns: gridItems, spacing: 20) {
            ForEach(0..<151) { _ in
              PokemonCell()
            }
          }
        }
      }
    }
}

struct PokedexViewController_Previews: PreviewProvider {
    static var previews: some View {
        PokedexViewController()
    }
}

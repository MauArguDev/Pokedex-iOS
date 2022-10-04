//
//  PokemonService.swift
//  Pokedex
//
//  Created by Mauricio Argumedo on 3/10/22.
//

import Moya
import RxSwift

protocol PokemonServiceProtocol {
  func getPokemons() -> Single<[PokemonResponse?]>
}

final class PokemonService: PokemonServiceProtocol {
  
  let provider: MoyaProvider<NetworkManagerProvider>
  
  init() {
    provider = MoyaProvider<NetworkManagerProvider>(
      plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))]
    )
  }
  
  init?(provider: MoyaProvider<NetworkManagerProvider>) {
    self.provider = provider
  }
  
  func getPokemons() -> Single<[PokemonResponse?]> {
    return provider.rx.request(.getPokemons)
      .filterSuccessfulStatusCodes()
      .map([PokemonResponse?].self)
  }
}

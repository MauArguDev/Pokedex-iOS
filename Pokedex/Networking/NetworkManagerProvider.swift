//
//  NetworkManagerProvider.swift
//  Pokedex
//
//  Created by Mauricio Argumedo on 3/10/22.
//

import Foundation
import Moya

enum NetworkManagerProvider {
  case getPokemons
}

enum NetworkManagerProviderPath {
  static func get(endpoint: NetworkManagerProvider) -> String {
    var endpointStr = ""
    switch endpoint {
    case .getPokemons:
      endpointStr = "pokemon.json"
    }
    return "/\(endpointStr)"
  }
}

extension NetworkManagerProvider {
  func buildURL() -> String {
    return "https://pokedex-bb36f.firebaseio.com"
  }
}

extension NetworkManagerProvider: TargetType {
  
  var baseURL: URL {
    return URL(string: buildURL())!
  }
  
  var path: String {
    return NetworkManagerProviderPath.get(endpoint: self)
  }
  
  var method: Moya.Method {
    switch self {
      case .getPokemons:
        return .get
    }
  }
  
  var sampleData: Data {
    let url: URL?
    switch self {
      case .getPokemons:
        url = Bundle.main.url(forResource: "loginResponse", withExtension: "json")
    }
    do {
      guard let url = url else { return Data() }
      let data = try Data(contentsOf: url)
      return data
    } catch {
      return Data()
    }
  }
  
  var task: Task {
    return .requestPlain
  }
  
  var headers: [String: String]? {
    return [:]
  }
}


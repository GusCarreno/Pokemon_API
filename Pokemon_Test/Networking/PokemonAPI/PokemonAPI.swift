//
//  PokemonAPI.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit
import Combine

final class PokemonAPI: API {
    
    // MARK: Private properties
    private static var pokemonResponse: APIResponse?
    
    // MARK: - Public functions
    static func requestPokemon(_ completion: @escaping (Result<[PokemonDetails], Error>) -> Swift.Void) {
        requestPokemon(at: pokemonResponse?.next)?.flatMap { response in
            Publishers.Sequence(sequence: response.results.compactMap { pokemonDetails(from: $0.url) })
                .flatMap { $0 }
                .collect()
        }
        .eraseToAnyPublisher()
        .sinkToResult { result in
            completion(result)
        }.store(in: &cancellables)
    }
}

// MARK: -
extension PokemonAPI {
    
    // MARK: Private functions
    private static func pokemonDetails(from urlString: String) -> AnyPublisher<PokemonDetails, Error>? {
        guard let url = URL(string: urlString) else { return nil }
        let request = URLRequest(url: url)
        return agent.execute(request)
    }
    
    private static func requestPokemon(at urlString: String?) -> AnyPublisher<APIResponse, Error>? {
        let finalURL: URL
        
        if let urlString = urlString, let url = URL(string: urlString) {
            finalURL = url
        } else {
            finalURL = baseURL.appendingPathComponent(PokemonAPI.ItemType.pokemons.rawValue)
        }
        
        let request = URLRequest(url: finalURL)
        
        return agent.execute(request).map { (response: APIResponse) -> APIResponse in
            self.pokemonResponse = response
            return response
        }.eraseToAnyPublisher()
    }
}

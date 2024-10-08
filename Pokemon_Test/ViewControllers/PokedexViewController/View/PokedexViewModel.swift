//
//  PokedexViewModel.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit

protocol ViewModelProtocol {
    associatedtype Data
    func requestData(_ completion: @escaping (Result<Data, Error>) -> Swift.Void)
}

// MARK: -
extension PokedexViewController {

    final class ViewModel: ViewModelProtocol {
        
        // MARK: Private properties
        private var pokemon = [PokemonDetails]()

        // MARK: - Public properties
        var title: String { "Pokedex" }
        var isLoading: Bool = false
        
        // MARK: - Public functions
        func requestData(_ completion: @escaping (Result<UICollectionView.DataSource, Error>) -> Void) {
            guard !isLoading else { return }
            isLoading = true
            
            PokemonAPI.requestPokemon { [weak self] result in
                guard let self = self else { return }
                
                switch result {
                case let .success(pokemon):
                    self.isLoading = false
                    self.pokemon += pokemon
                    let collectionData: UICollectionView.DataSource = .pokemonDataSource(from: self.pokemon)
                    
                    DispatchQueue.main.async { completion(.success(collectionData)) }
                case let .failure(error):
                    DispatchQueue.main.async { completion(.failure(error)) }
                }
            }
        }
    }
}

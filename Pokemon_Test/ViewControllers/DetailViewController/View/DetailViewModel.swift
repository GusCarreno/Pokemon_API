//
//  DetailViewModel.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit

extension DetailViewController {

    // MARK: -
    struct ViewModel {
        
        // MARK: Public properties
        let pokemon: PokemonDetails
        let color: UIColor

        var id: String { "#\(pokemon.id)" }
        var title: String { pokemon.name.capitalized }
        var isLight: Bool { color.isLight }
        var spriteURL: String { pokemon.sprite.url }
    }
}

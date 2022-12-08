//
//  PokedexViewBuilder.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/12/22.
//

import UIKit

final class PokedexViewBuilder {
    
    static func build() -> NavigationController {
        let router = PokedexRouter()
        let interactor = PokedexInteractor(router: router)
        let viewController = PokedexViewController(interactor: interactor)
        let navigationController = NavigationController(rootViewController: viewController)
        router.navigationController = navigationController
        return navigationController
    }
}

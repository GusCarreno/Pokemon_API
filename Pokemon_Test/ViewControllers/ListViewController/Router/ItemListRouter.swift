//
//  ListRouter.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/12/22.
//

import UIKit

protocol ListRouterProtocol {
    func routeToItemList(with data: ItemData)
}

// MARK: -
final class ListRouter: ListRouterProtocol {
    
    // MARK: Public properties
    weak var navigationController: UINavigationController?
    
    // MARK: - Public functions
    func routeToItemList(with data: ItemData) {
        let view = ItemsViewBuilder.build(with: data)
        navigationController?.pushViewController(view, animated: true)
    }
}

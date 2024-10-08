//
//  ListInteractor.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit

protocol ListInteractorProtocol {
    func selectItem(at indexPath: IndexPath, in tableView: UITableView)
}

// MARK: -
final class ListInteractor: ListInteractorProtocol {
    
    // MARK: Private properties
    private let router: ListRouterProtocol
    
    // MARK: - Init
    init(router: ListRouterProtocol) {
        self.router = router
    }
    
    // MARK: - Public functions
    func selectItem(at indexPath: IndexPath, in tableView: UITableView) {
        guard let cell = tableView.cell(at: indexPath) as? RegularCell,
              let itemData = cell.data
        else { return }

        router.routeToItemList(with: itemData)
    }
}

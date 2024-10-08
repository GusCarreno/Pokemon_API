//
//  ListViewController.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit

final class ListViewController: TableViewController {
    
    // MARK: Private properties
    private lazy var resultsViewController = ItemsViewBuilder.build()
    private let interactor: ListInteractorProtocol
    private let viewModel = ViewModel()
    
    private lazy var searchController: SearchController = {
        let controller = SearchController(searchResultsController: resultsViewController)
        controller.searchBar.delegate = self
        return controller
    }()

    // MARK: - Public properties
    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
    
    // MARK: - Init
    init(interactor: ListInteractorProtocol) {
        self.interactor = interactor
        super.init(style: .grouped)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
        navigationItem.backButtonTitle = ""

        title = viewModel.title
        
        spinner.startAnimating()

        viewModel.requestData { [weak self] result in
            switch result {
            case let .success(dataSource): self?.tableData = dataSource
            case let .failure(error): print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Private functions
    private func search(for string: String) {
        let results = viewModel.items.filtered(from: string)
        resultsViewController.tableData = .detailedItemsDataSource(from: results)
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        interactor.selectItem(at: indexPath, in: tableView)
    }
}

// MARK: - Search Bar Delegate
extension ListViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(for: searchText)
    }
}

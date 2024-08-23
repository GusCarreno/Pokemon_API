//
//  NavigationController.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit

final class NavigationController: UINavigationController {
    
    // MARK: Public properties
    override var childForStatusBarStyle: UIViewController? {
        topViewController?.childForStatusBarStyle ?? topViewController
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.titleTextAttributes = [.font: UIFont.pixel17, .foregroundColor: UIColor.white]
        navigationBar.barTintColor = .pokedexRed
        navigationBar.isTranslucent = false
        navigationBar.tintColor = .white
    }
}

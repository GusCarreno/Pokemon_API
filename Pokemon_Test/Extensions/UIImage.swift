//
//  UIImage.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit
import Combine

extension UIImage {
    private static var cancellables = Set<AnyCancellable>()

    static let pokedex = UIImage(named: "pokedex-icon")
    static let items = UIImage(named: "items-icon")

    static func load(from urlString: String, _ completion: @escaping (UIImage?) -> Swift.Void) {
        DispatchQueue.global(qos: .userInteractive).async {
            guard let imageURL = URL(string: urlString) else { completion(nil); return }

            let cache = URLCache.shared
            let request = URLRequest(url: imageURL)

            if let image = cache.image(from: request) {
                completion(image)
            } else {
                URLSession.shared.dataTaskPublisher(for: request).tryMap { $0 }.sinkToResult { result in
                    switch result {
                    case let .success(output):
                        cache.cacheImage(from: output, for: request)
                        completion(UIImage(data: output.data))
                    case .failure:
                        completion(nil)
                    }
                }.store(in: &cancellables)
            }
        }
    }
}

//
//  DetailHeaderView.swift
//  Pokemon_Test
//
//  Created by Gustavo Carreno on 08/23/24.
//

import UIKit

final class DetailHeaderView: UIView {
    
    // MARK: Private properties
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var cornerView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGrey
        return view
    }()
    
    // MARK: - Init
    init(frame: CGRect, urlString: String, color: UIColor) {
        super.init(frame: frame)
        
        backgroundColor = .darkGrey
        
        let fillerView = UIView(frame: UIScreen.main.bounds)
        fillerView.backgroundColor = color
        fillerView.frame.origin.y -= fillerView.frame.height - frame.height
        fillerView.roundedView(corners: [.bottomLeft, .bottomRight], radius: 40.0)
        addSubview(fillerView)

        addSubview(imageView)

        UIImage.load(from: urlString) { [weak self] image in
            DispatchQueue.main.async { self?.imageView.image = image }
        }
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = frame
    }
}

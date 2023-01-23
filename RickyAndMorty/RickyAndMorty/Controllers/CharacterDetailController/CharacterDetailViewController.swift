//
//  CharacterDetailController.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

final class CharacterDetailViewController: UIViewController {
    // MARK: - Viper Properties
    private let presenter: CharacterDetailPresenterInputProtocol
    
    // MARK: - Private Properties
    var stackView: UIStackView = UIStackView(frame: .zero)
    var headerImage: UIImageView = UIImageView(frame: .zero)
    var nameLabel: UILabel = UILabel(frame: .zero)
    var statusLabel: UILabel = UILabel(frame: .zero)
    var locationLabel: UILabel = UILabel(frame: .zero)
    var episodeLabel: UILabel = UILabel(frame: .zero)
    
    // MARK: - Init
    
    init(presenter: CharacterDetailPresenterInputProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = UIColor.designSystem(.secondaryColor)
        
        headerImage.backgroundColor = .clear
        view.addSubview(headerImage)
        
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.distribution = .equalCentering
        view.addSubview(stackView)
        
        nameLabel.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title1).pointSize, weight: .bold)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.textColor = .label
        nameLabel.textAlignment = .left
        nameLabel.numberOfLines = 0
        nameLabel.textColor = UIColor.designSystem(.textPrimaryColor)
        nameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(nameLabel)
        
        statusLabel.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title3).pointSize, weight: .bold)
        statusLabel.adjustsFontForContentSizeCategory = true
        statusLabel.textColor = .label
        statusLabel.textAlignment = .left
        statusLabel.numberOfLines = 0
        statusLabel.textColor = UIColor.designSystem(.textPrimaryColor)
        statusLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(statusLabel)
        
        locationLabel.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .callout).pointSize, weight: .bold)
        locationLabel.adjustsFontForContentSizeCategory = true
        locationLabel.textColor = .label
        locationLabel.textAlignment = .left
        locationLabel.numberOfLines = 0
        locationLabel.textColor = UIColor.designSystem(.textPrimaryColor)
        locationLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(locationLabel)
        
        episodeLabel.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .callout).pointSize, weight: .bold)
        episodeLabel.adjustsFontForContentSizeCategory = true
        episodeLabel.textColor = .label
        episodeLabel.textAlignment = .left
        episodeLabel.numberOfLines = 0
        episodeLabel.textColor = UIColor.designSystem(.textPrimaryColor)
        episodeLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        episodeLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(episodeLabel)
        
        setupConstraints()
        loadContent()
    }
    
    private func setupConstraints() {
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerImage.topAnchor.constraint(equalTo: view.topAnchor),
            headerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImage.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: CGFloat.spacing(.spacingSm)),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat.spacing(.spacingSm)),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -CGFloat.spacing(.spacingSm)),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func loadContent() {
        ImageDownloader.shared.downloadImage(with: presenter.getImageURL(), completionHandler: { [weak self] image, success in
            self?.headerImage.image = image
        }, placeholderImage: nil)
        
        nameLabel.text = presenter.getName()
        statusLabel.text = presenter.getStatus()
        locationLabel.text = presenter.getGender()
        episodeLabel.text = presenter.getEpisode()
        
        stackView.addHorizontalSeparators(color: UIColor.designSystem(.textPrimaryColor))
    }
}

// MARK: - Presenter output protocol
extension CharacterDetailViewController: CharacterDetailPresenterOutputProtocol {
    
}

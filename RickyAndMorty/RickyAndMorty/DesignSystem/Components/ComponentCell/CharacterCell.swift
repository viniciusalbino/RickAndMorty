//
//  CharacterCell.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation
import UIKit

final class CharacterCell: UICollectionViewCell {
    static let reuseIdentifer = "CharacterCell"
    
    private var icon: UIImageView = UIImageView(frame: .zero)
    private var titleLabel: UILabel = UILabel(frame: .zero)
    private var subtitleLabel: UILabel = UILabel(frame: .zero)
    private var descriptionLabel: UILabel = UILabel(frame: .zero)
    private var containerView: UIView = UIView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .clear
        applyCardShadow()
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        containerView.pinToBounds(of: contentView)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFill
        containerView.addSubview(icon)
        
        titleLabel.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title3).pointSize, weight: .bold)
        titleLabel.textColor = .designSystem(.textSecondaryColor)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        titleLabel.applyTitleShadow()
        containerView.addSubview(titleLabel)
        
        subtitleLabel.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .caption1).pointSize, weight: .regular)
        subtitleLabel.textColor = .designSystem(.textPrimaryColor)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.numberOfLines = 1
        containerView.addSubview(subtitleLabel)
        
        descriptionLabel.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .caption1).pointSize, weight: .light)
        descriptionLabel.textColor = .designSystem(.textPrimaryColor)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 1
        containerView.addSubview(descriptionLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            icon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            icon.topAnchor.constraint(equalTo: contentView.topAnchor),
            icon.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat.spacing(.spacingXs)),
            titleLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: -(22 + CGFloat.spacing(.spacingLg))),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -CGFloat.spacing(.spacingXs)),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 22)
        ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat.spacing(.spacingSm)),
            subtitleLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: CGFloat.spacing(.spacingSm)),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CGFloat.spacing(.spacingSm)),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: CGFloat.spacing(.spacingSm)),
            descriptionLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: CGFloat.spacing(.spacingSm)),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: CGFloat.spacing(.spacingSm)),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func fill(dto: CharacterCellDTO) {
        titleLabel.text = dto.title
        subtitleLabel.text = dto.subtitle
        descriptionLabel.text = dto.description
        ImageDownloader.shared.downloadImage(with: dto.iconURL, completionHandler: { image, cached in
            self.icon.image = image
        }, placeholderImage: nil)
    }
}

struct CharacterCellDTO {
    var title: String
    var subtitle: String
    var description: String
    var iconURL: String?
}

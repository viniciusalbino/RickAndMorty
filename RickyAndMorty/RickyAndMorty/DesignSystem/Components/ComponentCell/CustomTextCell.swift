//
//  InfoCell.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

final class CustomTextCell: UICollectionViewCell {
    static let reuseIdentifer = "CustomTextCell"
    
    private var titleLabel: UILabel = UILabel(frame: .zero)
    private var subtitleLabel: UILabel = UILabel(frame: .zero)
    private var descriptionLabel: UILabel = UILabel(frame: .zero)
    private var containerView: UIView = UIView(frame: .zero)
    private var stackView: UIStackView = UIStackView(frame: .zero)
    
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
        
        let spacing = CGFloat.spacing(.spacingSm)
        stackView.pinToBounds(of: containerView, customSpacing: UIEdgeInsets(top: spacing, left: spacing, bottom: -spacing, right: -spacing))
        stackView.contentMode = .scaleAspectFit
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = CGFloat.spacing(.spacingXs)
        
        titleLabel.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title2).pointSize, weight: .bold)
        titleLabel.textColor = .designSystem(.textPrimaryColor)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 2
        stackView.addArrangedSubview(titleLabel)
        
        subtitleLabel.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .caption1).pointSize, weight: .regular)
        subtitleLabel.textColor = .designSystem(.textPrimaryColor)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.numberOfLines = 1
        stackView.addArrangedSubview(subtitleLabel)
        
        descriptionLabel.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .caption1).pointSize, weight: .light)
        descriptionLabel.textColor = .designSystem(.textPrimaryColor)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 1
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    func fill(dto: CustomTextCellDTO) {
        titleLabel.text = dto.title
        subtitleLabel.text = dto.subtitle
        descriptionLabel.text = dto.description
    }
}

struct CustomTextCellDTO {
    var title: String
    var subtitle: String
    var description: String
}

//
//  SectionHeader.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 21/01/23.
//

import Foundation
import UIKit

protocol SectionHeaderDelegate {
    func didClickedMore(section: Section)
}

class SectionHeader: UICollectionReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: SectionHeader.self)
    }
    
    var titleLabel: UILabel = UILabel()
    var button: UIButton = UIButton()
    var delegate: SectionHeaderDelegate?
    var currentSection: Section?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .designSystem(.primaryColor)
        
        titleLabel.font = .systemFont(ofSize: UIFont.preferredFont(forTextStyle: .title2).pointSize, weight: .bold)
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 1
        titleLabel.textColor = UIColor.designSystem(.textPrimaryColor)
        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        
        button = SecondaryButton(frame: .zero)
        button.setTitle("More".localized(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(clickedMore), for: .touchUpInside)
        addSubview(button)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 22),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc private func clickedMore() {
        delegate?.didClickedMore(section: currentSection!)
    }
    
    func fill(title: String, section: Section, delegate: SectionHeaderDelegate?) {
        titleLabel.text = title
        self.currentSection = section
        self.delegate = delegate
        
        button.isHidden = currentSection != .characters
    }
}

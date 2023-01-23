//
//  HomeViewController.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    // MARK: - Viper Properties
    private let presenter: HomePresenterInputProtocol
    
    // MARK: - Private Properties
    var collectionView : UICollectionView!
    var isPageRefreshing: Bool = false
    var currentPage: Int = 1
    
    // MARK: - Value Types
     private var dataSource: UICollectionViewDiffableDataSource<Section, AnyHashable>?
     private var currentSnapshot: NSDiffableDataSourceSnapshot<Section, AnyHashable>?
    
    // MARK: - Init
    
    init(presenter: HomePresenter) {
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
        configureDataSource()
        configureHeader()
        presenter.loadContent()
    }
    
    private func setup() {
        title = "Rick And Morty"
        view.backgroundColor = .designSystem(.secondaryColor)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: generateLayout())
        collectionView.delegate = self
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseIdentifer)
        collectionView.register(CustomTextCell.self, forCellWithReuseIdentifier: CustomTextCell.reuseIdentifer)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: "section-header-element-kind", withReuseIdentifier: SectionHeader.reuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.pinToBounds(of: view)
    }
    
    // MARK: - Functions
    func configureHeader() {
        dataSource?.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            
            guard let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader, let section = Section(rawValue: indexPath.section) else {
                fatalError("Cannot create header view")
            }
            
            supplementaryView.fill(title: section.title, section: section, delegate: self)
            return supplementaryView
        }
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, AnyHashable>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            if itemIdentifier is CharacterModel {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseIdentifer, for: indexPath) as! CharacterCell
                if let item = itemIdentifier as? CharacterModel {
                    cell.fill(dto: item.dto())
                }
                return cell
            }
            if itemIdentifier is Location {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTextCell.reuseIdentifer, for: indexPath) as! CustomTextCell
                if let item = itemIdentifier as? Location {
                    cell.fill(dto: item.dto())
                }
                return cell
            }
            if itemIdentifier is Episode {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomTextCell.reuseIdentifer, for: indexPath) as! CustomTextCell
                if let item = itemIdentifier as? Episode {
                    cell.fill(dto: item.dto())
                }
                return cell
            }
            return nil
        })
    }
}

// MARK: - Presenter output protocol
extension HomeViewController: HomePresenterOutputProtocol {
    func handle(payload: NSDiffableDataSourceSnapshot<Section, AnyHashable>) {
        currentSnapshot = payload
        guard let snapShot = currentSnapshot else{
            return
        }
        dataSource?.apply(snapShot, animatingDifferences: true)
    }
}

// MARK: - UICollectionView Layout Methods
extension HomeViewController {
    func generateLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
                                                            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let isWideView = layoutEnvironment.container.effectiveContentSize.width > 500
            let sectionLayoutKind = Section.allCases[sectionIndex]
            switch (sectionLayoutKind) {
            case .characters:
                return self.generateCharactersLayout(isWide: isWideView)
            default:
                return self.generateSharedlbumsLayout()
            }
            
        }
        return layout
    }
    
    func generateCharactersLayout(isWide: Bool) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(150),
            heightDimension: .absolute(220))
        let spacing = CGFloat.spacing(.spacingXs)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "section-header-element-kind",
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
        
    func generateSharedlbumsLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(220),
            heightDimension: .absolute(150))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
        let spacing = CGFloat.spacing(.spacingXs)
        group.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        
        let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: "section-header-element-kind",
            alignment: .top)
        
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [sectionHeader]
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
}

extension HomeViewController: SectionHeaderDelegate {
    func didClickedMore(section: Section) {
        presenter.loadSectionController(section: section)
    }
}

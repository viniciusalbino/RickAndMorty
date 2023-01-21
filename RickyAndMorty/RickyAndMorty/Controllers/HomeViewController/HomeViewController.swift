//
//  HomeViewController.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 20/01/23.
//

import Foundation
import UIKit

enum Section : CaseIterable {
  case one
  case two
}

class Movies: Hashable {
    
    var name: String
    var showDetails = false
    var body: String
    
    init(name: String, body: String = "NA") {
            
        self.name = name
        self.body = body
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(name)
    }
    
    static func == (lhs: Movies, rhs: Movies) -> Bool {
        return lhs.name == rhs.name
    }
}

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    var collectionView : UICollectionView!
    
    
    private lazy var dataSource = makeDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        let config = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: config)
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        
        //2
        setData(animated: true)
    }
    
    
    func makeDataSource() -> UICollectionViewDiffableDataSource<Section, Movies> {
                   
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Movies> { cell, indexPath, movie in
            
            var content = cell.defaultContentConfiguration()
            
            if movie.showDetails{
                content.text = movie.name
                content.secondaryText = movie.body
            }
            else{
                content.text = movie.name
            }
            cell.contentConfiguration = content
        }
        
        return UICollectionViewDiffableDataSource<Section, Movies>(
                    collectionView: collectionView,
                    cellProvider: { collectionView, indexPath, item in
                        collectionView.dequeueConfiguredReusableCell(
                            using: cellRegistration,
                            for: indexPath,
                            item: item
                        )
                    }
                )
    }
    
    func setData(animated: Bool) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Movies>()
        snapshot.appendSections(Section.allCases)

        snapshot.appendItems([Movies(name: "Wonder Woman", body: "<Add description>")], toSection: .one)
        snapshot.appendItems([Movies(name: "Doctor Strange", body: "<Add description>")], toSection: .one)
        snapshot.appendItems([Movies(name: "The Batman", body: "<Add description>")], toSection: .one)

        snapshot.appendItems([Movies(name: "Iron Man")], toSection: .two)

        dataSource.apply(snapshot, animatingDifferences: animated)
    }
}

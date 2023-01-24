//
//  CharacterListController.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

final class CharacterListViewController: UIViewController {
    
    // MARK: - Viper Properties
    private let presenter: CharacterListPresenterInputProtocol
    
    // MARK: - Private Properties
    var isLoading: Bool = false
    
    private var collectionView: UICollectionView!
    
    // MARK: - Init
    
    init(presenter: CharacterListPresenterInputProtocol) {
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
    
    public func loadContent() {
        startLoading()
        presenter.loadContent()
    }
    
    public func reloadContent(content: CharacterInfo?) {
        presenter.setContent(content: content)
    }
    
    private func setup() {
        title = "Characters".localized()
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 220)
        let topSpacing = CGFloat.spacing(.spacingXs)
        let sideSpacing = CGFloat.spacing(.spacingLg)
        layout.sectionInset = UIEdgeInsets(top: topSpacing, left: sideSpacing, bottom: topSpacing, right: sideSpacing)
        layout.minimumLineSpacing = CGFloat.spacing(.spacingSm)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.designSystem(.secondaryColor)
        collectionView.showsVerticalScrollIndicator = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseIdentifer)
        collectionView.pinToBounds(of: view)
    }
}

extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItensInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseIdentifer, for: indexPath) as? CharacterCell, let item = presenter.itemForRowAt(indexPath.row) else {
            fatalError("Cell not found")
        }
        cell.fill(dto: item.dto())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.selectItemAt(indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard collectionView.numberOfItems(inSection: 0) > 0, self.collectionView.contentOffset.y >= (self.collectionView.contentSize.height - self.collectionView.bounds.size.height), !isLoading else {
            return
        }
        isLoading = true
        loadContent()
    }
}

// MARK: - Presenter output protocol
extension CharacterListViewController: CharacterListPresenterOutputProtocol {
    func didFinishedLoadingContent(success: Bool) {
        stopLoading()
        if success {
            performUIUpdate {
                self.collectionView.reloadData()
            }
        }
        isLoading = false
    }
    
    func failedLoadContent() {
        
    }
}

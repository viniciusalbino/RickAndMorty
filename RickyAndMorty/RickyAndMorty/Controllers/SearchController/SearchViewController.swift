//
//  SearchController.swift
//  RickyAndMorty
//
//  Created by Vinicius Albino on 22/01/23.
//

import Foundation
import UIKit

final class SearchViewController: UIViewController, UISearchResultsUpdating {
    
    // MARK: - Viper Properties
    private let presenter: SearchPresenterInputProtocol
    
    // MARK: - Private Properties
    private var currentSearchWord: String = ""
    private let searchController = UISearchController(searchResultsController: CharacterListControllerBuilder(firstFetch: false).build())
    private var searchTypingTimer: Timer?
    
    // MARK: - Init
    
    init(presenter: SearchPresenterInputProtocol) {
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
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.designSystem(.secondaryColor)
        title = "Busca".localized()
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, text.count >= 3 else {
            return
        }
        currentSearchWord = text
        searchTypingTimer?.invalidate()
        searchTypingTimer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(fetchSearch), userInfo: nil, repeats: false)
    }
    
    func updateSearchResults(for searchController: UISearchController, selecting searchSuggestion: UISearchSuggestion) {
        
    }
    
    @objc func fetchSearch() {
        presenter.executeSearch(name: currentSearchWord)
    }
}

// MARK: - Presenter output protocol
extension SearchViewController: SearchPresenterOutputProtocol {
    func didFinishedLoadingContent(result: CharacterInfo?) {
        DispatchQueue.main.async {
            if let controller = self.searchController.searchResultsController as? CharacterListViewController {
                controller.reloadContent(content: result)
            }
        }
    }
}

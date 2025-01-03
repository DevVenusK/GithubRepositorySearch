//
//  SearchController.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 1/3/25.
//

import UIKit.UISearchController

@MainActor protocol SearchControllerType where Self: UISearchController {
  func setDelegate(_ searchDelegate: some SearchController.SearchDelegate)
}

// MARK: - Search Delegate
extension SearchController {
  @MainActor protocol SearchDelegate {
    func search(_ searchQuery: SearchQuery)
  }
}

final class SearchController: UISearchController, SearchControllerType {
  private var searchDelegate: SearchDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    searchBar.delegate = self
    view.backgroundColor = .white
  }
}

extension SearchController {
  func setDelegate(_ searchDelegate: some SearchDelegate) {
    self.searchDelegate = searchDelegate
  }
}

extension SearchController: UISearchBarDelegate {
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let searchText = searchBar.text else { return }
    guard let searchQuery = SearchQuery(searchText) else { return }
    searchDelegate?.search(searchQuery)
  }
}

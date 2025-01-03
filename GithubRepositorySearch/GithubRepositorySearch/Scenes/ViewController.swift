//
//  ViewController.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 12/13/24.
//

import UIKit

final class ViewController: UIViewController {
  private let dependency: Dependency
  
  init(dependency: Dependency) {
    self.dependency = dependency
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "레포지토리 검색"
    navigationItem.searchController = dependency.searchController
    dependency.searchController.setDelegate(self)
    view.backgroundColor = .white
  }
}

// MARK: - Dependency
extension ViewController {
  struct Dependency {
    let searchController: SearchControllerType
  }
}

// MARK: - SearchDelegate
extension ViewController: SearchController.SearchDelegate {
  func search(_ searchQuery: SearchQuery) { }
}

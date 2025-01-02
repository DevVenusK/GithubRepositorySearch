//
//  RepositorySearchService.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 12/28/24.
//

protocol RepositorySearchService: Sendable {
  func search(_ search: RepositorySearch) async throws -> RepositorySearchEntity
}

final class RepositorySearchManager: RepositorySearchService {
  struct Dependency {
    let repositorySearchRepository: RepositorySearchRepositoryInterface
  }
  
  private let dependency: Dependency
  
  init(dependency: Dependency) {
    self.dependency = dependency
  }
}

extension RepositorySearchManager {
  func search(_ search: RepositorySearch) async throws -> RepositorySearchEntity {
    // TODO: - DTO 를 Entity 로 변환하기
    try await dependency
      .repositorySearchRepository
      .search(search)
    
    return RepositorySearchEntity()
  }
}

//
//  RepositorySearchRepository.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 12/29/24.
//

import Foundation

protocol RepositorySearchRepositoryInterface: Sendable {
  func search(_ reqeust: RepositorySearch) async throws -> RepositorySearchDTO
}

final class RepositorySearchRepository: RepositorySearchRepositoryInterface {
  struct Dependency {
    let networkService: NetworkService
  }
  
  private let dependency: Dependency
  
  init(dependency: Dependency) {
    self.dependency = dependency
  }
}

extension RepositorySearchRepository {
  func search(_ reqeust: RepositorySearch) async throws -> RepositorySearchDTO {
    guard let request = RepositorySearchRequest(
      paramters: [
        "q": reqeust.query.wrappedValue,
        "sort": reqeust.sort.rawValue,
        "order": reqeust.order.rawValue,
        "per_page": reqeust.perPage,
        "page": reqeust.page
      ]
    ) else { throw NSError(domain: "reqeust is invalid", code: 400) }
    
    return try await dependency
      .networkService
      .request(
        request: request,
        responseType: RepositorySearchDTO.self
      )
  }
}


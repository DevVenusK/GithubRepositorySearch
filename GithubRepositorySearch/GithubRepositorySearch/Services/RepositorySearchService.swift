//
//  RepositorySearchService.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 12/28/24.
//

protocol RepositorySearchService: Sendable {
  func search(_ search: RepositorySearch) async throws -> RepositorySearchEntity
}

//
//  RepositorySearchRequest.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 12/29/24.
//

struct RepositorySearchRequest: CoreRequestType {
  var url: GithubURL
  var httpMethod: HTTPMethod = .GET
  var paramters: Parameters
  
  init?(
    paramters: Parameters
  ) {
    guard let url = GithubURL("/search/repositories") else { return nil }
    self.url = url
    self.paramters = paramters
  }
}

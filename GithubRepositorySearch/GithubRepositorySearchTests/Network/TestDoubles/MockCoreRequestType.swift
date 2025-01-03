//
//  MockCoreRequestType.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 1/3/25.
//

@testable import GithubRepositorySearch

struct MockCoreRequestType: CoreRequestType {
  var url: GithubURL
  var httpMethod: HTTPMethod
  var paramters: Parameters
}

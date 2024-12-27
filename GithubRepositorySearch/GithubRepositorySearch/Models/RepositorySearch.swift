//
//  RepositorySearch.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 12/28/24.
//

struct RepositorySearch {
  let query: SearchQuery
  let sort: RepositorySort
  let order: RepositoryOrder
  let perPage: Int
  let page: Int
}

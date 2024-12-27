//
//  RepositorySearchDTO.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 12/28/24.
//

import Foundation

struct RepositorySearchDTO: Sendable, Decodable {
  let totalCount: Int?
  let incompleteResults: Bool?
  let items: [RepositorySearchResultItemDTO]?
  
  enum CodingKeys: String, CodingKey {
    case totalCount = "total_count"
    case incompleteResults = "incomplete_results"
    case items
  }
}

struct RepositorySearchResultItemDTO: Sendable, Decodable {
  let ID: Int?
  let nodeID: String?
  let name: String?
  let fullName: String?
  let owner: RepositoryOwnerDTO?
  let isPrivate: Bool?
  let htmlURL: String?
  let description: String?
  let fork: Bool?
  let URL: String?
  let createdAt: String?
  let updatedAt: String?
  let pushedAt: String?
  let homepage: String?
  let size: Int?
  let stargazersCount: Int?
  let watchersCount: Int?
  let language: String?
  let forksCount: Int?
  let openIssuesCount: Int?
  let defaultBranch: String?
  let score: Double?
  let topics: [String]?
  let archived: Bool?
  let disabled: Bool?
  
  enum CodingKeys: String, CodingKey {
    case ID = "id"
    case name
    case description
    case fork
    case URL = "url"
    case size
    case topics
    case archived
    case disabled
    case nodeID = "node_id"
    case fullName = "full_name"
    case owner
    case isPrivate = "private"
    case htmlURL = "html_url"
    case createdAt = "created_at"
    case updatedAt = "updated_at"
    case pushedAt = "pushed_at"
    case homepage
    case stargazersCount = "stargazers_count"
    case watchersCount = "watchers_count"
    case language
    case forksCount = "forks_count"
    case openIssuesCount = "open_issues_count"
    case defaultBranch = "default_branch"
    case score
  }
}

struct RepositoryOwnerDTO: Sendable, Codable {
  let ID: Int?
  let login: String?
  let nodeID: String?
  let avatarURL: String?
  let gravatarID: String??
  let URL: String?
  let htmlURL: String?
  let followersURL: String?
  let followingURL: String?
  let gistsURL: String?
  let starredURL: String?
  let subscriptionsURL: String?
  let organizationsURL: String?
  let reposURL: String?
  let eventsURL: String?
  let receivedEventsURL: String?
  let type: String?
  let siteAdmin: Bool?
  
  enum CodingKeys: String, CodingKey {
    case login
    case ID = "id"
    case URL = "url"
    case type
    case nodeID = "node_id"
    case avatarURL = "avatar_url"
    case gravatarID = "gravatar_id"
    case htmlURL = "html_url"
    case followersURL = "followers_url"
    case followingURL = "following_url"
    case gistsURL = "gists_url"
    case starredURL = "starred_url"
    case subscriptionsURL = "subscriptions_url"
    case organizationsURL = "organizations_url"
    case reposURL = "repos_url"
    case eventsURL = "events_url"
    case receivedEventsURL = "received_events_url"
    case siteAdmin = "site_admin"
  }
}

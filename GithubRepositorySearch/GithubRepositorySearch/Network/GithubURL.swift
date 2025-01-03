//
//  GithubURL.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 12/22/24.
//

import Foundation.NSURL

public struct GithubURL: Sendable {
  public let wrappedValue: URL
  
  init?(_ rawValue: String) {
    guard let url = URL(string: "https://api.github.com" + rawValue) else { return nil }
    wrappedValue = url
  }
}

//
//  NetworkGetStrategy.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 1/3/25.
//

import Foundation

struct NetworkGetStrategy: NetworkStrategy {
  private let urlSession: URLSessionDataService
  
  init(urlSession: URLSessionDataService) {
    self.urlSession = urlSession
  }
}

extension NetworkGetStrategy {
  func request<T>(
    request: some CoreRequestType,
    responseType: T.Type
  ) async throws -> T where T : Decodable, T : Sendable {
    
    guard var URLComponents = URLComponents(
      url: request.url.wrappedValue,
      resolvingAgainstBaseURL: true
    ) else {
      throw NSError(domain: "URL Components Error", code: 400)
    }
    
    URLComponents.queryItems = request
      .paramters
      .compactMapValues { $0 as? String }
      .map {
        URLQueryItem(name: $0.key, value: $0.value)
      }
    
    guard let url = URLComponents.url else {
      throw NSError(
        domain: "URL Error",
        code: 400
      )
    }
    
    var URLRequest = URLRequest(url: url)
    
    URLRequest.httpMethod = request
      .httpMethod.rawValue
    
    let (data, _) = try await urlSession
      .data(for: URLRequest)
    
    
    // TODO: - JSON Deocoder Wrapping
    return try JSONDecoder()
      .decode(
        responseType,
        from: data
      )
  }
}


//
//  NetworkPostStrategy.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 1/3/25.
//

import Foundation

struct NetworkPostStrategy: NetworkStrategy {
  private let urlSession: URLSessionDataService
  
  init(urlSession: URLSessionDataService) {
    self.urlSession = urlSession
  }
}

extension NetworkPostStrategy {
  func request<T>(
    request: some CoreRequestType,
    responseType: T.Type
  ) async throws -> T where T : Decodable, T : Sendable {
    var URLRequest = URLRequest(url: request.url.wrappedValue)
    
    URLRequest.httpMethod = request
      .httpMethod.rawValue
    
    // TODO: - JSON Serialization Wrapping
    let body = try? JSONSerialization
      .data(
        withJSONObject: request.paramters,
        options: .prettyPrinted
      )
    
    URLRequest.httpBody = body
    
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

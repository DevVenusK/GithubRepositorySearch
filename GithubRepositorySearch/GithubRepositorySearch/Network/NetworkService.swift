//
//  NetworkService.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 12/24/24.
//

import Foundation

public protocol NetworkService: Sendable {
  func request<T>(request: some CoreRequestType, responseType: T.Type) async throws -> T where T: Decodable, T: Sendable
}

final actor Network: NetworkService {
  static let shared: NetworkService = Network(context: NetworkContext(urlSession: URLSession.shared))
  
  private let context: NetworkContextService
  
  private init(context: NetworkContextService) {
    self.context = context
  }
  
  /**
   `NetworkTests` 에서 `NetworkContextService`를 주입하기 위한 메서드 입니다.
   `Testing` 타겟에서만 사용됩니다.
   */
#if TESTING
  static func create(with context: NetworkContextService) -> Network {
    return Network(context: context)
  }
#endif
}

extension Network {
  func request<T>(request: some CoreRequestType, responseType: T.Type) async throws -> T where T: Decodable, T: Sendable {
    await context.updateHttpMethod(request.httpMethod)
    return try await context.strategy().request(
      request: request,
      responseType: responseType
    )
  }
}

//
//  NetworkContextService.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 12/25/24.
//

protocol NetworkStrategy: NetworkService, Sendable { }

/**
 HttpMethod 에 따른 Network 를 처리하기 위해 생성되었습니다.
 예) GET Method 의 경우 URLComponents 를 사용할 수 있습니다.
 예) POST Method 의 경우 URLRequest 를 사용할 수 있습니다.
 */
protocol NetworkContextService: Sendable {
  /**
   현재 Context 의 Strategy 를 가져옵니다.
   */
  func strategy() async throws -> NetworkStrategy
  /**
   NetworkContext의 Strategy 를 업데이트 합니다.
   ```
   enum HTTPMethod {
   case POST
   }
   ```
   현재 HTTPMethod 의 경우 POST 밖에 없으나, 추후 확장될 수 있습니다.
   */
  func updateHttpMethod(_ httpMethod: HTTPMethod) async
}

final actor NetworkContext: NetworkContextService {
  enum NetworkContextError: Error {
    case isWrongStrategy
  }
  
  private var strategy: NetworkStrategy?
  private let urlSession: URLSessionDataService
  
  init(urlSession: URLSessionDataService) {
    self.urlSession = urlSession
  }
}

extension NetworkContext {
  func updateHttpMethod(_ httpMethod: HTTPMethod) async {
    switch httpMethod {
    case .POST: self.strategy = NetworkPostStrategy(urlSession: urlSession)
    case .GET: self.strategy = NetworkGetStrategy(urlSession: urlSession)
    }
  }
  
  func strategy() async throws -> NetworkStrategy {
    guard let strategy = strategy else { throw NetworkContextError.isWrongStrategy }
    return strategy
  }
  
  /**
   `NetworkContextTests`에서 `NetworkContext`의 `Strategy` 를 초기화시키기 위한 메서드입니다.
   `Testing` 타겟에서만 사용됩니다.
   */
#if TESTING
  func resetStrategy() async {
    self.strategy = nil
  }
#endif
}

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

//
//  NetworkContextServiceMock.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 1/3/25.
//

@testable import GithubRepositorySearch

final class NetworkContextServiceMock: NetworkContextService {
  private let mockResponse: Decodable
  private let shouldThrowError: Bool
  
  init(
    mockResponse: Decodable,
    shouldThrowError: Bool = false
  ) {
    self.mockResponse = mockResponse
    self.shouldThrowError = shouldThrowError
  }
  
  func updateHttpMethod(_ httpMethod: HTTPMethod) async { }
  func strategy() async throws -> any NetworkStrategy {
    return NetworkStrategyMock(mockResponse: mockResponse, shouldThrowError: shouldThrowError)
  }
}

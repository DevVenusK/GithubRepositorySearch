//
//  NetworkStrategyMock.swift
//  GithubRepositorySearch
//
//  Created by 김효성 on 1/3/25.
//

@testable import GithubRepositorySearch

final class NetworkStrategyMock: NetworkStrategy {
  private let mockResponse: Decodable?
  private let shouldThrowError: Bool
  
  init(
    mockResponse: Decodable?,
    shouldThrowError: Bool
  ) {
    self.mockResponse = mockResponse
    self.shouldThrowError = shouldThrowError
  }
  
  func request<T>(request: some CoreRequestType, responseType: T.Type) async throws -> T where T: Decodable, T: Sendable {
    if shouldThrowError {
      throw MockError.testError
    }
    guard let response = mockResponse as? T else {
      throw MockError.invalidResponse
    }
    return response
  }
}

//
//  URLSessionDataServiceMock.swift
//  GithubRepositorySearchTests
//
//  Created by 김효성 on 1/3/25.
//

import Foundation
@testable import GithubRepositorySearch

final class URLSessionDataServiceMock: URLSessionDataService {
  var mockData: Data
  var mockError: Error?
  
  init(
    mockData: Data,
    mockError: Error? = nil
  ) {
    self.mockData = mockData
    self.mockError = mockError
  }
  
  func data(from url: URL) async throws -> (Data, URLResponse) {
    if let error = mockError {
      throw error
    }
    let data = mockData
    let response = HTTPURLResponse(
      url: url,
      statusCode: 200,
      httpVersion: nil,
      headerFields: nil
    )!
    return (data, response)
  }
  
  func data(for request: URLRequest) async throws -> (Data, URLResponse) {
    if let error = mockError {
      throw error
    }
    let data = mockData
    let response = HTTPURLResponse(
      url: request.url!,
      statusCode: 200,
      httpVersion: nil,
      headerFields: nil
    )!
    return (data, response)
  }
}

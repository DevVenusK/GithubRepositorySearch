//
//  NetworkServiceTests.swift
//  GithubRepositorySearchTests
//
//  Created by 김효성 on 1/3/25.
//

import Testing
@testable import GithubRepositorySearch

struct NetworkTests {
  @Test func test_network_when_response() async throws {
    let response = TestResponse(id: 1, name: "mock")
    let context = NetworkContextServiceMock(mockResponse: response)
    let network = Network.create(with: context)
    let request = MockCoreRequestType(url: .init("/search")!, httpMethod: .GET, paramters: [:])
    
    let result = try await network.request(
      request: request,
      responseType: TestResponse.self
    )
    
    #expect(result.id == response.id)
    #expect(result.name == response.name)
  }
}

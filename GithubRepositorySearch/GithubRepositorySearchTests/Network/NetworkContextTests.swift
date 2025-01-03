//
//  NetworkContextTests.swift
//  GithubRepositorySearchTests
//
//  Created by 김효성 on 1/3/25.
//

import Testing
@testable import GithubRepositorySearch
import Foundation

struct NetworkContextTests {
  @Test func test_Context_when_Post_then_PostStrategy() async throws {
    let response = TestResponse(id: 0, name: "name")
    let data = try JSONEncoder().encode(response)
    let context = NetworkContext(
      urlSession: URLSessionDataServiceMock(
        mockData: data
      )
    )
    let request = MockCoreRequestType(
      url: .init("search")!,
      httpMethod: .POST,
      paramters: [:]
    )
    
    await context.updateHttpMethod(.POST)
    
    let contextResponse = try await context
      .strategy()
      .request(
        request: request,
        responseType: TestResponse.self
      )
    
    let strategy = try await context.strategy()
    
    #expect(strategy is NetworkPostStrategy)
    #expect(response.id == contextResponse.id)
    #expect(response.name == contextResponse.name)
  }
  
  @Test func test_Context_when_Get_then_GetStrategy() async throws {
    let response = TestResponse(id: 0, name: "name")
    let data = try JSONEncoder().encode(response)
    let context = NetworkContext(
      urlSession: URLSessionDataServiceMock(
        mockData: data
      )
    )
    let request = MockCoreRequestType(
      url: .init("search")!,
      httpMethod: .GET,
      paramters: [:]
    )
    
    await context.updateHttpMethod(.GET)
    
    let contextResponse = try await context
      .strategy()
      .request(
        request: request,
        responseType: TestResponse.self
      )
    
    let strategy = try await context.strategy()
    
    #expect(strategy is NetworkGetStrategy)
    #expect(response.id == contextResponse.id)
    #expect(response.name == contextResponse.name)
  }
}

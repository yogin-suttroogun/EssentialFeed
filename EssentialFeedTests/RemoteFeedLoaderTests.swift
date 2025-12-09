//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Yogin Kumar Suttroogun on 2025-12-09.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init() {}
    
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTest {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        // Arrange
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        // Act
        sut.load()
        
        // Assert
        XCTAssertNotNil(client.requestedURL)
    }
}

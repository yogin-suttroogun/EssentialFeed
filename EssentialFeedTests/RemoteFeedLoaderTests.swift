//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Yogin Kumar Suttroogun on 2025-12-09.
//

import XCTest

class RemoteFeedLoader {
    let client: HTTPClient
    let url: URL
    
    init(url: URL = URL(string: "https://a-url.com")!, client: HTTPClient) {
        self.url = url
        self.client = client
    }
    
    
    func load() {
        client.get(from: url)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
}

class RemoteFeedLoaderTests: XCTest {
    
    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "https://a-url.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoader(url: url, client: client)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestsDataFromURL() {
        // Arrange
        let url = URL(string: "https://a-given-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        
        // Act
        sut.load()
        
        // Assert
        XCTAssertEqual(client.requestedURL, url)
    }
}

//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Yogin Kumar Suttroogun on 2025-12-09.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests {
    
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
}

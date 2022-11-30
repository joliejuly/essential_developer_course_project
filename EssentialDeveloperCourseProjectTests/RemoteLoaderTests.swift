//
//  RemoteLoaderTests.swift
//  EssentialDeveloperCourseProjectTests
//
//  Created by joliejuly on 30.11.2022.
//

import XCTest

final class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "www.apple.com")
    }
}

final class HTTPClient {
    static let shared = HTTPClient()
    
    private init() {}
    
    var requestedURL: URL?
}

final class RemoteLoaderTests: XCTestCase {
 
    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        let _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }

}

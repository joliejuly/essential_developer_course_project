//
//  RemoteLoaderTests.swift
//  EssentialDeveloperCourseProjectTests
//
//  Created by joliejuly on 30.11.2022.
//

import XCTest

final class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL
    
    init(client: HTTPClient, url: URL) {
        self.client = client
        self.url = url
    }
    
    func load() {
        client.get(from: URL(string: "www.apple.com")!)
    }
}

protocol HTTPClient {
    func get(from url: URL)
}

final class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    func get(from url: URL) {
        requestedURL = url
    }
}

final class RemoteLoaderTests: XCTestCase {
 
    func test_init_doesNotRequestDataFromURL() {
        let url = URL(string: "www.apple.com")!
        let client = HTTPClientSpy()
       
        let _ = RemoteFeedLoader(client: client, url: url)
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        
        let url = URL(string: "www.apple.com")!
        let client = HTTPClientSpy()
    
        let sut = RemoteFeedLoader(client: client, url: url)
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
        XCTAssertEqual(client.requestedURL, url)
    }

}

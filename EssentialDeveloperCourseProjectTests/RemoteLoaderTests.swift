//
//  RemoteLoaderTests.swift
//  EssentialDeveloperCourseProjectTests
//
//  Created by joliejuly on 30.11.2022.
//

import XCTest

final class RemoteFeedLoader {
    
}

final class HTTPClient {
    var requestedURL: URL?
}

final class RemoteLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        let _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }

}

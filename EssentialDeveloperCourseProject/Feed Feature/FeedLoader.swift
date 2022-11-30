//
//  FeedLoader.swift
//  EssentialDeveloperCourseProject
//
//  Created by joliejuly on 30.11.2022.
//

import Foundation

typealias LoadFeedResult = Result<[FeedItem], Error>

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}

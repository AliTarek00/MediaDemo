//
//  MediaDemoTests.swift
//  MediaDemoTests
//
//  Created by Ali Tarek on 7/1/21.
//

import XCTest
@testable import MediaDemo

class MediaDemoTests: XCTestCase
{
    // MARK:- SUT
    
    var networkManager: MediaNetworkManger!
    
    // MARK:- Test LifeCycle Methods
    
    override func setUpWithError() throws
    {
        networkManager = MediaNetworkManger(type: .test)
    }

    override func tearDownWithError() throws
    {
    }

    // MARK:- Test Methods
    
    func testFetchChannels() throws
    {
        let expectedNumberOChannels = 2
        var exactNumberOfChannels: Int?
        
        networkManager.getChannels { result in
            if case .success(let response) = result
            {
                exactNumberOfChannels = response.data?.channels?.count ?? 0
            }
        }
        
        let message = "expected: \(expectedNumberOChannels), exact: \(String(describing: exactNumberOfChannels))"
        XCTAssert(expectedNumberOChannels == exactNumberOfChannels, message)
    }
    
    func testFetchNewEpisodes() throws
    {
        let expectedNumberOfEpisodes = 3
        var exactNumberOfEpisodes: Int?
        
        networkManager.getNewEpisodes { result in
            if case .success(let response) = result
            {
                exactNumberOfEpisodes = response.data?.episodes?.count ?? 0
            }
        }
        
        let message = "expected: \(expectedNumberOfEpisodes), exact: \(String(describing: exactNumberOfEpisodes))"
        XCTAssert(expectedNumberOfEpisodes == exactNumberOfEpisodes, message)
    }
    
    func testFetchCategories() throws
    {
        let expectedNumberOfCategories = 4
        var exactNumberOfCategories: Int?
        
        networkManager.getCategories { result in
            if case .success(let response) = result
            {
                exactNumberOfCategories = response.data?.categories?.count ?? 0
            }
        }
        
        let message = "expected: \(expectedNumberOfCategories), exact: \(String(describing: exactNumberOfCategories))"
        XCTAssert(expectedNumberOfCategories == exactNumberOfCategories, message)
    }
    
}

//
//  TestNewsService.swift
//  BoxFeedTests
//
//  Created by Husnain Ali on 30/05/2024.
//

import XCTest

@testable import BoxFeed
final class TestNewsService: XCTestCase {
    
    var sut: MockNewsService!
    var timeout:  TimeInterval!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = MockNewsService()
        timeout = 5
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        timeout = nil
    }
    
    func testFetchNewsSuccessfulResponse() async {
        
        let expectation = XCTestExpectation(description: "Fetch news successful")
        
        guard let sut else {
            XCTFail("Test failed: sut is nil")
            return
        }
        
        sut.fetchNewsDataResult = NewsModel.testDataArray
        
        do {
            let resultData = try await sut.fetchNews(from: .testSource, page: 1)
            
            XCTAssertNotNil(resultData, "Result should not be nil")
            XCTAssertEqual(resultData, NewsModel.testDataArray, "Result should match expected data")
            
            // Match exect values for each object
            zip(resultData!, NewsModel.testDataArray).forEach { (responseData, expectedData) in
                XCTAssertEqual(responseData.id, expectedData.id)
                XCTAssertEqual(responseData.title, expectedData.title)
                XCTAssertEqual(responseData.url, expectedData.url)
                XCTAssertEqual(responseData.author, expectedData.author)
            }
            
            expectation.fulfill()
        } catch {
            XCTFail("Test failed with error: \(error.localizedDescription)")
        }
        
        await fulfillment(of: [expectation], timeout: timeout)
    }
    
    func testFetchNewsFailure() async {
        guard let sut = sut else {
            XCTFail("Test failed: sut is nil")
            return
        }

        let expectation = XCTestExpectation(description: "Fetch news failure")

        // Set up mock behavior to cause the function to throw an error
        sut.fetchNewsDataResult = nil // Set nil to simulate failure
        
        do {
            let resultData = try await sut.fetchNews(from: .testSource, page: 1)
            XCTAssertNil(resultData, "Result should be nil")
            expectation.fulfill()
        } catch(let error) {
            XCTFail("Test failed with error: \(error.localizedDescription)")
        }

        await fulfillment(of: [expectation], timeout: timeout)
    }
    
    func testFetchSourcesSuccessfulResponse() async {
        
        let expectation = XCTestExpectation(description: "Fetch sources successful")
        
        guard let sut else {
            XCTFail("Test failed: sut is nil")
            return
        }
        
        sut.fetchSourcesDataResult = SourceModel.testData
        
        do {
            let resultData = try await sut.fetchSources()
            
            XCTAssertNotNil(resultData, "Result should not be nil")
            XCTAssertEqual(resultData, SourceModel.testData, "Result should match expected data")
            
            // Match exect values for each object
            zip(resultData!, SourceModel.testData).forEach { (responseData, expectedData) in
                XCTAssertEqual(responseData.id, expectedData.id)
                XCTAssertEqual(responseData.name, expectedData.name)
            }
            
            expectation.fulfill()
        } catch {
            XCTFail("Test failed with error: \(error.localizedDescription)")
        }
        
        await fulfillment(of: [expectation], timeout: timeout)
    }
    
    func testFetchSourcesFailure() async {
        guard let sut = sut else {
            XCTFail("Test failed: sut is nil")
            return
        }

        let expectation = XCTestExpectation(description: "Fetch sources failure")

        // Set up mock behavior to cause the function to throw an error
        sut.fetchSourcesDataResult = nil // Set nil to simulate failure
        
        do {
            let resultData = try await sut.fetchSources()
            XCTAssertNil(resultData, "Result should be nil")
            expectation.fulfill()
        } catch(let error) {
            XCTFail("Test failed with error: \(error.localizedDescription)")
        }

        await fulfillment(of: [expectation], timeout: timeout)
    }
    
    func testFetchTopHeadlinesSuccessfulResponse() async {
        
        let expectation = XCTestExpectation(description: "Fetch top headlines successful")
        
        guard let sut else {
            XCTFail("Test failed: sut is nil")
            return
        }
        
        sut.fetchTopHeadlinesDataResult = NewsModel.testDataArray
        
        do {
            let resultData = try await sut.fetchTopHeadlines()
            
            XCTAssertNotNil(resultData, "Result should not be nil")
            XCTAssertEqual(resultData, NewsModel.testDataArray, "Result should match expected data")
            
            // Match exect values for each object
            zip(resultData!, NewsModel.testDataArray).forEach { (responseData, expectedData) in
                XCTAssertEqual(responseData.id, expectedData.id)
                XCTAssertEqual(responseData.title, expectedData.title)
                XCTAssertEqual(responseData.url, expectedData.url)
                XCTAssertEqual(responseData.author, expectedData.author)
            }
            
            expectation.fulfill()
        } catch {
            XCTFail("Test failed with error: \(error.localizedDescription)")
        }
        
        await fulfillment(of: [expectation], timeout: timeout)
    }
    

    func testFetchTopHeadlinesFailure() async {
        guard let sut = sut else {
            XCTFail("Test failed: sut is nil")
            return
        }

        let expectation = XCTestExpectation(description: "Fetch top headlines failure")

        // Set up mock behavior to cause the function to throw an error
        sut.fetchTopHeadlinesDataResult = nil // Set nil to simulate failure
        
        do {
            let resultData = try await sut.fetchTopHeadlines()
            XCTAssertNil(resultData, "Result should be nil")
            expectation.fulfill()
        } catch(let error) {
            XCTFail("Test failed with error: \(error.localizedDescription)")
        }

        await fulfillment(of: [expectation], timeout: timeout)
    }
}

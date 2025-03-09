//
//  ShowsListViewModelTests.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import XCTest
import Commons
@testable import ShowsList

final class ShowsListViewModelTests: XCTestCase {

    // MARK: - PROPERTIES
    
    var getShowsUseCaseSpy: GetShowsUseCaseSpy!
    var factorySpy: ShowsListViewFactorySpy!
    var sut: ShowsListViewModel!

    // MARK: - INITIALIZERS

    override func setUp() {
        super.setUp()
        getShowsUseCaseSpy = GetShowsUseCaseSpy()
        factorySpy = ShowsListViewFactorySpy()
        sut = ShowsListViewModel(useCase: getShowsUseCaseSpy, factory: factorySpy)
    }

    override func tearDown() {
        getShowsUseCaseSpy = nil
        factorySpy = nil
        sut = nil
        super.tearDown()
    }

    private func setupExpectation() async {
        let expectation = XCTestExpectation(description: "Wait asycn task finishes")

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            expectation.fulfill()
        }

        await fulfillment(of: [expectation], timeout: 8)
    }
    
    private func verifyState(_ expectedState: ShowsListViewState) -> Bool {
        switch (sut.viewState, expectedState) {
        case (.loading, .loading):
            return true
        case (.hasData(let entityA), .hasData(let entityB)):
            return entityA.shows.count == entityB.shows.count
        case (.hasError(let messageA), .hasError(let messageB)):
            return messageA.isEmpty == messageB.isEmpty
        default:
            return false
        }
    }


    // MARK: - TESTS

    func testInitStateShouldTriggerFetchShows() async {
        sut.initState()
        
        XCTAssertTrue(verifyState(.loading), "Expected initial state should be 'loading'")
        
        await setupExpectation()
        
        XCTAssertTrue(verifyState(.hasData(.stub())), "Expected state should be 'hasData'")
    }
    
    func testFetchShowsShouldReturnSuccess() async {
        getShowsUseCaseSpy.shouldThrowError = false
        sut.fetchMoreItems()
        
        XCTAssertTrue(verifyState(.loading), "Expected state should be 'loading'")

        await setupExpectation()
        
        XCTAssertTrue(sut.items.count > 0, "Should exist items after the request")
    }
    
    func testFetchShowsShouldReturnError() async {
        getShowsUseCaseSpy.shouldThrowError = true
        sut.fetchMoreItems()
        
        await setupExpectation()
        
        XCTAssertTrue(verifyState(.hasError(message: MessageError.default.localizedDescription)), "Expected state should be 'hasError'")
    }

    func testSearchByNameShouldReturnSuccess() async {
        getShowsUseCaseSpy.shouldThrowError = false
        
        sut.searchByName("Breaking Bad")
        
        await setupExpectation()
        
        XCTAssertTrue(sut.itemsSearchedByName.count > 0, "Should exist items after the request")
        XCTAssertFalse(sut.isFetchingByName, "isFetchingByName should be 'false' after the request")
    }

    func testSearchByNameShouldReturnError() async {
        getShowsUseCaseSpy.shouldThrowError = true
        
        sut.searchByName("Invalid Name")
        
        await setupExpectation()
        
        XCTAssertTrue(sut.itemsSearchedByName.isEmpty, "Should NOT exist items after the request in case of error")
        XCTAssertFalse(sut.isFetchingByName, "isFetchingByName should be 'false' after the request error")
    }

    func testFetchMoreItemsPagination() async {
        getShowsUseCaseSpy.shouldThrowError = false
        sut.fetchMoreItems()
        
        await setupExpectation()
        
        XCTAssertTrue(sut.items.count > 0, "Should be more items after pagination")
    }

    func testFetchMoreItemsPaginationShouldReturnError() async {
        getShowsUseCaseSpy.shouldThrowError = true
        sut.fetchMoreItems()
        
        await setupExpectation()
        
        XCTAssertTrue(verifyState(.hasError(message: MessageError.default.localizedDescription)), "Should call a pagination error")
    }
}

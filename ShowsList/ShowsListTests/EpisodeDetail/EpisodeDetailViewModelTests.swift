//
//  EpisodeDetailViewModelTests.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import XCTest
import Domain
import Commons

@testable import ShowsList

final class EpisodeDetailViewModelTests: XCTestCase {
    
    // MARK: - PROPERTIES
    
    var getEpisodeDetailUseCaseSpy: GetEpisodeDetailUseCaseSpy!
    var factorySpy: EpisodeDetailViewFactorySpy!
    var sut: EpisodeDetailViewModel!
    
    private let testEpisodeIdentifier = "456"

    // MARK: - SETUP & TEARDOWN

    override func setUp() {
        super.setUp()
        getEpisodeDetailUseCaseSpy = GetEpisodeDetailUseCaseSpy()
        factorySpy = EpisodeDetailViewFactorySpy()
        
        sut = EpisodeDetailViewModel(
            getEpisodeDetailUseCase: getEpisodeDetailUseCaseSpy,
            factory: factorySpy,
            episodeIdentifier: testEpisodeIdentifier
        )
    }

    override func tearDown() {
        getEpisodeDetailUseCaseSpy = nil
        factorySpy = nil
        sut = nil
        super.tearDown()
    }
    
    private func setupExpectation() async {
        let expectation = XCTestExpectation(description: "Wait for async task to complete")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 5)
    }
    
    private func verifyState(_ expectedState: EpisodeDetailViewState) -> Bool {
        switch (sut.viewState, expectedState) {
        case (.loading, .loading):
            return true
        case (.hasData(let entityA), .hasData(let entityB)):
            return entityA.id == entityB.id && entityA.name == entityB.name
        case (.hasError(let messageA), .hasError(let messageB)):
            return messageA.isEmpty == messageB.isEmpty
        default:
            return false
        }
    }
    
    // MARK: - TESTS

    func testInitStateShouldSetStateToLoading() {
        sut.initState()
        
        XCTAssertTrue(verifyState(.loading), "The initial state should be 'loading'")
    }

    func testFetchEpisodeDetailShouldReturnSuccess() async {
        getEpisodeDetailUseCaseSpy.shouldThrowError = false
        
        sut.initState()
        
        await setupExpectation()
        
        XCTAssertTrue(verifyState(.hasData(.stub())), "The expected state should be 'hasData' with the correct episode details")
    }

    func testFetchEpisodeDetailShouldReturnError() async {
        getEpisodeDetailUseCaseSpy.shouldThrowError = true

        sut.initState()
        
        await setupExpectation()
        
        XCTAssertTrue(verifyState(.hasError(message: MessageError.default.localizedDescription)), "The expected state should be 'hasError' with the correct error message")
    }
    
}

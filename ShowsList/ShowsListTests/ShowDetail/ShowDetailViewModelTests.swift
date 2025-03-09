//
//  ShowDetailViewModelTests.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import XCTest
import Domain
import Commons

@testable import ShowsList

final class ShowDetailViewModelTests: XCTestCase {
    
    // MARK: - PROPRIEDADES
    
    var getShowDetailUseCaseSpy: GetShowDetailUseCaseSpy!
    var getEpisodesUseCaseSpy: GetShowEpisodesUseCaseSpy!
    var factorySpy: ShowDetailViewFactorySpy!
    var sut: ShowDetailViewModel!
    
    private let testShowIdentifier = "123"
    
    // MARK: - CONFIGURAÇÃO
    
    override func setUp() {
        super.setUp()
        getShowDetailUseCaseSpy = GetShowDetailUseCaseSpy()
        getEpisodesUseCaseSpy = GetShowEpisodesUseCaseSpy()
        factorySpy = ShowDetailViewFactorySpy()
        
        sut = ShowDetailViewModel(
            getShowDetailUseCase: getShowDetailUseCaseSpy,
            getEpisodesUseCase: getEpisodesUseCaseSpy,
            factory: factorySpy,
            showIdentifier: "1"
        )
    }
    
    override func tearDown() {
        getShowDetailUseCaseSpy = nil
        getEpisodesUseCaseSpy = nil
        factorySpy = nil
        sut = nil
        super.tearDown()
    }
    
    private func setupExpectation() async {
        let expectation = XCTestExpectation(description: "Wait async task finishes")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            expectation.fulfill()
        }
        
        await fulfillment(of: [expectation], timeout: 5)
    }
    
    private func verifyState(_ expectedState: ShowDetailViewState) -> Bool {
        switch (sut.viewState, expectedState) {
        case (.loading, .loading):
            return true
        case (.hasData(let entityA), .hasData(let entityB)):
            return entityA.episodes.count == entityB.episodes.count
        case (.hasError(let messageA), .hasError(let messageB)):
            return messageA.isEmpty == messageB.isEmpty
        default:
            return false
        }
    }
    
    // MARK: - TESTES
        
    func testInitStateStateLoading() {
        sut.initState()
        
        XCTAssertTrue(verifyState(.loading), "Initial state should be 'loading'")
    }

    func testFetchShowDetailsShouldReturnSuccess() async {
        getShowDetailUseCaseSpy.shouldThrowError = false
        getEpisodesUseCaseSpy.shouldThrowError = false
        
        sut.initState()
        
        await setupExpectation()
        
        XCTAssertTrue(verifyState(.hasData(.stub())), "Expected state should be 'hasData'")
    }

    func testFetchShowDetailsShouldReturnError() async {
        getShowDetailUseCaseSpy.shouldThrowError = true
        getEpisodesUseCaseSpy.shouldThrowError = true

        sut.initState()
        
        await setupExpectation()
        
        XCTAssertTrue(verifyState(.hasError(message: MessageError.default.localizedDescription)), "Expected state should be 'hasError'")
    }
    
    func testFetchEpisodesShouldReturnSuccess() async {
        getShowDetailUseCaseSpy.shouldThrowError = false
        getEpisodesUseCaseSpy.shouldThrowError = false

        sut.initState()
        
        await setupExpectation()
        
        XCTAssertTrue(verifyState(.hasData(.stub())), "Expected state should be 'hasData'")
    }

    func testFetchEpisodesShouldReturnError() async {
        getShowDetailUseCaseSpy.shouldThrowError = false
        getEpisodesUseCaseSpy.shouldThrowError = true

        sut.initState()
        
        await setupExpectation()
        
        XCTAssertTrue(verifyState(.hasError(message: MessageError.default.localizedDescription)), "Expected state should be 'hasError'")
    }
}

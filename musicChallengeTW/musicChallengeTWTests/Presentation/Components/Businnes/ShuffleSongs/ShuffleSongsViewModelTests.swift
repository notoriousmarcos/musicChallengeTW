//
//  ShuffleSongsViewModelTests.swift
//  musicChallengeTWTests
//
//  Created by Marcos Vinicius da Cunha Brito on 08/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import XCTest
@testable import musicChallengeTW

class ShuffleSongsViewModelTests: XCTestCase {

    private var viewModel: ShuffleSongsViewModel!
    private var useCase: MockFetchSongsUseCase!

    override func setUp() {
        useCase = MockFetchSongsUseCase()
        viewModel = ShuffleSongsViewModel(useCase: useCase)
    }

    override func tearDown() {
        viewModel = nil
    }

    func testFetchSongs() {
        useCase.isSucces = true
        viewModel.load()
        XCTAssertEqual(viewModel.songs.first?.trackName, "name")
        XCTAssertEqual(viewModel.songs.count, 1)
    }

    func testFailFetchSongs() {
        useCase.isSucces = false
        viewModel.load()
        XCTAssertEqual(viewModel.songs.count, 0)
        XCTAssertEqual(viewModel.showAlert, true)
        XCTAssertNotNil(viewModel.error)
    }

    func testFailThrowFetchSongs() {
        useCase.isThrow = true
        viewModel.load()
        XCTAssertEqual(viewModel.songs.count, 0)
        XCTAssertEqual(viewModel.showAlert, true)
        XCTAssertNotNil(viewModel.error)
    }

}

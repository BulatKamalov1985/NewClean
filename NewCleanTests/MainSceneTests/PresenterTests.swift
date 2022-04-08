//
//  PresenterTests.swift
//  NewCleanTests
//
//  Created by Bulat Kamalov on 07.04.2022.
//

import Foundation
import XCTest
@testable import NewClean

final class PresenterTests: XCTestCase {
    func testPresentInitForm() {
        let presenter = ScenePresenter()
        let sceneViewControllerMock = SceneViewControllerMock()
        presenter.viewController = sceneViewControllerMock
        
        let response: [ResponseModel] = Array(repeating: .init(userId: 1, id: 1, title: "title", body: "body"), count: 10)
        presenter.presentInitForm(response)
        
        XCTAssertTrue(sceneViewControllerMock.displayInitFormWasCalled, "Функция displayInitFormWasCalled должна быть вызвана")
        
        let responseMock: [ResponseModel] = makeResponseMock()
        presenter.presentInitForm(responseMock)
        
        XCTAssertTrue(sceneViewControllerMock.viewModel[0].bool == true, "Первый элемент массива должен быть true")
        XCTAssertTrue(sceneViewControllerMock.viewModel[1].bool == false, "Первый элемент массива должен быть false")
        XCTAssertTrue(sceneViewControllerMock.viewModel[0].cellColor == .green, "Первый элемент массива должен быть green")
        XCTAssertTrue(sceneViewControllerMock.viewModel[1].cellColor == .black, "Первый элемент массива должен быть black")
    }
    
    private func makeResponseMock() -> [ResponseModel] {
        Array(repeating: .init(userId: 1, id: 1, title: "", body: ""), count: 10)
    }
    
}

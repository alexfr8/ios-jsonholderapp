//
//  MainViewControllerTests.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 25/11/2019.
//  Copyright (c) 2019 Alejandro Fernández Ruiz. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Json_Holder_App
import XCTest

class MainViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: MainViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupMainViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupMainViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "MainStoryboard", bundle: bundle)
        sut = storyboard.instantiateInitialViewController() as! MainViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class MainBusinessLogicSpy: MainBusinessLogic {
        var setupViewCalled = true
        var getAllUserCalled = true
        var userSelectedCalled = true
        var getUserCountCalled = true
        var getTodoCountCalled = true
        var getPostCountCalled = true
        var getDataForUserCellCalled = true
        var getDataForPostCellCalled = true
        var getDataForTodoCellCalled = true
        var postSelectedCalled = true
        
        func setupView() {
            setupViewCalled = true
        }
        
        func getAllUsers() {
            getAllUserCalled = true
        }
        
        func userSelected(userIndex: Int) {
            userSelectedCalled = true
        }
        
        func getUserCount() -> Int {
            getUserCountCalled = true
            return 0
        }
        
        func getTodoCount() -> Int {
            getTodoCountCalled = true
            return 0
        }
        
        func getPostCount() -> Int {
            getPostCountCalled = true
            return 0
        }
        
        func getDataForUserCell(index: Int) -> Main.Models.UserCellData {
            getDataForUserCellCalled = true
            return Main.Models.UserCellData()
        }
        
        func getDataForPostCell(index: Int) -> Main.Models.PostCellData {
            getDataForPostCellCalled = true
            return Main.Models.PostCellData()
        }
        
        func getDataForTodoCell(index: Int) -> Main.Models.TodosCellData {
            getDataForTodoCellCalled = true
            return Main.Models.TodosCellData()
        }
        
        func postSelected(index: IndexPath) {
            postSelectedCalled = true
        }
        
    }
    
    // MARK: Tests
    
    func testShouldDoSomethingWhenViewIsLoaded() {
        // Given
        let spy = MainBusinessLogicSpy()
        sut.interactor = spy
        let viewModel : Main.Models.ViewModel = Main.Models.ViewModel()
        // When
        loadView()
        sut.setupView(viewModel: viewModel)
        // Then
        XCTAssertTrue(sut.collectionUsers.isHidden, "the setup should hide the collectionview and indicates that the setup method is launched")
        XCTAssertEqual(sut.collectionPosts.backgroundColor, UIColor.clear, "the setup should change the collectionview background to clear")
        
    }
    
    
    func testShowUsers() {
        // Given
        let spy = MainBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.showUsers()
        // Then
        XCTAssertFalse(sut.collectionUsers.isHidden, "the setup should hide the collectionview and indicates that the setup method is launched")
        
        
    }
    
    func testShowPostForUser() {
        // Given
        let spy = MainBusinessLogicSpy()
        sut.interactor = spy
        let viewModel: Main.Models.ViewModel = Main.Models.ViewModel()
        
        // When
        loadView()
        sut.showPostForUser(viewModel: viewModel)
        // Then
        XCTAssertFalse(sut.stackView.isHidden, "the setup should hide the collectionview and indicates that the setup method is launched")
    }
    func testNavigateToPostComments( ) {
        // Given
        let spy = MainBusinessLogicSpy()
        sut.interactor = spy
        let viewModel: Main.Models.ViewModel = Main.Models.ViewModel()
        
        // When
        loadView()
        sut.navigateToPostComments(viewModel: viewModel)
        // Then
        //TODO: CHECK DEVELOPMENT
        //PENDING COMPLETE THE DEVELOPMENT.
    }
    
    func testShowError() {
        // Given
        let spy = MainBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        sut.showError(msg: "FAKE MSG")
        // Then
        //TODO: CHECK DEVELOPMENT
        //PENDING COMPLETE THE DEVELOPMENT.
        waitUI()
        // Then
        XCTAssertTrue(sut.presentedViewController is UIAlertController, "show error should show an alert controller with options")
        
    }
}
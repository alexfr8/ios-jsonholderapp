//
//  PostShowViewControllerTests.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 28/11/2019.
//  Copyright (c) 2019 Alejandro Fernández Ruiz. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Json_Holder_App
import XCTest

class PostShowViewControllerTests: XCTestCase {
    // MARK: Subject under test
    
    var sut: PostShowViewController!
    var window: UIWindow!
    
    // MARK: Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupPostShowViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: Test setup
    
    func setupPostShowViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "PostShowStoryboard", bundle: bundle)
        sut = storyboard.instantiateInitialViewController() as? PostShowViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: Test doubles
    
    class PostShowBusinessLogicSpy: PostShowBusinessLogic {
        
        var doSomethingCalled = false
        var setupViewCalled = false
        var closeDialogCalled = false
        var getCommentsCalled = false
        var getCommentCountCalled = false
        var getDataForCommentCellCalled = false
        
        func setupView() {
            setupViewCalled = true
        }
        
        func closeDialog() {
            closeDialogCalled = true
        }
        
        func getComments() {
            getCommentsCalled = true
        }
        
        func getCommentCount() -> Int {
            getCommentCountCalled = true
            return 0
        }
        
        func getDataForCommentCell(index: Int) -> PostShow.Models.CommentCellData {
            getDataForCommentCellCalled = true
            return PostShow.Models.CommentCellData()
        }
        
        
    }
    
    // MARK: Tests
    
    func testShouldDoSomethingWhenViewIsLoaded() {
        // Given
        let spy = PostShowBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        let viewModel: PostShow.Models.ViewModel = PostShow.Models.ViewModel()
        sut.setupView(viewModel: viewModel)
        // Then
        XCTAssertTrue(spy.getCommentsCalled, "this method should call get comments method")
    }
    
    func testShowPost() {
        // Given
        let spy = PostShowBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        var viewModel: PostShow.Models.ViewModel = PostShow.Models.ViewModel()
        viewModel.title = "fake title"
        sut.showPost(viewModel: viewModel)
        // Then
        XCTAssertEqual(String(format: "%@\n%@", "commentsscreen.post.title".localized, viewModel.title ?? ""), sut.lblPost.text, "this method have to setup the text on the post title label")
        
    }
    func testShowError() {
        // Given
        let spy = PostShowBusinessLogicSpy()
        sut.interactor = spy
        
        // When
        loadView()
        
        sut.showError(msg: "fake mesage text")
        // Then
        //TODO: CHECK DEVELOPMENT
        //PENDING COMPLETE THE DEVELOPMENT.
        waitUI()
        // Then
        XCTAssertTrue(sut.presentedViewController is UIAlertController, "show error should show an alert controller with options")
    }
    
    
}
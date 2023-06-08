//
//  TestProjectTests.swift
//  TestProjectTests
//
//  Created by SF on 01.06.2021.
//

import XCTest
@testable import TestProject

class TestProjectTests: XCTestCase {
    
    // initial data
    var mockUserInfo: UserMock? = nil
    var mockUserFriendInfo: UserMock? = nil
    
    let testFirstName: String = "Raman"
    let testlastName: String = "Kozar"
    let testBio: String = "I'm 27 years old, I'm a software developer."
    let testCity: String = "Poznań"
    let testFriends = [UserMock(firstName: "Michał",
                               lastName: "Kacziński",
                               bio: "Pracownik bankowy",
                               city: "Wrocław",
                               friends: [],
                               isClosed: false)]
    let testIsClosed: Bool = true
    
    let testFriendFirstName: String = "Andrzej"
    let testFriendlastName: String = "Duda"
    let testFriendBio: String = "I'm 40 years old, I'm a president of Poland."
    let testFriendCity: String = "Warszawa"
    let testFriendFriends = [User]()
    let testFriendIsClosed: Bool = true
    
    // data for comparing
    let mockFirstName: String = "Mateusz"
    let mockLastName: String = "Morawiecki"
    let mockBio: String = "I'm 41 years old, I'm a premier of Poland."
    let mockCity: String = "Warszawa Zachodnia"
    let mockIsClosed: Bool = false
    let mockCountOfFriendsCounter: Int = 2
    
    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // test user
        mockUserInfo = UserMock(firstName: testFirstName, lastName: testlastName, bio: testBio, city: testCity, friends: testFriends, isClosed: testIsClosed)
        
        // test user friend
        mockUserFriendInfo = UserMock(firstName: testFriendFirstName, lastName: testFriendlastName, bio: testFriendBio, city: testFriendCity, friends: testFriendFriends, isClosed: testFriendIsClosed)
        
    }

    override func tearDownWithError() throws {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        mockUserInfo = nil
        mockUserFriendInfo = nil
        
    }
    
    func testChangeCity() throws {
        
        guard let mockUserInfo = mockUserInfo else {
            return
        }
        
        mockUserInfo.changeCity(mockCity)
        
        XCTAssertTrue(mockUserInfo.changeCityCounter > 0)
        XCTAssertTrue(mockUserInfo.changeCityCalled)
        XCTAssertTrue(mockUserInfo.city == mockCity)
        
    }
    
    func testChangeClosed() throws {
        
        guard let mockUserInfo = mockUserInfo else {
            return
        }
        
        mockUserInfo.changeClosed(mockIsClosed)
        
        XCTAssertTrue(mockUserInfo.changeClosedCounter > 0)
        XCTAssertTrue(mockUserInfo.changeClosedCalled)
        XCTAssertTrue(mockUserInfo.isClosed == mockIsClosed)
        
    }
    
    func testChangeName() throws {
        
        guard let mockUserInfo = mockUserInfo else {
            return
        }
        
        mockUserInfo.changeName(mockFirstName)
        
        XCTAssertTrue(mockUserInfo.changeNameCounter > 0)
        XCTAssertTrue(mockUserInfo.changeNameCalled)
        XCTAssertTrue(mockUserInfo.firstName == mockFirstName)
        
    }
    
    func testChangeLastName() throws {
        
        guard let mockUserInfo = mockUserInfo else {
            return
        }
        
        mockUserInfo.changeLastName(mockLastName)
        
        XCTAssertTrue(mockUserInfo.changeLastNameCounter > 0)
        XCTAssertTrue(mockUserInfo.changeLastNameCalled)
        XCTAssertTrue(mockUserInfo.lastName == mockLastName)
        
    }
    
    func testChangeBio() throws {
        
        guard let mockUserInfo = mockUserInfo else {
            return
        }
        
        mockUserInfo.changeBio(mockBio)
        
        XCTAssertTrue(mockUserInfo.changeBioCounter > 0)
        XCTAssertTrue(mockUserInfo.changeBioCalled)
        XCTAssertTrue(mockUserInfo.bio == mockBio)
        
    }
    
    func testAddFriend() throws {
        
        guard let mockUserInfo = mockUserInfo else {
            return
        }
        
        guard let mockUserFriendInfo = mockUserFriendInfo else {
            return
        }
        
        mockUserInfo.addFriend(mockUserFriendInfo)
        mockUserInfo.addFriend(mockUserFriendInfo)
        
        XCTAssertTrue(mockUserInfo.addFriendCalled)
        XCTAssertTrue(mockUserInfo.addFriendCounter == mockCountOfFriendsCounter)
        
    }
    
}

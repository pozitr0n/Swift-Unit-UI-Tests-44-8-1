//
//  UserMock.swift
//  TestProject
//
//  Created by Raman Kozar on 08/06/2023.
//

import Foundation

class UserMock: User {
    
    // counters that control the number of times the method will be called
    var changeCityCounter: Int = 0
    var changeClosedCounter: Int = 0
    var changeNameCounter: Int = 0
    var changeLastNameCounter: Int = 0
    var changeBioCounter: Int = 0
    var addFriendCounter: Int = 0
    
    // variables for fixing whether this or that method was called
    var changeCityCalled = false
    var changeClosedCalled = false
    var changeNameCalled = false
    var changeLastNameCalled = false
    var changeBioCalled = false
    var addFriendCalled = false
    
    override func changeCity(_ city: String) {
        
        changeCityCounter += 1
        changeCityCalled = true
        
        self.city = city
        
    }
    
    override func changeClosed(_ isClosed: Bool) {
        
        changeClosedCounter += 1
        changeClosedCalled = true
        
        self.isClosed = isClosed
        
    }
    
    override func changeName(_ firstName: String) {
        
        changeNameCounter += 1
        changeNameCalled = true
        
        self.firstName = firstName
        
    }
    
    override func changeLastName(_ lastName: String) {
        
        changeLastNameCounter += 1
        changeLastNameCalled = true
        
        self.lastName = lastName
        
    }
    
    override func changeBio(_ bio: String) {
        
        changeBioCounter += 1
        changeBioCalled = true
        
        self.bio = bio
        
    }
    
    override func addFriend(_ friend: User) {
        
        addFriendCounter += 1
        addFriendCalled = true
        
        friends.append(friend)
        
    }
    
}

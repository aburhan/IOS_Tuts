//
//  User.swift
//  wip_meenagram
//
//  Created by Ameenah Burhan on 2/27/17.
//  Copyright © 2017 Meena LLC. All rights reserved.
//

import Foundation

class User{
    var bio: String
    var display: String
    var email: String
    var photo: String
    var username: String
    
    init(bio: String, display: String, email: String, photo: String, username:String){
        self.bio = bio
        self.display = display
        self.email = email
        self.photo = photo
        self.username = username
    
    }
    func getUser()->Any{
        let user_info:[String: String] = ["bio": self.bio,
                                        "display":self.display,
                                        "username": self.username,
                                        "email": self.email,
                                        "photo": self.photo]
        return user_info
    }
}

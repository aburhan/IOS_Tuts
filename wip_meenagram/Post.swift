//
//  Post.swift
//  wip_meenagram
//
//  Created by Ameenah Burhan on 3/5/17.
//  Copyright © 2017 Meena LLC. All rights reserved.
//

import Foundation

class Post{
    var userID: String
    var postID: String
    var imageURL: String
    var caption: String
 
    
    init(userID: String, postID:String, imageURL: String, caption: String){
        self.userID = userID
        self.postID = postID
        self.imageURL = imageURL
        self.caption = caption
    }
    func getPostAsDictionary()->Dictionary<String,String>{
        let postDictionary = ["imageURL": imageURL,
                              "caption": caption]
        return postDictionary
    }
    
}

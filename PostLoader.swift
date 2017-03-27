//
//  PostLoader.swift
//  test_db_structure
//  Loading dummy data into firebase for tutorial purposes
//

import Foundation
import Firebase

class PostLoader{
    
    let databaseRef =  FIRDatabase.database().reference()
    func signIn(){
        print("test")
        if(FIRAuth.auth()?.currentUser?.uid == nil){
        FIRAuth.auth()?.signIn(withEmail: "test@test.com", password: "password", completion: { (user, error) in
            if(error != nil){
                print("Signin Failed")
            }
            else{
                print("Sign in Successful")
            }
        })
        }
        else{
            print("Already Signed in")
        }
    }
    func createDatabase(){
        print("Entered Data")
        //let userID = FIRAuth.auth()?.currentUser?.uid
        databaseRef.child("Following").child("me").child("following").updateChildValues(["you":"you","her":"her"])
        databaseRef.child("Photo").child("me").updateChildValues(["photo1": "https://firebasestorage.googleapis.com/v0/b/database-setup.appspot.com/o/donut.jpg?alt=media&token=d2d28761-22e9-4321-9c42-9ba9cb098c41"])
        databaseRef.child("User").child("me").updateChildValues(["username": "me", "profile_photo":"https://firebasestorage.googleapis.com/v0/b/database-setup.appspot.com/o/donut.jpg?alt=media&token=d2d28761-22e9-4321-9c42-9ba9cb098c41","email":"test@test.com"])
        databaseRef.child("Comments").child("me").child("photo1").updateChildValues(["user": "you","comment1":"cool pic"])
        databaseRef.child("Likes").child("me").child("photo1").updateChildValues(["user": "you"])
        
        databaseRef.child("Following").child("you").child("following").updateChildValues(["me":"me", "her":"her"])
        databaseRef.child("Photo").child("you").updateChildValues(["your_photo1": "https://firebasestorage.googleapis.com/v0/b/database-setup.appspot.com/o/dog1.jpg?alt=media&token=8b17faae-babb-4e8b-a8ff-16bde28b72a8"])
        databaseRef.child("Photo").child("you").updateChildValues(["your_photo2": "https://firebasestorage.googleapis.com/v0/b/database-setup.appspot.com/o/dog2.jpg?alt=media&token=44e77ce8-8555-419d-9d45-a2b948e9247c"])
        databaseRef.child("Photo").child("you").updateChildValues(["your_photo3": "https://firebasestorage.googleapis.com/v0/b/database-setup.appspot.com/o/dog3.jpg?alt=media&token=713c2441-1930-458a-b2d0-96a4715929cf"])
        databaseRef.child("User").child("you").updateChildValues(["username": "you", "profile_photo":"https://firebasestorage.googleapis.com/v0/b/database-setup.appspot.com/o/dog3.jpg?alt=media&token=713c2441-1930-458a-b2d0-96a4715929cf","email":"test1@test.com"])
        databaseRef.child("Comments").child("you").child("your_photo1").updateChildValues(["user": "me","comment1":"WOW"])
        databaseRef.child("Comments").child("you").child("your_photo1").updateChildValues(["user": "me","comment1":"Those bats are huge!"])
        databaseRef.child("Likes").child("you").child("your_photo1").updateChildValues(["user": "me"])
        
        databaseRef.child("Following").child("her").child("following").updateChildValues(["me":"me"])
        databaseRef.child("Photo").child("her").updateChildValues(["her_photo1": "https://firebasestorage.googleapis.com/v0/b/database-setup.appspot.com/o/cat1.jpg?alt=media&token=872dd296-6c10-48a3-a52d-c3740d8dcb2b"])
        databaseRef.child("Photo").child("her").updateChildValues(["her_photo2": "https://firebasestorage.googleapis.com/v0/b/database-setup.appspot.com/o/cat2.jpg?alt=media&token=e67566f2-4b9d-4be8-bea7-528de95a6b76"])
        databaseRef.child("Photo").child("her").updateChildValues(["her_photo3": "https://firebasestorage.googleapis.com/v0/b/database-setup.appspot.com/o/cat3.jpeg?alt=media&token=137e169e-e3fa-4731-a50b-8684342c3cd0"])
        databaseRef.child("Photo").child("her").updateChildValues(["her_photo4": "https://firebasestorage.googleapis.com/v0/b/database-setup.appspot.com/o/cat4.jpg?alt=media&token=9c564305-a466-429c-8054-5cfb735cfb84"])
        databaseRef.child("User").child("her").updateChildValues(["username": "her", "profile_photo":"https://firebasestorage.googleapis.com/v0/b/database-setup.appspot.com/o/cat4.jpg?alt=media&token=9c564305-a466-429c-8054-5cfb735cfb84","email":"test2@test.com"])
        databaseRef.child("Comments").child("her").child("her_photo1").updateChildValues(["user": "you","comment1":"Cool!"])
        databaseRef.child("Comments").child("her").child("her_photo1").updateChildValues(["user": "me","comment1":"lorem this picture is offensive take it down!!"])
        databaseRef.child("Comments").child("her").child("her_photo2").updateChildValues(["user": "you","comment1":"much better"])
        databaseRef.child("Comments").child("her").child("her_photo1").updateChildValues(["user": "you","comment1":"No Me its cool!"])
        databaseRef.child("Likes").child("her").child("her_photo1").updateChildValues(["user": "me"])
        databaseRef.child("Likes").child("her").child("her_photo1").updateChildValues(["user": "you"])
        databaseRef.child("Likes").child("her").child("her_photo2").updateChildValues(["user": "me"])
        databaseRef.child("Likes").child("her").child("her_photo3").updateChildValues(["user": "you"])
        
        
    }
}

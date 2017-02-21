//
//  ProfileViewController.swift
//  wip_meenagram
//
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var displayNameText: UILabel!
    @IBOutlet weak var bioText: UITextView!
    
    var databaseRef: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        databaseRef = FIRDatabase.database().reference()
        
        if let userID = FIRAuth.auth()?.currentUser?.uid{
            print(userID)
            databaseRef.child("profile").child(userID).observeSingleEvent(of: .value, with: { (snapshot) in
                
                let dictionary = snapshot.value as? NSDictionary
                
                let username = dictionary?["username"] as? String ?? "username"
                let display = dictionary?["display"] as? String ?? "display"
                let bio = dictionary?["bio"] as? String ?? "bio"
                if let profileImageURL = dictionary?["photo"] as? String{
                    
                    let url = URL(string: profileImageURL)
                    
                    URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                        if error != nil{
                            print(error!)
                            return
                        }
                        DispatchQueue.main.async {
                            self.profileImageView.image = UIImage(data: data!)
                        }
                    }).resume()
                }
                self.usernameText.text = username
                self.displayNameText.text = display
                self.bioText.text = bio
            }) { (error) in
                print(error.localizedDescription)
                return
            }
        }
    }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

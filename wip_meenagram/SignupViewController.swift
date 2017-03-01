//
//  SignupViewController.swift
//

import UIKit
import Firebase


class SignupViewController: UIViewController {

    var databaseRef: FIRDatabaseReference!
    let default_photo = "https://firebasestorage.googleapis.com/v0/b/meenagram-ac342.appspot.com/o/empty-profile.png?alt=media&token=0885c80a-8eab-4e66-a9d4-548d5527b773"

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        databaseRef = FIRDatabase.database().reference()
        
    }
    
    func signup(email:String, password:String){
       FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
        
        if error != nil{
            print(error!)
            return
        }else{
            
            self.createProfile(user!)
            let homePVC = RootPageViewController()
            self.present(homePVC, animated: true, completion: nil )
        }
       })
    }
    
    func createProfile(_ user: FIRUser){
        let delimiter = "@"
        guard let email = user.email else{return}
        let uName = email.components(separatedBy: delimiter)
    
        //let newUser:[String: String] = ["username": uName[0],
                       //"email": email]
        
        let user_object = User(bio: "", display: "", email: email, photo: default_photo, username: uName[0])
        
        self.databaseRef.child("profile").child(user.uid).updateChildValues(user_object.getUser()  as! [AnyHashable : Any]) { (error, ref) in
            if error != nil{
                print(error!)
                return
            }
            print("Profile successfully created")
        }

    }
    
    @IBAction func signupButtonAction(_ sender: Any) {
        guard let email = emailText.text, let password = passwordText.text else{return}
        signup(email: email, password: password)
        
    }

}

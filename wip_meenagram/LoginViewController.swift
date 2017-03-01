//
//  LoginViewController.swift
//  wip_meenagram

//

import UIKit
import Firebase


class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if FIRAuth.auth()?.currentUser?.uid != nil{
            print("User is logged in")
            //goToHome()
        }else{
            print("NOT logged in")
        }
    }
    
    func login(){
       FIRAuth.auth()?.signIn(withEmail: emailText.text!, password: passwordText.text!, completion: { (user, error) in
        if error != nil{
            print(error!)
            return
        }
        
        self.goToHome()
       })
    }
    
    func goToHome(){
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomePVC") as! UIPageViewController
        self.present(homeVC, animated: true, completion: nil)

    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        login()
    }

}

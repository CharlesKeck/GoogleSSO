//
//  ViewController.swift
//  GoogleSSO
//
//  Created by Charles on 20/1/20.
//  Copyright © 2020 Charles. All rights reserved.
//

import UIKit
import GoogleSignIn
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //toggleAuthUI()
    }
    @IBOutlet weak var btnGoogleSignIn: GIDSignInButton!

    @IBOutlet weak var username: UILabel!
    
    @IBAction func btnGoogleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
 
        if (AppDelegate.googleUser == nil){
            GIDSignIn.sharedInstance().signIn()
            
            
        } else {
            GIDSignIn.sharedInstance()?.restorePreviousSignIn()
            
        }
         toggleAuthUI()
        
        
    }
    
    @IBOutlet weak var UserImage: UIImageView!
    override func viewDidAppear(_ animated: Bool) {
        toggleAuthUI()
    }
    
    func toggleAuthUI() {
        if let _ = GIDSignIn.sharedInstance()?.currentUser?.authentication {
            username.text = "Hello, \(String((AppDelegate.googleUser?.profile.name)!))."
            var u:String = (AppDelegate.googleUser?.profile.imageURL(withDimension: 200)!.absoluteString)!
            //print(u)
            let url = URL(string: u)
            UserImage.kf.setImage(with: url)
        } else {
            username.text = "Please Login"
        }
    }
    
    @IBAction func SignOut(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signOut()
        //btnSignIn.isEnabled = true
        //btnSignOut.isEnabled = false
        username.text = "Logout"
    }
}


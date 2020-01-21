//
//  ViewController.swift
//  GoogleSSO
//
//  Created by Charles on 20/1/20.
//  Copyright © 2020 Charles. All rights reserved.
//

import UIKit
import GoogleSignIn

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
    
    override func viewDidAppear(_ animated: Bool) {
        toggleAuthUI()
    }
    
    func toggleAuthUI() {
        if let _ = GIDSignIn.sharedInstance()?.currentUser?.authentication {
            username.text = "Hello, \(String((AppDelegate.googleUser?.profile.name)!))."
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


//
//  LoginViewController.swift
//  Twitter
//
//  Created by hpuma on 3/6/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Once page shows up, what should be done next?
    override func viewDidAppear(_ animated: Bool) {
        // Check if user is logged in by looking at the userLoggedIn flag
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl , success: {
            // To get user to stay logged in we set this userLoggedIn flag to true
            UserDefaults.standard.setValue(true, forKey: "userLoggedIn")
            // Once we log in, make the transition to the other view
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not log in")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

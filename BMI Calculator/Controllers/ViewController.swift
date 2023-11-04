//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Ujjwal Singh on 31/08/22.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, UIApplicationDelegate{

    @IBOutlet weak var btn: UIButton!
    
    
    let signInConfig = GIDConfiguration(clientID: "435488154297-e1mcs3r9qq4egefko9etjbl0ssmeda2p.apps.googleusercontent.com")
    // 461843155847-o2fi5vj3sa1jmhmgjqmp6inr79khqinn.apps.googleusercontent.com
    // com.googleusercontent.apps.461843155847-o2fi5vj3sa1jmhmgjqmp6inr79khqinn
    override func viewDidLoad() {
        super.viewDidLoad()
        btn.setImage(UIImage(named: "google-signin-button"), for: .normal)
      // GIDSignIn.sharedInstance.presentingViewController = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
            guard error == nil , let user = user else { return }
            
          // guard let user = user else { return }

            let emailAddress = user.profile?.email
            let userName = user.profile?.name
            let firstName = user.profile?.givenName
            let lastName = user.profile?.familyName
            let imageUrl = user.profile?.imageURL(withDimension: 200)
            let serverClientId = user.serverClientID
           // let serverClientId = user.
    
          //  self.performSegue(withIdentifier: "goToCalculate", sender: self)
            let calculateVC = self.storyboard?.instantiateViewController(withIdentifier: "CalculateViewController") as! CalculateViewController
            self.present(calculateVC, animated: true, completion: nil)
            
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
    
    func application(
      _ app: UIApplication,
      open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
      var handled: Bool

      handled = GIDSignIn.sharedInstance.handle(url)
      if handled {
        return true
      }

      // Handle other custom URL types.

      // If not handled by this app, return false.
      return false
    }
}

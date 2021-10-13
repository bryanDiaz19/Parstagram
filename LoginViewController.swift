//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Bryan Diaz  on 10/12/21.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        let user = PFUser()
        user.username = username.text
        user.password = password.text
        user.signUpInBackground { success, error in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error:\( error?.localizedDescription )")
            }
        }
    }
    @IBAction func logIn(_ sender: Any) {
        let username = username.text!
        let password = password.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user, error ) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else {
                print("Error:\( error?.localizedDescription )")
            }
           
        }
        
        
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

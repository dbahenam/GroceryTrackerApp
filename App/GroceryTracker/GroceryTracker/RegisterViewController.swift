//
//  RegisterViewController.swift
//  GroceryTracker
//
//  Created by David Bahena Moctezuma on 5/20/22.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
  @IBOutlet weak var emailTextField: UITextField!
  
  @IBOutlet weak var passwordTextField: UITextField!
  
  @IBAction func registeredPressed(_ sender: UIButton) {
	  if let email = emailTextField.text, let password = passwordTextField.text{
	
	  Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
		// ...
		if let e = error{
		  print(e.localizedDescription) // we can add pop up to print this string as error message to user
		  // password: Abcd456
		}
		else{
		  self.performSegue(withIdentifier: "RegisterToLogin", sender: self)
		}
	  }
	  
	}
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

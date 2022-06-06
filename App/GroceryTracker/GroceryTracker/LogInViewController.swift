//
//  LogInViewController.swift
//  GroceryTracker
//
//  Created by David Bahena Moctezuma on 5/13/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  var dataManager = DataManager()
  @IBAction func LogInButton(_ sender: UIButton) {
	if let email = emailTextField.text, let password = passwordTextField.text{
	
	Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
	  guard let self = self else { return }
	  // ...
	  if let e = error{
		print(e.localizedDescription) // we can add pop up to print this string as error message to user
		// password: Abcd456
	  }
	  else{
		self.performSegue(withIdentifier: "LoginToItems", sender: self)
	  }
	}
  }
}
}

//
//  RegisterVC.swift
//  Artable
//
//  Created by German Hernandez on 28/03/2019.
//  Copyright © 2019 German Hernandez. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordFieldText: UITextField!
    @IBOutlet weak var activityIndicartorView: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImage: UIImageView!
    @IBOutlet weak var confirmCheckImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        confirmPasswordFieldText.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    // MARK: - Methods
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let passText = passwordTextField.text else { return }
        
        if textField == confirmPasswordFieldText {
            
            passCheckImage.isHidden = false
            confirmCheckImage.isHidden = false
            
        }
        else if passText.isEmpty {
            
            passCheckImage.isHidden = true
            confirmCheckImage.isHidden = true
            confirmPasswordFieldText.text = ""
            
        }
        
        if passwordTextField.text == confirmPasswordFieldText.text {
            
            passCheckImage.image = UIImage(named: AppImages.GreenCheck)
            confirmCheckImage.image = UIImage(named: AppImages.GreenCheck)
            
        }
        else {
            
            passCheckImage.image = UIImage(named: AppImages.RedCheck)
            confirmCheckImage.image = UIImage(named: AppImages.RedCheck)
            
        }
        
    }

    @IBAction func registerButtonPressed(_ sender: UIButton) {
        
        guard let email = emailTextField.text , email.isNotEmpty ,
            let username = usernameTextField.text , username.isNotEmpty ,
            let password = passwordTextField.text , password.isNotEmpty else { return }
        
        activityIndicartorView.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            
            if let error = error {
                
                debugPrint(error)
                
                return
            }
            
            self.activityIndicartorView.stopAnimating()
            
            print("Successfully registered new user.")
            
        }
        
    }
    
}

//
//  CreateAccountVC.swift
//  Smack
//
//  Created by Ken Krippeler on 21.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController
{
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }

    @IBAction func createAccountPressed(_ sender: UIButton)
    {
        guard let email = emailText.text , emailText.text != "" else{ return }
        guard let password = passwordText.text , passwordText.text != "" else{ return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
                if success
                {
                    print("registered user!")
                }
            }
    }
    
    @IBAction func pickAvatarPressed(_ sender: UIButton)
    {
    
    }
    
    @IBAction func pickbackgroundColorPressed(_ sender: UIButton)
    {
    
    }
    
    @IBAction func closePressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}

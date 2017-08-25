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
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        if UserDataService.instance.avatarName != ""
        {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }

    @IBAction func createAccountPressed(_ sender: UIButton)
    {
        guard let name = usernameText.text , usernameText.text != "" else{ return }
        guard let email = emailText.text , emailText.text != "" else{ return }
        guard let password = passwordText.text , passwordText.text != "" else{ return }
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
                if success
                {
                    AuthService.instance.loginUser(email: email, password: password, completion:
                        {(success) in
                            if success
                            {
                                AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: {(success) in
                                        if success
                                        {
                                            print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                            self.performSegue(withIdentifier: UNWIND, sender: nil)
                                        }
                                    })
                            }
                        })
                }
            }
    }
    
    @IBAction func pickAvatarPressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func pickbackgroundColorPressed(_ sender: UIButton)
    {
    
    }
    
    @IBAction func closePressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}

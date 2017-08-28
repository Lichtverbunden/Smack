//
//  LoginVC.swift
//  Smack
//
//  Created by Ken Krippeler on 21.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class LoginVC: UIViewController
{
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func closePressed(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountButtonPressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func loginPressed(_ sender: UIButton)
    {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = usernameText.text, usernameText.text != "" else {return}
        guard let password = passwordText.text, passwordText.text != "" else {return}
        
        AuthService.instance.loginUser(email: email, password: password)
        { (success) in
            if success
            {
                AuthService.instance.findUserByEmail(completion:
                    {(success) in
                        if success
                        {
                            NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            self.spinner.isHidden = true
                            self.spinner.stopAnimating()
                            
                            self.dismiss(animated: true, completion: nil)
                        }
                    })
            }
        }
    }
    
    func setupView()
    {
        spinner.isHidden = true
        usernameText.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        passwordText.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap()
    {
        view.endEditing(true)
    }
    
    
    

}

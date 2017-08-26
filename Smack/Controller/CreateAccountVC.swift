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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var backgroundColor: UIColor?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        if UserDataService.instance.avatarName != ""
        {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            
            if avatarName.contains("light") && backgroundColor == nil
            {
                userImage.backgroundColor = UIColor.lightGray
            }
        }
    }

    @IBAction func createAccountPressed(_ sender: UIButton)
    {
        spinner.isHidden = false
        spinner.startAnimating()
        
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
                                            self.spinner.isHidden = true
                                            self.spinner.stopAnimating()
                                            self.performSegue(withIdentifier: UNWIND, sender: nil)
                                            NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
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
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.4)
        {
            self.userImage.backgroundColor = self.backgroundColor
        }
    }
    
    @IBAction func closePressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    func setupView()
    {
        spinner.isHidden = true
        usernameText.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        emailText.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        passwordText.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap()
    {
        view.endEditing(true)
    }
    
}

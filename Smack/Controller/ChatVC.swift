//
//  ChatVC.swift
//  Smack
//
//  Created by Ken Krippeler on 20.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class ChatVC: UIViewController
{

    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn
        {
            AuthService.instance.findUserByEmail(completion:
            {(success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
    }

   
}

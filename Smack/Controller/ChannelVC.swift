//
//  ChannelVC.swift
//  Smack
//
//  Created by Ken Krippeler on 20.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController
{
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
    }
    @IBAction func loginButtonPressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
}

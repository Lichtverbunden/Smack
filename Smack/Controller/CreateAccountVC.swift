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

    override func viewDidLoad()
    {
        super.viewDidLoad()

        
    }

    @IBAction func closePressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    
}

//
//  ProfileVC.swift
//  Smack
//
//  Created by Ken Krippeler on 27.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController
{
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func closeModalPressed(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutPressed(_ sender: UIButton)
    {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func setupView()
    {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.dismissView(_:)))
        view.addGestureRecognizer(tap)
        
        profileImage.image = UIImage(named: UserDataService.instance.avatarName)
        profileImage.backgroundColor = UserDataService.instance.returnColor(components: UserDataService.instance.avatarColor)
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        
    }
    
    @objc func dismissView(_ recognizer: UIGestureRecognizer)
    {
        dismiss(animated: true, completion: nil)
    }
}

//
//  ChannelVC.swift
//  Smack
//
//  Created by Ken Krippeler on 20.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userImage: CircleImage!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        setupUserInfo()
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton)
    {
        if AuthService.instance.isLoggedIn
        {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }
        else
        {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification)
    {
        setupUserInfo()
    }
    
    func setupUserInfo()
    {
        if AuthService.instance.isLoggedIn
        {
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnColor(components: UserDataService.instance.avatarColor)
        }
        else
        {
            loginButton.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return MessageService.instance.channels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell
        {
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            
            return cell
        }
        else
        {
            return ChannelCell()
        }
    }
}

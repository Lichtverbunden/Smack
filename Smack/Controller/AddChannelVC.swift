//
//  AddChannelVC.swift
//  Smack
//
//  Created by Ken Krippeler on 16.10.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController
{
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var channelDescriptionText: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func closeButtonPressed(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelPressed(_ sender: UIButton)
    {
    
    }
    
    func setupView()
    {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameText.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        channelDescriptionText.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer)
    {
        dismiss(animated: true, completion: nil)
    }
}

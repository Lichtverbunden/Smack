//
//  AvatarPickerVC.swift
//  Smack
//
//  Created by Ken Krippeler on 25.08.17.
//  Copyright © 2017 Lichtverbunden. All rights reserved.
//

import UIKit

class AvatarPickerVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    var avatarType = AvatarType.dark
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarCell
        {
            cell.configureCell(index: indexPath.item, type: avatarType)
            return cell
        }
        
        return AvatarCell()
    }

    @IBAction func backPressed(_ sender: UIButton)
    {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl)
    {
        if segmentControl.selectedSegmentIndex == 0
        {
            avatarType = AvatarType.dark
        }
        else if segmentControl.selectedSegmentIndex == 1
        {
            avatarType = AvatarType.light
        }
        
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        var numberOfColumns: CGFloat = 3
        
        if UIScreen.main.bounds.width > 320
        {
            numberOfColumns = 4
        }
        
        let spaceBetweenCells: CGFloat = 10
        let padding: CGFloat = 40
        let cellDimension = ((collectionView.bounds.width - padding) - (numberOfColumns - 1) * spaceBetweenCells) / numberOfColumns
        
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        if avatarType == .dark
        {
            UserDataService.instance.setAvatarName(avatarName: "dark\(indexPath.item)")
        }
        else
        {
            UserDataService.instance.setAvatarName(avatarName: "light\(indexPath.item)")
        }
        self.dismiss(animated: true, completion: nil)
    }
}

//
//  ViewController.swift
//  Tong_Collectionview_flow_layout
//
//  Created by Tong Yi on 5/18/20.
//  Copyright © 2020 Tong Yi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
   
   @IBOutlet var myCollectionView: UICollectionView!
    
    let data = dataSouce
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI()
    {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
    }
    
    //MARK: - Collection View Data Source and Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.titleLabel.text = data[indexPath.row].title
        cell.detailLabel.text = data[indexPath.row].detail
        
        if indexPath.row % 2 == 1
        {
            cell.backgroundColor = UIColor.systemRed.withAlphaComponent(0.3)
        }
        else
        {
            cell.backgroundColor = UIColor(red: 253.0/255.0, green: 240.0/255.0, blue: 196.0/255.0, alpha: 1)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath)!
        if cell.isSelected
        {
            cell.backgroundColor = UIColor(red: 200.0/255.0, green: 220.0/255.0, blue: 196.0/255.0, alpha: 1)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)!
        
        if indexPath.row % 2 == 1
        {
            cell.backgroundColor = UIColor.systemRed.withAlphaComponent(0.3)
        }
        else
        {
            cell.backgroundColor = UIColor(red: 253.0/255.0, green: 240.0/255.0, blue: 196.0/255.0, alpha: 1)
        }
    }

}

//

extension ViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bound = myCollectionView.bounds
        return CGSize(width: bound.width - 20, height: 145)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


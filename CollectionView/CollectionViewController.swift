//
//  CollectionViewController.swift
//  CollectionView
//
//  Created by 原田摩利奈 on 3/6/23.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var saveData: UserDefaults = UserDefaults.standard
    var titles: [String] = []
    
    var selectedTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveData.register(defaults: ["titles": []])
        titles = saveData.object(forKey: "titles") as! [String]
    
        print(titles)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        var contentConfiguration = UIListContentConfiguration.cell()
        contentConfiguration.text = titles[indexPath.item]
        cell.contentConfiguration = contentConfiguration
        return cell
    }
    
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("aa")
        selectedTitle  = titles[indexPath.item]
        if selectedTitle != nil {
            performSegue(withIdentifier: "toView",sender: nil)
        }
        
    }
        override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toView") {
            let subVC: SelectedViewController = (segue.destination as? SelectedViewController)!
            subVC.titles = selectedTitle
        }
    }
    
}


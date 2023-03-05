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
    
    
    // Cell が選択された場合
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        print("aa")
        // [indexPath.row] から画像名を探し、UImage を設定
        selectedTitle  = titles[indexPath.item]
        if selectedTitle != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegue(withIdentifier: "toView",sender: nil)
        }
        
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toView") {
            let subVC: SelectedViewController = (segue.destination as? SelectedViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            subVC.title = selectedTitle
        }
    }
    
}


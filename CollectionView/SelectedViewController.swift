//
//  SelectedViewController.swift
//  CollectionView
//
//  Created by 原田摩利奈 on 3/6/23.
//

import UIKit

class SelectedViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!

    var titles: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        titleLabel.text = titles
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

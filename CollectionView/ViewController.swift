//
//  TodoViewController.swift
//  Lit-TodoApp
//
//  Created by 原田摩利奈 on 1/19/23.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveData.register(defaults: ["titles" : []])
        
        titles = saveData.object(forKey:"titles") as! [String]
        
        print(titles)
        
        titleTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveButton() {
        
        let title = titleTextField.text!
        titles.append(title)
        
        saveData.set(titles, forKey: "titles")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message:"メモの保存が完了しました。", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    //ボタンが押された時の動作
                    self.performSegue(withIdentifier: "toCollectionVIew", sender: nil)
                }
            )
        )
        
        present(alert, animated: true, completion: nil)
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
    
}

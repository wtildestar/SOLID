//
//  ViewController.swift
//  SingleResponsibilityPrinciple
//
//  Created by wtildestar on 19/12/2019.
//  Copyright © 2019 wtildestar. All rights reserved.
//

import UIKit

struct Posts: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

class ViewController: UIViewController {
    
    let urlString = "https://jsonplaceholder.typicode.com/posts"
    
    var networkService = NetworkService()
    let dataStore = DataStore()
    
    // Элементы пользовательского интерфейса
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = saveButton.frame.width / 2
        
        networkService.dataFetcher(urlString: urlString)
    }

    // MARK: - Business logic
    
    // обработка имени
    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        dataStore.saveNameInCache(name: name)
    }

    // MARK: - User interface
    
    // Отображение интерфейса
    func showAlert() {
        let alert = UIAlertController(title: "WARNING", message: "Your name can't be empty", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Взаимодействие пользователя с интерфейсом
    
    @IBAction func changeLabel(_ sender: Any) {
        textLabel.text = myTextField.text
    }
    

    @IBAction func saveButtonTapped(_ sender: Any) {
        changeName()
    }
}


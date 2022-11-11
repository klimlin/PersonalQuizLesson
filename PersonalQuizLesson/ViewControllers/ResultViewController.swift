//
//  ResultViewController.swift
//  PersonalQuizLesson
//
//  Created by MAcbook on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
        // view.window?.rootViewController?.dismiss(animated: true)
    }

}

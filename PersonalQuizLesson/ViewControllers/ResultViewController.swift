//
//  ResultViewController.swift
//  PersonalQuizLesson
//
//  Created by MAcbook on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {

        
    @IBOutlet var resultLabel: UILabel!
    
    var resultAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        for answer in resultAnswers {
            print("\(answer.title) - \(answer.animal)")
        }
        
        showResult(resultAnimal: countResults())
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
        // view.window?.rootViewController?.dismiss(animated: true)
    }
    
    private func countResults() -> String {
        var countDog = 0
        var countCat = 0
        var countRabbit = 0
        var countTurtle = 0
        var maxNumber = 0
        var resultAnimal = ""
        
        for answer in resultAnswers {
            if answer.animal.definition == "🐶" {
                countDog += 1
            } else if answer.animal.definition == "🐱" {
                countCat += 1
            } else if answer.animal.definition == "🐰" {
                countRabbit += 1
            } else if answer.animal.definition == "🐢" {
                countTurtle += 1
            }
        }
        print(countDog, countCat, countRabbit, countTurtle)
        
        for animalItem in [countDog, countCat, countRabbit, countTurtle] {
            if animalItem >= maxNumber {
                maxNumber = animalItem
            }
        }
        
        if countDog == maxNumber {
            resultAnimal = "🐶"
        } else if countCat == maxNumber {
            resultAnimal = "🐱"
        } else if countRabbit == maxNumber {
            resultAnimal = "🐰"
        } else if countTurtle == maxNumber {
            resultAnimal = "🐢"
        }
        
        return resultAnimal
    }
    
    private func showResult(resultAnimal: String) {
        resultLabel.text = "Вы - \(resultAnimal)!"
    }
    

}

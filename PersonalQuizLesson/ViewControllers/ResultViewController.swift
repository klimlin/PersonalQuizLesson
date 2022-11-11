//
//  ResultViewController.swift
//  PersonalQuizLesson
//
//  Created by MAcbook on 10.11.2022.
//

import UIKit

class ResultViewController: UIViewController {

        
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    var resultAnswers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    
        let resultAnimal: [String] = countResults()
        showResult(resultAnimal: resultAnimal)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
        // view.window?.rootViewController?.dismiss(animated: true)
    }
    
    private func countResults() -> [String] {
        var countDog = 0
        var countCat = 0
        var countRabbit = 0
        var countTurtle = 0
        var maxNumber = 0
        var resultAnimal = ""
        var resultComment = ""
        
        for answer in resultAnswers {
            if answer.animal.definition == Animal.dog.definition {
                countDog += 1
            } else if answer.animal.definition == Animal.cat.definition {
                countCat += 1
            } else if answer.animal.definition == Animal.rabbit.definition {
                countRabbit += 1
            } else if answer.animal.definition == Animal.turtle.definition {
                countTurtle += 1
            }
        }
        
        for animalItem in [countDog, countCat, countRabbit, countTurtle] {
            if animalItem >= maxNumber {
                maxNumber = animalItem
            }
        }
        
        if countDog == maxNumber {
            resultAnimal = Animal.dog.definition
            resultComment = CommentAnimal.dog.comment
        } else if countCat == maxNumber {
            resultAnimal = Animal.cat.definition
            resultComment = CommentAnimal.cat.comment
        } else if countRabbit == maxNumber {
            resultAnimal = Animal.rabbit.definition
            resultComment = CommentAnimal.rabbit.comment
        } else if countTurtle == maxNumber {
            resultAnimal = Animal.turtle.definition
            resultComment = CommentAnimal.turtle.comment
        }
        
        return [resultAnimal, resultComment]
    }
    
    private func showResult(resultAnimal: [String]) {
        resultLabel.text = "Вы – \(resultAnimal.first ?? "")!"
        commentLabel.text = resultAnimal.last
    }
    

}

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
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.setHidesBackButton(true, animated: false) // hide button
        //navigationItem.hidesBackButton = true
    
        countResults()
        //showResult(resultAnimal: resultAnimal)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
        // view.window?.rootViewController?.dismiss(animated: true)
    }
    

}

extension ResultViewController {
    
    private func countResults() {
        var frequencyOfAnimals: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        
//        for animal in animals {
//            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0 ) + 1
//        }
        
//        for animal in animals {
//            frequencyOfAnimals[animal, default: 0] += 1
//        }
//
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else {return}

        
        // решение в одну строку
        
//        let mostFrequencyAnimal = Dictionary(grouping: answers) { $0.animal } .sorted {$0.value.count > $1.value.count} .first?.key
        
        showResult(resultAnimal: mostFrequencyAnimal)
        
    }
    
    private func showResult(resultAnimal: Animal) {
        resultLabel.text = "Вы – \(resultAnimal.rawValue)!"
        commentLabel.text = resultAnimal.definition
    }
    
//    private func countResults() -> [String] {
//        var countDog = 0
//        var countCat = 0
//        var countRabbit = 0
//        var countTurtle = 0
//        var maxNumber = 0
//        var resultAnimal = ""
//        var resultComment = ""
//
//        for answer in resultAnswers {
//            if answer.animal.definition == Animal.dog.definition {
//                countDog += 1
//            } else if answer.animal.definition == Animal.cat.definition {
//                countCat += 1
//            } else if answer.animal.definition == Animal.rabbit.definition {
//                countRabbit += 1
//            } else if answer.animal.definition == Animal.turtle.definition {
//                countTurtle += 1
//            }
//        }
//
//        for animalItem in [countDog, countCat, countRabbit, countTurtle] {
//            if animalItem >= maxNumber {
//                maxNumber = animalItem
//            }
//        }
//
//        if countDog == maxNumber {
//            resultAnimal = Animal.dog.definition
//            resultComment = CommentAnimal.dog.comment
//        } else if countCat == maxNumber {
//            resultAnimal = Animal.cat.definition
//            resultComment = CommentAnimal.cat.comment
//        } else if countRabbit == maxNumber {
//            resultAnimal = Animal.rabbit.definition
//            resultComment = CommentAnimal.rabbit.comment
//        } else if countTurtle == maxNumber {
//            resultAnimal = Animal.turtle.definition
//            resultComment = CommentAnimal.turtle.comment
//        }
//
//        return [resultAnimal, resultComment]
//    }
    
}

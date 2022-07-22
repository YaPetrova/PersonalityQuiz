//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var animalLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    var answers: [Answer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        resultCounting()
    }
    
    private func resultCounting() {
        var animalResultCount: [Animal: Int] = [:]
        var animals: [Animal] = []
        
        for answer in answers {
            animals.append(answer.animal)
        }
        
        for animal in animals {
            animalResultCount[animal] = (animalResultCount[animal] ?? 0) + 1
        }
        
        guard let maxAnimalResultCount = animalResultCount.max {$0.value < $1.value}?.key else {return}
        
        updateUI(with: maxAnimalResultCount)
    }
        
    private func updateUI(with animal: Animal) {
        animalLabel.text = "Вы - \(animal.rawValue)!"
        definitionLabel.text = animal.definition        
    }
}

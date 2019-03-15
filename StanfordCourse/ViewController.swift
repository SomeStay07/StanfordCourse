//
//  ViewController.swift
//  StanfordCourse
//
//  Created by Тимур Чеберда on 15/03/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // счётчик нажатия
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" }}
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    // массив наших ёмодзи
    var emojiChoices = ["👻","🥶","👻","🥶"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        // нажатие +
        flipCount += 1
        // пусть переменная будет = индексу массива и задействует метод
        if let cardNumber = cardButtons.firstIndex(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
    }
    // метод просмотра карт
    func flipCard(withEmoji emoji: String, on button: UIButton){
        // если эмодзи = эмодзи из массива то переварачиваем
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            // иначе ставим эмодзи из массива, когда карта рубашкой вверх
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}


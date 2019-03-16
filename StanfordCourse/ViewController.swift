//
//  ViewController.swift
//  StanfordCourse
//
//  Created by Тимур Чеберда on 15/03/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // экземпляр класса, где количество кнопок div на 2 = числу пар
    lazy var game = Concentration(numbersOfPairsOfCards: (cardButtons.count + 1) / 2)
    // счётчик нажатия
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" }}
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        // нажатие +
        flipCount += 1
        // переменная будет = индексу массива и задействует метод
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    // посмотреть на карты, поднятие и соответствие
    func updateViewFromModel(){
        for index in cardButtons.indices {
            // кнопка = конкретной кнопки
            let button = cardButtons[index]
            // карта = конкретной карте
            let card = game.cards[index]
            // если карта не поднята
            if card.isFaceUp {
                // назначаем эмодзи и цвет
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                // опускаем карту и делаем рубашку оранжевым цветом
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    // массив наших ёмодзи
    var emojiChoices = ["🧞‍♂️","🦹🏾‍♂️","👻","🥶","🧶","🦄","🍄"]
    
    var emoji = [Int:String]()
    // эмодзи для карты
    func emoji(for card: Card) -> String {
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            // берем эмодзи из массива эмодзи
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            // вставляем случайный эмодзи в словарь
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        // проверка на nil
        return emoji[card.identifier] ?? "?"
    }
}


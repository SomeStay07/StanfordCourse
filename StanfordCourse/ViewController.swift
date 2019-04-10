//
//  ViewController.swift
//  StanfordCourse
//
//  Created by Тимур Чеберда on 15/03/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // количество кнопок div на 2 = числу пар
    private lazy var game = Concentration(numbersOfPairsOfCards: numberOfPairsOfCards)
    var numberOfPairsOfCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private var emojiChoices = [String] ()
    private var backgroundColor = UIColor.black
    private var cardBackColor = UIColor.orange
    
    
    @IBOutlet weak var scoreText: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet private weak var flipCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indexTheme = Int.random(in: 0..<emojiThemes.count)
        updateViewFromModel()
    }
    
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game.resetGame()
        indexTheme = Int.random(in: 0..<emojiThemes.count)
        updateViewFromModel()
    }
    // посмотреть на карты, поднятие и соответствие
    private func updateViewFromModel(){
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
        scoreLabel.text = "\(game.score)"
        flipCountLabel.text = "Кликов: \(game.flipCount)"
    }

    private var emojiThemes: [GameTheme] = [
        GameTheme(name: "Фрукты",
                  emojis:["🍏", "🍊", "🍓", "🍉", "🍇", "🍒", "🍌", "🥝", "🍆", "🍑", "🍋"],
                  viewColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1),
                  cardColor: #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1)),
        GameTheme(name: "Лица",
                  emojis:["😀", "😂", "🤣", "😃", "😄", "😅", "😆", "😉", "😊", "😋", "😎"],
                  viewColor: #colorLiteral(red: 1, green: 0.8999392299, blue: 0.3690503591, alpha: 1),
                  cardColor: #colorLiteral(red: 0.5519944677, green: 0.4853407859, blue: 0.3146183148, alpha: 1)),
        GameTheme(name: "Активности",
                  emojis:["⚽️", "🏄‍♂️", "🏑", "🏓", "🚴‍♂️","🥋", "🎸", "🎯", "🎮", "🎹", "🎲"],
                  viewColor: #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1),
                  cardColor: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)),
        GameTheme(name: "Животные",
                  emojis:["🐶", "🐭", "🦊", "🦋", "🐢", "🐸", "🐵", "🐞", "🐿", "🐇", "🐯"],
                  viewColor: #colorLiteral(red: 0.8306297664, green: 1, blue: 0.7910112419, alpha: 1),
                  cardColor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)),
        GameTheme(name: "Рождество",
                  emojis:["🎅", "🎉", "🦌", "⛪️", "🌟", "❄️", "⛄️","🎄", "🎁", "🔔", "🕯"],
                  viewColor: #colorLiteral(red: 0.9678710938, green: 0.9678710938, blue: 0.9678710938, alpha: 1),
                  cardColor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)),
        GameTheme(name: "Одежда",
                  emojis:["👚", "👕", "👖", "👔", "👗", "👓", "👠", "🎩", "👟", "⛱","🎽"],
                  viewColor: #colorLiteral(red: 0.9098039269, green: 0.7650054947, blue: 0.8981300767, alpha: 1),
                  cardColor: #colorLiteral(red: 0.5818830132, green: 0.2156915367, blue: 1, alpha: 1)),
        GameTheme(name: "Хэллуин",
                  emojis:["💀", "👻", "👽", "🙀", "🦇", "🕷", "🕸", "🎃", "🎭","😈", "⚰"],
                  viewColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
                  cardColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)),
        GameTheme(name: "Транспорт",
                  emojis:["🚗", "🚓", "🚚", "🏍", "✈️", "🚜", "🚎", "🚲", "🚂", "🛴"],
                  viewColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),
                  cardColor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
    ]
    
    private var indexTheme = 0 {
        didSet {
            emoji = [Int: String]()
            emojiChoices = emojiThemes[indexTheme].emojis
            
            titleLabel.text = emojiThemes[indexTheme].name
            backgroundColor = emojiThemes[indexTheme].viewColor
            cardBackColor = emojiThemes[indexTheme].cardColor
            
            updateAppearance()
        }
    }
    
    private func updateAppearance() {
        view.backgroundColor = backgroundColor
        flipCountLabel.textColor = cardBackColor
        titleLabel.textColor = cardBackColor
        scoreLabel.textColor = cardBackColor
        newGame.setTitleColor(backgroundColor, for: .normal)
        newGame.backgroundColor = cardBackColor
        scoreText.textColor = cardBackColor
    }
    
    private var emoji = [Int: String]()
    // эмодзи для карты
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            // вставляем случайный эмодзи в словарь
            emoji[card.identifier] = emojiChoices.remove(at: Int.random(in: 0..<emojiChoices.count))
        }
        // проверка на nil
        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


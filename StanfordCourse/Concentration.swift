//
//  Concentration.swift
//  StanfordCourse
//
//  Created by Тимур Чеберда on 15/03/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import Foundation

struct Concentration {
    // массив с картами
    private(set) var cards = [Card] ()
    // счетчик нажатий
    private(set) var flipCount = 0
    private(set) var score = 0
    private var seenCards: Set<Int> = []
    
    private struct Points {
        static let matchBonus = 2
        static let missMatchPenalty = 1
    }
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get{
            return cards.indices.filter { cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    // метод выбора карты
    mutating func chooseCard(at index: Int) {
        // Проверяем на аргументы
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        //  если поднята то опускаем
        if !cards[index].isMatched {
            flipCount += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // проверка на соответствие
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    // + очки
                    score += Points.matchBonus
                } else {
                    if seenCards.contains(index) {
                        score -= Points.missMatchPenalty
                    }
                    if seenCards.contains(matchIndex) {
                        score -= Points.missMatchPenalty
                    }
                    seenCards.insert(index)
                    seenCards.insert(matchIndex)
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    // новая игра
    mutating func resetGame() {
        flipCount = 0
        seenCards = []
        score = 0
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        cards.shuffle()
    }
    // инцилизатор для создания кол-ва карт
    init(numbersOfPairsOfCards: Int) {
        // Проверяем на аргументы
        assert(numbersOfPairsOfCards > 0, "Concentration.init(\(numbersOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numbersOfPairsOfCards {
            // создаем карту
            let card = Card()
            // помещаем копию карты
            // другая копия карты, отличается от предыдущей копии
            cards += [card, card]
        }
        // замешиваем карты
        cards.shuffle()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}

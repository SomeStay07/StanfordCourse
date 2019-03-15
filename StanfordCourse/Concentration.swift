//
//  Concentration.swift
//  StanfordCourse
//
//  Created by Тимур Чеберда on 15/03/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card] ()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    // нужно решить 3 вопроса
    // 1) Карты не подняты, 2) Карта открыта и ищет соответствие 3) карты соответствуют друг другу
    func chooseCard(at index: Int) {
        //  если поднята то опускаем
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // проверка на соответствие
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            // не подняты или 2 но не соответствуют
            for flipDownIndex in cards.indices {
                cards[flipDownIndex].isFaceUp = false
            }
            cards[index].isFaceUp = true
            indexOfOneAndOnlyFaceUpCard = index
        }
    }
    // инцилизатор для создания кол-ва карт
    init(numbersOfPairsOfCards: Int) {
        for _ in 1...numbersOfPairsOfCards {
            // создаем карту
            let card = Card()
            // помещаем копию карты
            // другая копия карты, отличается от предыдущей копии
            cards += [card, card]
        }
        // TODO: Домашнее задание - замешать карты на разные позиции ( рядом стоящие карты равный на данный момент)
        // домашнее задание выполнено!
        cards.shuffle()
    }
}

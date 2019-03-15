//
//  Card.swift
//  StanfordCourse
//
//  Created by Тимур Чеберда on 15/03/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import Foundation

struct Card {
    // поднятие
    var isFaceUp = false
    //соответствие
    var isMatched = false
    // уникальность карт 
    var identifier: Int
    // переменная для уникальных карт
    static var identifierFactory = 0
    
    // делаем метод для реализации уникальности карт
    static func getUniqueIdentifier() -> Int {
        // вводим инкремент для различия карт по уникальности
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

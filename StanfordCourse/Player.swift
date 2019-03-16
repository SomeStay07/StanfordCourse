//
//  Player.swift
//  StanfordCourse
//
//  Created by Тимур Чеберда on 16/03/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import Foundation

class Player {
    // создаём экземпляр для отслеживания прогресса игрока
    var tracker = LevelTracker()
    let playerName: String
    // метод вызываемый в конце уровня
    // открывает следующий уровень
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    
    init(name: String) {
        playerName = name
    }
}

//
//  LevelTracker.swift
//  StanfordCourse
//
//  Created by Тимур Чеберда on 16/03/2019.
//  Copyright © 2019 Tmur Cheberda. All rights reserved.
//

import Foundation
//  структура следит за самым последним уровнем игрока
struct LevelTracker {
    // доступный уровень
    static var highestUnlockedLevel = 1
    // отслеживаем текущий прогресс
    var currentLevel = 1
    // обновляет значение уровня, каждый раз когда открывается новый уровень
    static func unlock(_ level: Int){
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    // возвращаем true, если конкретный уровень уже разблокирован
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    // Не обязательно должно быть ошибкой игнорирование результата работы функции
    @discardableResult mutating func advance(to level: Int) -> Bool {
        // проверяем доступ к новому уровню
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

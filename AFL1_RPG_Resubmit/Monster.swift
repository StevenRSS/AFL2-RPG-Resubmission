//
//  Monster.swift
//  AFL1_RPG_Resubmit
//
//  Created by MacBook Pro on 08/06/23.
//

import Foundation

class Monster: MonsterAct {
    
    var monsterHP: Int
    var monsterType: String

    init(monsterHP: Int, monsterType: String) {
        self.monsterHP = monsterHP
        self.monsterType = monsterType
    }
    
    func MonsterAttack() {
        print("The \(monsterType) launches a ferocious attack!")
        if(p.playerShield){
            print("The player is shielded from harm")
        } else {
            let enemyAttack = Int.random(in: 1...15)
            if(enemyAttack <= 5){
                p.playerHP = p.playerHP - enemyAttack
                print("The \(monsterType) slipped, you got scraped for \(enemyAttack) damage")
            } else if(enemyAttack <= 10 && enemyAttack > 5) {
                p.playerHP = p.playerHP - enemyAttack
                print("The \(monsterType) landed their attack, you got hit for \(enemyAttack) damage")
            } else if(enemyAttack <= 15 && enemyAttack > 10) {
                p.playerHP = p.playerHP - enemyAttack
                print("The \(monsterType) landed a critical attack, you got hit for \(enemyAttack) damage")
            }
        }
    }
    
    func CheckWinLose(){
        if(p.playerHP <= 0 && monsterHP <= 0){
            print("You both died, the game ends in a tie")
            exit(0)
        } else if(p.playerHP <= 0){
            print("You died, better luck next time!")
            exit(0)
        } else if(monsterHP <= 0){
            print("You beat your foe, YOU WIN!!")
            print("Thanks for Playing!")
            exit(0)
        }
    }
}

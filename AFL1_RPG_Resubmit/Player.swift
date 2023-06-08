//
//  Player.swift
//  AFL1_RPG_Resubmit
//
//  Created by MacBook Pro on 08/06/23.
//

import Foundation

class Player {
    var playerHP = 100
    var playerMP = 50
    var playerShield = false
    var potions = 20
    var elixir = 20
    
    init(playerHP: Int = 100, playerMP: Int = 50, playerShield: Bool = false, potions: Int = 20, elixir: Int = 20) {
        self.playerHP = playerHP
        self.playerMP = playerMP
        self.playerShield = playerShield
        self.potions = potions
        self.elixir = elixir
    }
    
    func Heal(){
        potions = potions - 1
        playerHP = playerHP + 20
        
        if(playerHP > 100){
            playerHP = 100
        }
    }
    
    func ShowVitals(){
        print("Player name: \(name)")
        print("\nHP: \(playerHP)/100")
        print("MP: \(playerMP)/50")
        print("\nPotions: \(potions)")
        print("Elixir: \(elixir)")
    }
    
    func UseElixir(){
        if(elixir == 0){
            print("You don't have enough elixir")
        } else {
            elixir = elixir - 1
            playerMP = playerMP + 10
            
            if(playerMP >= 50){
                playerMP = 50
            }
            
            print("You used Elixir, you refill 10 MP")
        }
    }
    
    func UsePotion(){
        if(potions == 0){
            print("You don't have enough Potions")
        } else {
            Heal()
        }
        print("You used Potion, you healed 20 HP")
    }
}

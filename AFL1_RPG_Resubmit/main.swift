//
//  main.swift
//  AFL1_RPG_Resubmit
//
//  Created by MacBook Pro on 08/06/23.
//

import Foundation

var affirm = " "

var playerHP = 100
var playerMP = 50
var playerShield = false
var potions = 20
var elixir = 20

var monsterHP = 500

while(affirm != ""){
    print("Welcome to the world of magic! 🧙🏻‍♂️🧌")
    print("\nYou have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts, Your adventures will take you through forests 🌲, mountain ⛰️, and dungeons 🏰, where you will face challenges, make allies, and fight enemies")
    
    print("\nPress [return] to continue: ")
    let continued = String(readLine()!)
    affirm = continued
}

var name = ""

while(name.isEmpty || name.contains(where: \.isNumber)){
    print("May I know your name, a young wizard?")
    name = String(readLine()!)
}

print("\nNice to meet you \(name)")

var loop = 0

while(loop == 0){
    var returns = "default"
    
    print("From here, you can...")
    print("\n[C]heck your health and stats")
    print("[H]eal your wounds with potion")
    print("\n...or choose where you want to go")
    print("\n[F]orest of Troll")
    print("[M]ountain of Golem")
    print("[Q]uit game")
    
    print("\nYour choice?")
    let choice = String(readLine()!)
    
    if(choice.lowercased() == "c") {
        while(returns != ""){
            ShowVitals()
            
            print("\nMagic:")
            print("- Physical Attack. No mana required. Deal 5pt of damage.")
            print("- Meteor. Use 15pt of MP. Deak 50pt of damage.")
            print("- Shield. Use 10pt of MP. Block enemy's attack in 1 turn.")
            
            print("\nItems:")
            print("- Potion x10. Heal 20pt of your HP.")
            print("- Elixir x5. Add 10pt of your MP")
            
            print("\nPress [return] to go back:")
            returns = String(readLine()!)
        }
    } else if(choice.lowercased() == "h"){
        while(returns != ""){
            print("Your HP is \(playerHP).")
            print("You have \(potions).")
            
            print("\nAre you sure you want to use 1 potion to heal wound? [Y/N]")
            let yn = String(readLine()!)
            
            if(yn.lowercased() == "y"){
                // Check if potions ran out
                if(potions == 0){
                    var check = true
                    
                    while(check){
                        print("\nYou don't have any potion left. Be careful of your next journey.")
                        print("Press [return] to go back")
                        returns = String(readLine()!)
                        check = Return(ret: returns)
                    }
                    
                } else {
                    var healLoop = true
                    
                    while(healLoop){
                        
                        var heal = "y"
                        var yesno = true
                        
                        Heal()
                        
                        while(yesno){
                            
                            print("\nYour HP is now: \(playerHP)")
                            print("You have \(potions) Potion left.")
                            
                            print("\nStill want to use 1 potion to heal wound again? [Y/N]")
                            heal = String(readLine()!)
                            if(heal.lowercased() == "y"){
                                
                                //Check if potions ran out
                                if(potions == 0){
                                    print("You ran out of potions :(")
                                    yesno = false
                                    healLoop = false
                                    returns = ""
                                } else {
                                    yesno = false
                                }
                                
                            }else if (heal.lowercased() == "n"){
                                yesno = false
                                healLoop = false
                            }else {
                                print("Invalid input")
                                yesno = true
                            }
                        }
                    }
                }
            } else if (yn.lowercased() == "n") {
                returns = ""
            } else {
                
            }
            
        }
    } else if(choice.lowercased() == "f"){
        print("As you enter the forest, you feel a sense of unease wash over you.")
        print("Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows")
        
        var gameLoop = 1
        
        while(gameLoop != 0){
            print("\n😈 Name: Troll x1")
            print("😈 Health: \(monsterHP)")
            
            print("\nChoose your action:")
            print("[1] Physical Attack. No mana required. Deal 5pt of damage.")
            print("[2] Meteor. Use 15pt of MP. Deak 50pt of damage.")
            print("[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.")
            
            print("\n[4] Use Potion to heal wound")
            print("[5] Use Elixir to refill MP")
            print("[6] Show player's vital.")
            print("[7] Flee from battle.")
            let action = String(readLine()!)
            
            if(action == "1"){
                monsterHP = monsterHP - 5
                print("You used Physical Attack, the enemy loses 5 HP")
                MonsterAction()
                CheckWinLose()
            }else if(action == "2"){
                playerMP = playerHP - 15
                monsterHP = monsterHP - 50
                print("You used Meteor, the enemy loses 50 HP")
                MonsterAction()
                CheckWinLose()
            }else if(action == "3"){
                playerShield = true
                print("You used Shield, you're invulnerable for 1 turn")
                MonsterAction()
                CheckWinLose()
            }else if(action == "4"){
                UsePotion()
                MonsterAction()
                CheckWinLose()
            }else if(action == "5"){
                UseElixir()
                MonsterAction()
                CheckWinLose()
            }else if(action == "6"){
                ShowVitals()
                print("Keep at it, you're doing great!")
            }else if(action == "7"){
                var check = true
                
                while(check){
                    print("You feel that if you don't escape soon, you won't be able to continue the fight.")
                    print("You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.")
                    print("You're safe, for now...")
                    print("Press [return] to continue:")
                    returns = String(readLine()!)
                    check = Return(ret: returns)
                }
                gameLoop = 0
                
            } else {
                print("Invalid Input")
            }
        }
        
        
    } else if(choice.lowercased() == "m"){
        print("As make your way through the rugged mountain terrain, you can feel the chill of the wind hitting at your skin.")
        print("Suddenly, you hear a sound that makes you freeze in your tracks. THat's when you see it - a massive, snarling Golem emerging from the shadows.")
        
        var gameLoop = 1
        
        while(gameLoop != 0){
            print("\n😈 Name: Golem x1")
            print("😈 Health: \(monsterHP)")
            
            print("\nChoose your action:")
            print("[1] Physical Attack. No mana required. Deal 5pt of damage.")
            print("[2] Meteor. Use 15pt of MP. Deak 50pt of damage.")
            print("[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.")
            
            print("\n[4] Use Potion to heal wound")
            print("[5] Use Elixir to refill MP")
            print("[6] Show player's vital.")
            print("[7] Flee from battle.")
            let action = String(readLine()!)
            
            if(action == "1"){
                monsterHP = monsterHP - 5
                print("You used Physical Attack, the enemy loses 5 HP")
                MonsterAction()
                CheckWinLose()
            }else if(action == "2"){
                playerMP = playerHP - 15
                monsterHP = monsterHP - 50
                print("You used Meteor, the enemy loses 50 HP")
                MonsterAction()
                CheckWinLose()
            }else if(action == "3"){
                playerShield = true
                print("You used Shield, you're invulnerable for 1 turn")
                MonsterAction()
                CheckWinLose()
            }else if(action == "4"){
                UsePotion()
                MonsterAction()
                CheckWinLose()
            }else if(action == "5"){
                UseElixir()
                MonsterAction()
                CheckWinLose()
            }else if(action == "6"){
                ShowVitals()
                print("Keep at it, you're doing great!")
            }else if(action == "7"){
                var check = true
                
                while(check){
                    print("You feel that if you don't escape soon, you won't be able to continue the fight.")
                    print("You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.")
                    print("You're safe, for now...")
                    print("Press [return] to continue:")
                    returns = String(readLine()!)
                    check = Return(ret: returns)
                }
                gameLoop = 0
                
            } else {
                print("Invalid Input")
            }
        }
        
    } else if(choice.lowercased() == "q"){
        print("Thanks for Playing!")
        exit(0)
    } else {
        print("Invalid Input!")
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
    }
    
    func MonsterAction(){
        print("The monster launches a ferocious attack!")
        if(playerShield){
            print("The player is shielded from harm")
        } else {
            let enemyAttack = Int.random(in: 1...15)
            if(enemyAttack <= 5){
                playerHP = playerHP - enemyAttack
                print("The enemy slipped, you got scraped for \(enemyAttack) damage")
            } else if(enemyAttack <= 10 && enemyAttack > 5) {
                playerHP = playerHP - enemyAttack
                print("The enemy landed their attack, you got hit for \(enemyAttack) damage")
            } else if(enemyAttack <= 15 && enemyAttack > 10) {
                playerHP = playerHP - enemyAttack
                print("The enemy landed a critical attack, you got hit for \(enemyAttack) damage")
            }
        }
    }
    
    func CheckWinLose(){
        if(playerHP <= 0 && monsterHP <= 0){
            print("You both died, the game ends in a tie")
            exit(0)
        } else if(playerHP <= 0){
            print("You died, better luck next time!")
            exit(0)
        } else if(monsterHP <= 0){
            print("You beat your foe, YOU WIN!!")
            print("Thanks for Playing!")
            exit(0)
        }
    }
    
    func Return(ret:String) -> Bool{
        var check = true
        
        if(returns != ""){
            check = true
        }else {
            check = false
        }
        return check
    }
    
    func UseElixir(){
        if(elixir == 0){
            print("You don't have enough elixir")
        } else {
            elixir = elixir - 1
            playerMP = playerMP + 10
            
            if(playerMP <= 50){
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

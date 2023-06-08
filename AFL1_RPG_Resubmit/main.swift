//
//  main.swift
//  AFL1_RPG_Resubmit
//
//  Created by MacBook Pro on 08/06/23.
//

import Foundation

var affirm = " "

let p = Player()
let t = Troll(monsterHP: 500, monsterType: "Troll")
let g = Golem(monsterHP: 1000, monsterType: "Golem")

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
            p.ShowVitals()
            
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
            print("Your HP is \(p.playerHP).")
            print("You have \(p.potions).")
            
            print("\nAre you sure you want to use 1 potion to heal wound? [Y/N]")
            let yn = String(readLine()!)
            
            if(yn.lowercased() == "y"){
                // Check if potions ran out
                if(p.potions == 0){
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
                        
                        p.Heal()
                        
                        while(yesno){
                            
                            print("\nYour HP is now: \(p.playerHP)")
                            print("You have \(p.potions) Potion left.")
                            
                            print("\nStill want to use 1 potion to heal wound again? [Y/N]")
                            heal = String(readLine()!)
                            if(heal.lowercased() == "y"){
                                
                                //Check if potions ran out
                                if(p.potions == 0){
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
            print("😈 Health: \(t.monsterHP)")
            
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
                t.monsterHP = t.monsterHP - 5
                print("You used Physical Attack, the enemy loses 5 HP")
                t.MonsterAttack()
                t.CheckWinLose()
            }else if(action == "2"){
                p.playerMP = p.playerMP - 15
                t.monsterHP = t.monsterHP - 50
                print("You used Meteor, the enemy loses 50 HP")
                t.MonsterAttack()
                t.CheckWinLose()
            }else if(action == "3"){
                p.playerMP = p.playerMP - 10
                p.playerShield = true
                print("You used Shield, you're invulnerable for 1 turn")
                t.MonsterAttack()
                t.CheckWinLose()
            }else if(action == "4"){
                p.UsePotion()
                t.MonsterAttack()
                t.CheckWinLose()
            }else if(action == "5"){
                p.UseElixir()
                t.MonsterAttack()
                t.CheckWinLose()
            }else if(action == "6"){
                p.ShowVitals()
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
            print("😈 Health: \(g.monsterHP)")
            
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
                g.monsterHP = g.monsterHP - 5
                print("You used Physical Attack, the enemy loses 5 HP")
                g.MonsterAttack()
                t.CheckWinLose()
            }else if(action == "2"){
                p.playerMP = p.playerMP - 15
                g.monsterHP = g.monsterHP - 50
                print("You used Meteor, the enemy loses 50 HP")
                g.MonsterAttack()
                t.CheckWinLose()
            }else if(action == "3"){
                p.playerMP = p.playerMP - 10
                p.playerShield = true
                print("You used Shield, you're invulnerable for 1 turn")
                t.MonsterAttack()
                t.CheckWinLose()
            }else if(action == "4"){
                p.UsePotion()
                t.MonsterAttack()
                t.CheckWinLose()
            }else if(action == "5"){
                p.UseElixir()
                t.MonsterAttack()
                t.CheckWinLose()
            }else if(action == "6"){
                p.ShowVitals()
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
    
    func Return(ret:String) -> Bool{
        var check = true
        
        if(returns != ""){
            check = true
        }else {
            check = false
        }
        return check
    }
}

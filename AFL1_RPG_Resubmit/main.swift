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
var potions = 20
var elixir = 0

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
            print("Player name: \(name)")
            print("\nHP: \(playerHP)/100")
            print("MP: \(playerMP)/50")
            
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
                        if(returns != ""){
                            check = true
                        }else {
                            check = false
                        }
                    }
                    
                } else {
                    var healLoop = true
                    
                    while(healLoop){
                        
                        var heal = "y"
                        var yesno = true
                        
                        // Heal Action
                        potions = potions - 1
                        playerHP = playerHP + 20
                        
                        if(playerHP > 100){
                            playerHP = 100
                        }
                        
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
        
    } else if(choice.lowercased() == "m"){
        
    } else if(choice.lowercased() == "q"){
        print("Thanks for Playing!")
        exit(0)
    } else {
        print("Invalid Input!")
    }
}

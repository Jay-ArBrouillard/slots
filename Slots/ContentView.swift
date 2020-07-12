//
//  ContentView.swift
//  Slots
//
//  Created by Jay-Ar Brouillard on 7/11/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var betAmount = 1
    @State private var icons = ["apple", "donut", "lemon"]
    @State private var selectedIcons = [0,1,2]
    @State private var credits = 1000
    
    var body: some View {
        ZStack {
            //Background
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            //Background diagonal
            Rectangle()
                .frame(width: 1000, height: 350, alignment: .center)
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                //Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                    Text("Slots")
                        .foregroundColor(Color.white)
                        .bold()
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                //Credits
                Text("Credits: " + String(credits))
                    .foregroundColor(Color.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                //Slots
                HStack {
                    Spacer()

                    CardView(symbol: $icons[selectedIcons[0]])
                    CardView(symbol: $icons[selectedIcons[1]])
                    CardView(symbol: $icons[selectedIcons[2]])
                    
                    Spacer()
                }
                
                Spacer()
                
                //Bets and Spin
                HStack {
                    Spacer()
                    
                    //Bet Amount
                    HStack {
                        Text(String(betAmount))
                            .bold()
                            .scaleEffect(1.5)
                        Button(action: {
                            self.betAmount += 1
                        }) {
                            Image(systemName: "arrow.up")
                        }.scaleEffect(2.0).padding([.leading, .trailing], 20)
                        
                        Button(action: {
                            self.betAmount -= 1
                        }) {
                            Image(systemName: "arrow.down")
                        }.scaleEffect(2.0)
                    }
                        .padding(.all, 20)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)

                    
                    //Spin Button
                    Button(action: {
                        
                        //Change images
                        self.credits -= self.betAmount
                        for i in self.selectedIcons {
                            self.selectedIcons[i] = Int.random(in: 0...self.icons.count-1)
                        }
                        
                        //Check winnings
                        if self.selectedIcons[0] == self.selectedIcons[1] && self.selectedIcons[1] == self.selectedIcons[2] {
                            self.credits += self.betAmount * 10
                        }
                        
                    }) {
                        Text("Spin")
                            .bold()
                            .padding(.all, 20)
                            .padding([.leading, .trailing], 20)
                            .foregroundColor(Color.white)
                            .background(Color.pink)
                            .cornerRadius(20)
                    }
                    Spacer()
                }
                
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

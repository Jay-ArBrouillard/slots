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
    @State private var selectedIcons = Array.init(repeating: 0, count: 9)
    @State private var credits = 1000
    @State private var backgrounds = Array.init(repeating: Color.white, count: 9)
    
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
                    Text("Slots Mania")
                        .foregroundColor(Color.white)
                        .bold()
                    Image(systemName: "star.fill")
                        .foregroundColor(Color.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                //Credits
                Text("Credits: " + String(credits))
                    .fixedSize(horizontal: true, vertical: false)
                    .foregroundColor(Color.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                //Slots
                
                VStack {
                    //Row 1
                    HStack {
                        Spacer()
                        CardView(symbol: $icons[selectedIcons[0]], background: $backgrounds[0])
                        CardView(symbol: $icons[selectedIcons[1]], background: $backgrounds[1])
                        CardView(symbol: $icons[selectedIcons[2]], background: $backgrounds[2])
                        Spacer()
                    }
                    
                    //Row 2
                    HStack {
                        Spacer()
                        CardView(symbol: $icons[selectedIcons[3]], background: $backgrounds[3])
                        CardView(symbol: $icons[selectedIcons[4]], background: $backgrounds[4])
                        CardView(symbol: $icons[selectedIcons[5]], background: $backgrounds[5])
                        Spacer()
                    }
                    
                    //Row 3
                    HStack {
                        Spacer()
                        CardView(symbol: $icons[selectedIcons[6]], background: $backgrounds[6])
                        CardView(symbol: $icons[selectedIcons[7]], background: $backgrounds[7])
                        CardView(symbol: $icons[selectedIcons[8]], background: $backgrounds[8])
                        Spacer()
                    }
                }
                
                
                Spacer()
                
                //Bets and Spin
                HStack {
                    Spacer()
                    
                    //Bet Amount
                    VStack {
                        HStack {
                            Button(action: {
                                self.betAmount += 1
                            }) {
                                Image(systemName: "arrow.up")
                            }.scaleEffect(2.0).padding(.trailing, 20)
                            
                            Button(action: {
                                self.betAmount -= 1
                            }) {
                                Image(systemName: "arrow.down")
                            }.scaleEffect(2.0).padding(.leading, 20)
                        }
                        .padding(.all, 20)
                        .padding([.leading, .trailing], 10)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                        Text(String(betAmount) + " Credits")
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    
                    
                    //Spin Button
                    Button(action: {
                        self.processResults()
                    }) {
                        Text("Spin")
                            .bold()
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.all, 30)
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
    
    func processResults () {
        
        func isMatch(_ index1 : Int, _ index2 : Int, _ index3 : Int) -> Bool {
            
            if self.selectedIcons[index1] == self.selectedIcons[index2] && self.selectedIcons[index2] == self.selectedIcons[index3] {
                //Set backgrounds to green
                self.backgrounds[index1] = Color.green
                self.backgrounds[index2] = Color.green
                self.backgrounds[index3] = Color.green
                return true
            }
            
            return false
        }
        
        //Set backgrounds to white
        self.backgrounds = self.backgrounds.map { _ in
            Color.white
        }
        
        //Randomize the images
        self.selectedIcons = self.selectedIcons.map { _ in
            Int.random(in: 0...self.icons.count-1)
        }
        
        //Check winnings
        var matches = 0
        
        //Top Row
        if isMatch(0, 1, 2) { matches += 1 }
        
        //Middle Row
        if isMatch(3, 4, 5) { matches += 1 }
        
        //Top Row
        if isMatch(6, 7, 8) { matches += 1 }
        
        //Left Diagonal
        if isMatch(0, 4, 8) { matches += 1 }
        
        //Right Diagonal
        if isMatch(2, 4, 6) { matches += 1 }
        
        if matches > 0 {
            self.credits += self.betAmount * matches * 2
        }
        else {
            self.credits -= self.betAmount
        }
        
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

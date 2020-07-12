//
//  ContentView.swift
//  Slots
//
//  Created by Jay-Ar Brouillard on 7/11/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
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
                    Image("apple")
                        .padding(.bottom)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                        .multilineTextAlignment(.center)
                    
                    Image("apple")
                        .padding(.bottom)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                        .multilineTextAlignment(.center)
                    
                    Image("apple")
                        .padding(.bottom)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(20)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                }
                
                Spacer()
                
                //Spin Button
                Button(action: {
                    self.credits += 1
                }) {
                    Text("Spin")
                        .bold()
                        .padding(.all)
                        .padding([.leading, .trailing], 20)
                        .foregroundColor(Color.white)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                
                Spacer()
                
                
            }
            
            
        }
        
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

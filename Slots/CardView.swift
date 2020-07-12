//
//  CardView.swift
//  Slots
//
//  Created by Jay-Ar Brouillard on 7/12/20.
//  Copyright © 2020 Jay-Ar Brouillard. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @Binding var symbol: String
    
    var body: some View {
        Image(symbol)
            .background(Color.white.opacity(0.5))
            .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(symbol: Binding.constant("apple"))
    }
}

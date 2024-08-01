//
//  NemorphicView.swift
//
//  Created by Yogesh Ingole on 01/08/24.
//

import SwiftUI


struct NemorphicView: View {
    
    var body: some View {
        VStack {
            VStack{
                
            }.background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.neuBackground)
                    .frame(width: UIScreen.main.bounds.size.width-25,height: UIScreen.main.bounds.size.height-95)
        )
        .shadow(color: .dropShadow, radius: 15, x: 10, y: 10)
        .shadow(color: .dropLight, radius: 15, x: -10, y: -10)
        .foregroundColor(.primary)
    }.padding(20)
            
    }
}

#Preview {
    NemorphicView()
}


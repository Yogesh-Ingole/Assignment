//
//  NemorphicCircleView.swift
//
//  Created by Yogesh Ingole on 01/08/24.
//

import SwiftUI



extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

struct NemorphicCircleView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.white)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .blur(radius: 2)
                        .offset(x: -1, y: -1)
                        .mask(Circle().fill(LinearGradient(Color.clear, Color.black)))
                )
                .overlay(
                    Circle()
                        .stroke(Color.gray, lineWidth: 2)
                        .blur(radius: 2)
                        .offset(x: 1, y: 1)
                        .mask(Circle().fill(LinearGradient(Color.black, Color.clear)))
                )
              .frame(width: 25, height: 25, alignment: .center)
            Image(systemName: "chevron.right")
                .frame(width: 10,height: 10)
                .foregroundColor(.black)
               
        }
    }
}

#Preview {
    NemorphicCircleView()
}

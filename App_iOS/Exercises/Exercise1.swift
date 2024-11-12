//
//  ContentView.swift
//  App_iOS
//
//  Created by Hyliard on 12/11/2024.
//

import SwiftUI

struct Exercise1: View {
    var body: some View {
            VStack {
                HStack{
                    //    Three Up
                    Rectangle()
                        .foregroundColor(.blue)
                    Rectangle()
                        .foregroundColor(.yellow)
                    Rectangle()
                        .foregroundColor(.green)
                }.frame(height:(100))
                    Rectangle()
                        .foregroundColor(.orange)
                        .frame(height: 100)
                //       Mid
                HStack{
                    Circle()
                        .foregroundColor(.green)
                    Rectangle()
                        .foregroundColor(.black)
                    Circle()
                        .foregroundColor(.indigo)
                }.frame(height: 300)
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 100)
                //    Three Down
                HStack{
                    Rectangle()
                        .foregroundColor(.purple)
                    Rectangle()
                        .foregroundColor(.brown)
                    Rectangle()
                        .foregroundColor(.green)
                }.frame(height: 100)
            }
            .background(.red)
    }
}
struct Exercise1_Previews: PreviewProvider {
    static var previews: some View {
        Exercise1()
    }
}

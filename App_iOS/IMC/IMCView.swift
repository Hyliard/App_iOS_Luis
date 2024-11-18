//
//  IMCView.swift
//  App_iOS
//
//  Created by Hyliard on 12/11/2024.
//

import SwiftUI

struct IMCView: View {
    
    @State var gender: Int = 0
    @State var age: Int = 18
    @State var weight: Int = 30
    @State var height: Double = 140
    
    var body: some View {
        VStack {
            HStack {
                ToggleButton(text: "Hombre", imageName:"star", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Mujer", imageName: "heart", gender: 1, selectedGender: $gender)
            }
            
            HeightCalculator(selectedHeight: $height) // Llama correctamente la vista
            HStack {
                CounterButton(text: "Edad", number: $age)
                CounterButton(text: "Peso", number: $weight)
            }
            IMCCalculateButton(userWeight: Double(weight), userHeight: height)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.brown))
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("IMC Calculator")
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}


struct ToggleButton: View {
    let text: String
    let imageName: String
    let gender: Int
    @Binding var selectedGender: Int
    
    var body: some View {
        let color = (gender == selectedGender) ? Color("backgroundComponentSelected") : Color("backgroundComponent")
            
        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                InformationText(text: text)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(color) // Aquí usas la variable `color`
        }
    }
}

struct InformationText: View {
    let text: String
    var body: some View {
        Text(text).font(.largeTitle).bold().foregroundColor(.white)
    }
}

struct TitleText: View {
    var text: String
    var body: some View {
        Text(text).font(.title2).foregroundColor(.gray)
    }
}

struct HeightCalculator: View {
    @Binding var selectedHeight: Double
    
    var body: some View {
        VStack {
            TitleText(text: "Altura")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 90...220, step: 1).accentColor(.purple).padding(.horizontal)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("backgroundComponent")) // Llama al color directamente
    }
}

struct CounterButton: View {
    let text: String
    @Binding var number: Int
    
    var body: some View {
        VStack {
            TitleText(text: text)
            InformationText(text: String(number)) // Muestra el valor de number
            
            HStack {
                // Botón de decremento
                Button(action: {
                    if number > 0 {
                        number -= 1
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 70, height: 70)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 5)
                    }
                }
                
                // Botón de incremento
                Button(action: {
                    if number < 150 {
                        number += 1
                        
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 70, height: 70)
                        Image(systemName: "plus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color("backgroundComponent"))
    }
}

struct IMCCalculateButton:View{
    let userWeight:Double
    let userHeight:Double
    var body: some View{
        NavigationStack{
            NavigationLink(destination:{IMCResult(userWeight: userWeight, userHeight: userHeight)}){
                Text("Calcular").font(.title).bold().foregroundColor(.purple).frame(maxWidth: .infinity, maxHeight: 100).background(Color("backgroundComponent"))
            }
        }
    }
}

struct IMCView_Previews: PreviewProvider {
    static var previews: some View {
        IMCView()
    }
}


//
//  ContentView.swift
//  GameHW3-4
//
//  Created by Ivanov Sergey on 22.12.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = 50.0
    @State private var showAlert = false
    
    
    var body: some View {
        VStack {
            Text("Передвиньте слайдер, как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                GameUISlider(
                    value: $currentValue,
                    color: .red,
                    alphaValue: computeScore())
                Text("100")
            }
            .padding()
            Button("Проверь меня!") {
                showAlert = true
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Your Score"), message: Text("\(computeScore())"))
            }
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
            
        
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

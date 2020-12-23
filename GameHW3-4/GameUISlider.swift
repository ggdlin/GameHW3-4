//
//  GameUISlider.swift
//  GameHW3-4
//
//  Created by Ivanov Sergey on 22.12.2020.
//

import SwiftUI

struct GameUISlider: UIViewRepresentable {
    
    @Binding var value: Double
    let color: UIColor
    let alphaValue: Int

    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alphaValue) / 100)
        print("""
            sender value: \(value)
            alpha: \(alphaValue)
            ------------------------
            """)
    }
    
    func makeCoordinator() -> GameUISlider.Coordinator {
        Coordinator(value: $value)
    }
    
    
}

extension GameUISlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
            
        }
        
        
    }
}


struct GameUISlider_Previews: PreviewProvider {
    static var previews: some View {
        GameUISlider(value: .constant(50.0), color: .red, alphaValue: 100)
    }
}

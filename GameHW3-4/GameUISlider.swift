//
//  GameUISlider.swift
//  GameHW3-4
//
//  Created by Ivanov Sergey on 22.12.2020.
//

import SwiftUI

struct GameUISlider: UIViewRepresentable {
    
    @Binding var value: Double
//    @State var alphaValue: Double = 1
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.setAlpha(1)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
    
    func makeCoordinator() -> GameUISlider.Coordinator {
        Coordinator(value: $value, targetValue: $targetValue)
    }
    
    
}

extension GameUISlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        @Binding var targetValue: Int
        
        init(value: Binding<Double>, targetValue: Binding<Int>) {
            self._value = value
            self._targetValue = targetValue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
            computeAlpha(sender: sender)
            
        }
        
        private func computeAlpha(sender: UISlider) {
            let difference = abs(targetValue - lround(Double(sender.value)))
            let alpha =  Double(100 - difference) / 100
            print("""
                target value: \(targetValue)
                sender value: \(sender.value)
                difference: \(difference)
                alpha: \(alpha)
                ------------------------
                """)
            sender.setAlpha(alpha)
        }
    }
}

extension UISlider {
    func setAlpha(_ alpha: Double) {
        thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: CGFloat(alpha))
    }
}


struct GameUISlider_Previews: PreviewProvider {
    static var previews: some View {
        GameUISlider(value: .constant(50.0), targetValue: .constant(10))
    }
}

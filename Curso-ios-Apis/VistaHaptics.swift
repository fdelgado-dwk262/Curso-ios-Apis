//
//  VistaHaptics.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import SwiftUI

struct VistaHaptics: View {
    
    @State private var contador = 0
    @State private var errorTrigger: Bool = false
    
    
    var body: some View {
        
        Text("Debes de habilitar la vibración en tu dispositivo \n Ajustes -> sonido y vibraviones -> activar Vibraciones del sistema")
        Button("incrementar: \(contador)") {
            contador += 1
        }
        .sensoryFeedback(.impact(weight: .medium, intensity: 1.0), trigger: contador)
        .padding(20)
        .border(Color.blue)
        
        Button("simular error") {
            errorTrigger.toggle()
        }
        .sensoryFeedback(.error, trigger: errorTrigger)
        .padding(20)
        .border(Color.red)
    }
}

#Preview {
    VistaHaptics()
}

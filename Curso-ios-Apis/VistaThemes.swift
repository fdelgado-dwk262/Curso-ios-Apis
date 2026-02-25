//
//  VistaThemes.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 25/2/26.
//

// nos vamos a los asset para cambiar los colores



import SwiftUI


struct AppTheme {
    let fondo = Color(.colorBackground)
    let action = Color(.colorAction)
    let aviso = Color.orange
    let exito = Color.green
    
}

extension Color {
    static let theme = AppTheme()
}

struct VistaThemes: View {
    var body: some View {
        ZStack {
            Color.theme.fondo
                .ignoresSafeArea()
            VStack {
                Button("Cambiar Tema") {
                    
                }
                .padding()
                .background(Color.theme.action)
                .foregroundColor(Color.theme.fondo)
                
                Text("Operación con Éxito")
                    .foregroundStyle(Color.theme.exito)
            }
        }
    }
}

#Preview {
    VistaThemes()
}

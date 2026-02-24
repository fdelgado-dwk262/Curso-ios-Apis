//
//  ContentView.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                NavigationLink(destination: VistaConCicloDeVida()) {
                    Text("Vista con ciclo de vida")
                }
                NavigationLink(destination: VistaPhotoPicker()) {
                    Text("PhotoPicker")
                }
                NavigationLink(destination: VistaCompartir()) {
                    Text("Compartir")
                }
                NavigationLink(destination: VistaMapas()) {
                    Text("Mapas")
                }
                NavigationLink(destination: VistaTipKit()) {
                    Text("TipKit")
                }
                NavigationLink(destination: VistaHaptics()) {
                    Text("Haptics")
                }
                NavigationLink(destination: VistaConectividad()) {
                    Text("Conectividad")
                }
                NavigationLink(destination: VistaSonidos()) {
                    Text("Sonidos")
                }
                NavigationLink(destination: VistaWebViewSimple()) {
                    Text("VistaWebViewSimple")
                }
                NavigationLink(destination: VistaWebKit()) {
                    Text("VistaWebKit")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  VistaWebViewSimple.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import SwiftUI
import SafariServices

// esta montado con uikit y hay que crear un adaptador entre uikit y swiftkit
struct SafariWrapper: UIViewControllerRepresentable {
    let url: URL
    
    // implementamos metodos para la compatibilidad
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = false
        return SFSafariViewController(url: url, configuration: config)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
    
    
    
}


struct VistaWebViewSimple: View {
    
    let url = URL(string: "https://www.google.com")!
    
    @State private var mostrarSheet: Bool = false
    
    var body: some View {
    
        // abrimos el navegador en uns sheet o en una fullScreen es lo mismo mas o menos
        Button("Abrir sheet + navegador") {
            mostrarSheet = true
        }
        .fullScreenCover(isPresented: $mostrarSheet) {
            SafariWrapper(url: url)
            
        }
        .padding(10)
        .border(Color.black)
        
        // abrimos el navegador en un espacio concreto
        SafariWrapper(url: url)
            .frame(maxWidth: .infinity)
            .frame(height: 350)
    }
    
}

#Preview {
    VistaWebViewSimple()
}

//
//  VistaWebKit.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import SwiftUI
import WebKit

// pàra pasarle al vista web o bisn un enlace o bien código HTML/JS
enum WebContent {
    case Link(URL)
    case localHTML(String)
}

struct webView: UIViewRepresentable {
    let content: WebContent
    
    // dos funciones .-
    
    // para cuando creamos la vista
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        return WKWebView(frame: .zero, configuration: config)
    }
    
    // cunado se actualiza
    
    // TODO: continuar con erl segundo método
}

struct VistaWebKit: View {
    var body: some View {

    }
}

#Preview {
    VistaWebKit()
}

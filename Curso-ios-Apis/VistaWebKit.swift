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
    case link(URL)
    case localHTML(String)
}

// NOTA SIEMPRE SEDECLARA CON MAYUSCULA
struct WebView: UIViewRepresentable {
    let content: WebContent
    
    // dos funciones .-
    
    // para cuando creamos la vista
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        return WKWebView(frame: .zero, configuration: config)
    }
    
    // cuando se actualiza
    func updateUIView(_ webView: WKWebView, context: Context) {
        switch content {
        case .link(let url):
            if webView.url != url {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        case .localHTML(let htmlString):
            webView.loadHTMLString(htmlString, baseURL: nil)
        }
    }
}

struct VistaWebKit: View {
//    let webContent = WebContent.link(URL(string: "https://www.google.com")!)
    
    let webContent = WebContent.localHTML("""
    <html>
        <head></head>
        <body>
            <h1>Pruebas de html</h1>
        </body>
    </html>
    """)
    
    var body: some View {
        WebView(content: webContent)
    }
}

#Preview {
    VistaWebKit()
}

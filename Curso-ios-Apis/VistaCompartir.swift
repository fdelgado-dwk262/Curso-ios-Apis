//
//  VistaCompartir.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import SwiftUI

struct VistaCompartir: View {

    private let url = URL(string: "https://www.google.com")!
    private let mifoto = Image("foto")

    var body: some View {
        VStack(spacing: 20) {
            // compartir url
            ShareLink(item: url) {
                Label("compartir enlace", systemImage: "square.and.arrow.up")
            }

            // compartir Texto con asunto

            ShareLink(
                item: "Mira mis notas",
                subject: Text("Asunto"),
                message: Text("cuerpo etc de pruebas y de mas cosas de prueba"),
            ) {
                Label("Compartir mensaje", systemImage: "square.and.arrow.up")
            }
            
            // se puede compartir cualquier cosa que impolemente le protocolo Transferable
            // por defecto .-  string / url / image / data / codable
            
            ShareLink(
                item: mifoto,
                preview: SharePreview("Mi foto de pruebas", image:mifoto)
            ) {
                Label("Compartir Imagen", systemImage: "square.and.arrow.up")
            }

        }
    }
}

#Preview {
    VistaCompartir()
}

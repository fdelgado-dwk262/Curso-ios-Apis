//
//  VistaConectividad.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import SwiftUI
import Network

@Observable
class networkMonitor {
    var conectado = true
    var conexionPorDatos = false
    var conexionPorWifi = false
    private let monitor = NWPathMonitor()
    
    init() {
        monitor.pathUpdateHandler = { path in
            self.conectado = path.status == .satisfied
            self.conexionPorDatos = path.usesInterfaceType(.cellular)
            self.conexionPorWifi = path.usesInterfaceType(.wifi)
        }
        monitor.start(queue: DispatchQueue.global())
    }
}

struct VistaConectividad: View {
    
    @State private var network = networkMonitor()
    
    var body: some View {
        ContentUnavailableView(
            "Estado de la conexion",
            systemImage: network.conectado ? "wifi" :"wifi.slash",
            description: Text(network.conectado ? "Conectado" : "Desconectado")
        )
        ContentUnavailableView(
            "Estado de la red",
            systemImage: network.conexionPorDatos ? "wifi" :"wifi.slash",
            description: Text(network.conexionPorDatos ? "Conectado" : "Desconectado")
        )
        ContentUnavailableView(
            "Estado de la Wifi",
            systemImage: network.conexionPorWifi ? "wifi" :"wifi.slash",
            description: Text(network.conexionPorWifi ? "Conectado" : "Desconectado")
        )
    }
}

#Preview {
    VistaConectividad()
}

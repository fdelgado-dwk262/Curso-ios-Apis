//
//  VistaConcicloDeVida.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import SwiftUI

struct VistaConCicloDeVida: View {

    // scenePhase
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        Text("observamos cambios en la app")
            .onChange(of: scenePhase) { oldValue, newValue in
                switch newValue {
                case .active:
                    print("la app esta activa")
                case .inactive:
                    print("la app esta inactiva (ej. centro de control")
                case .background:
                    print(
                        "App en segundo plano (home pulsado o cambios de app)"
                    )
                default:
                    break
                }
            }
    }
}

#Preview {
    VistaConCicloDeVida()
}

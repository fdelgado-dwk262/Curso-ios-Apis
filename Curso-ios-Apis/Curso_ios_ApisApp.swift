//
//  Curso_ios_ApisApp.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import SwiftUI
import TipKit

@main
struct Curso_ios_ApisApp: App {
    
    init() {
        try? Tips.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

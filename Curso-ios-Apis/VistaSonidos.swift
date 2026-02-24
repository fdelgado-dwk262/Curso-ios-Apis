//
//  VistaSonidos.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import SwiftUI
import AudioToolbox // sonidos de sistema
import AVFoundation // para sonido/video desde sistema

struct VistaSonidos: View {
    
    @State private var audioPlayer: AVAudioPlayer?
    
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Sonido de sistema clic 1104" ) {
                // 1104 es el ID del sonido
                AudioServicesPlaySystemSound(1104)
            }
            Button("Reproducir sonido" ) {
                reproducirSonido(nombre: "soniquete")
            }
        }
        // opcional .-
        // como saber el contenido del bundle es para hacer pruebas
        // caso de uso para hacer un debugger
        .onAppear {
            print("--- contenido del bundle ---")
            if let resourcePath = Bundle.main.resourcePath {
                do {
                    let files = try FileManager.default.contentsOfDirectory(atPath: resourcePath)
                    for file in files {
                        // vamso a filtrar por los archivos de sonido
                        if file.hasSuffix(".mp3") || file.hasSuffix(".wav") {
                            print("Encontramos un archivo de sonido: \(file)")
                            
                        }
                    }
                } catch {
                    print(("Error leyendo el Bundle: \(error)"))
                    
                }
            }
        }
        // fin debugger ...........................................
        
        
    }
    
    func reproducirSonido(nombre: String) {
        // bunde es donde estan las cosas que metemos a la app
        guard let url = Bundle.main.url(forResource: nombre, withExtension: "mp3") else {
            print("No hemos encontrado el archivo")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}



#Preview {
    VistaSonidos()
}

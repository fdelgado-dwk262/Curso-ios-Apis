//
//  VistaPhotoPicker.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import PhotosUI
import SwiftUI

struct VistaPhotoPicker: View {
    // dos variables de stado
    // obteneer la selección
    @State private var fotoSeleccionado: PhotosPickerItem?
    @State private var imagenSeleccionada: Image?

    var body: some View {
        VStack {
            if let imagenSeleccionada {
                imagenSeleccionada
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
            }

            PhotosPicker(
                "Seleccionar foto,",
                selection: $fotoSeleccionado,
                matching: .images
            )
            .onChange(of: fotoSeleccionado) {
                Task {
                    if let data = try? await fotoSeleccionado?.loadTransferable(
                        type: Data.self
                    ),
                        let uiImage = UIImage(data: data)
                    {
                        imagenSeleccionada = Image(uiImage: uiImage)
                    }
                }
            }
        }
    }
}

#Preview {
    VistaPhotoPicker()
}

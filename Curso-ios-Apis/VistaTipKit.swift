//
//  VistaTipKit.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import SwiftUI
import TipKit

struct TipFavorito: Tip {
    var title: Text{ Text("Guardar Favoritos")}
    // opcional
    var message: Text? { Text("Pulsa aqui para guardad este elemento.")}
    var image: Image? { Image(systemName: "star")}
}

// para que funcione es necesario configurarlo en la APP  enla calse principàl de la APP 

struct VistaTipKit: View {
    
    //nvariable ifualda al struct
    let tipFavorito =  TipFavorito()
    
    var body: some View {
        VStack {
            Image(systemName: "star")
                .font(.largeTitle)
                .popoverTip(tipFavorito) // este código para mostrar el tip
                .onTapGesture {
                    tipFavorito.invalidate(reason: .actionPerformed)
                }
        }
        
        // en el caso qiue no funcione en el Canvas
//        .task {
//            try? Tips.configure()
//        }
    }
}

#Preview {
    VistaTipKit()
}

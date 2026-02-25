//
//  VistaFicheros.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 25/2/26.
//

// hacermos varias cosas con ficheros que estan implementados en la app
// usaremos las codingKeys que a futuro las usaremos para
// firebase

// usaremos un Json .- usuarios.json

import SwiftUI

// como lo pasaremos a una lista
// necesitamos un id pero en el json no esta
// usarmeos:
struct Usuario: Codable, Identifiable {
    var id = UUID()
    var nombre: String
    var edad: Int

    // para suplir el problema de id que no esta en el Json:
    enum CodingKeys: String, CodingKey {
        case id, nombre, edad
    }

    // init personalizado para decodificar
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        // tratamos de decodificar el id. Si no existe, le asignamos uno
        // trata de decodificar y si no le asignas un id
        self.id =
            try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()

        self.nombre = try container.decode(String.self, forKey: .nombre)
        self.edad = try container.decode(Int.self, forKey: .edad)
    }
}

struct VistaFicheros: View {

    // necesitamos un array de usuarios iniciallizado a vacio
    @State private var usuarios: [Usuario] = []

    var body: some View {
        VStack(spacing: 16) {
            List{
                ForEach($usuarios) { $usuario in
                    HStack {
                        TextField("Nombre", text: $usuario.nombre)
                        TextField("Edad", value: $usuario.edad, format: .number)
                            .frame(width: 80)
                    }
                }
            }
            
            // recupeeramos del Bundle
            Button("Cargar Json del Bundle") {
                cargarJSONDelBunle()
            }
            // guardasmo enarchivops de la app
            Button("Guardar Json en Bundle") {
                guardarJSON()
            }
            Button("Cargar Json Guardado en Documentos") {
                cargarJSONGuardado()
            }
            
        }
    }
    
    // Cargamos el bundel el fichero
    func cargarJSONDelBunle() {
        print(Bundle.main.paths(forResourcesOfType: "json", inDirectory: nil))
        guard let url = Bundle.main.url(forResource: "usuarios", withExtension: ".json") else {
            print("no se encontro ar-🐐")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            usuarios = try JSONDecoder().decode([Usuario].self, from: data)
        } catch {
            print("Error cargando el json: \(error.localizedDescription)")
            
        }
    }
    
    // lo guarda en los archivos de la aplicación no en
    // el bundle ya que es solo de lectura
    func guardarJSON() {
        let encoder = JSONEncoder()
        // pintalo bonito
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(usuarios)
            // llamamos a una funcion nuestra
            let url = getDocumentDirectory().appendingPathComponent("Usuarios_guardados.json")
            
            // guarda los datos en la dirección
            try data.write(to: url)
            print("----------- \n guardado en: \(url.path)")
            
        
        } catch {
            print("Error guardando ar- el json: \(error.localizedDescription)")
        }
    }
    
    func getDocumentDirectory() -> URL {
        // nos retorna la primera url 
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    // cargamos de ficheros el que se ha creado
    func cargarJSONGuardado() {
        
        let url = getDocumentDirectory().appendingPathComponent("Usuarios_guardados.json")
        
        guard FileManager.default.fileExists(atPath: url.path) else {
            print("No exixte el fichero guardado")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            usuarios = try JSONDecoder().decode([Usuario].self, from: data)
        } catch {
            print("Error al cargar ar-🐐 : \(error.localizedDescription)")
        }
        
    }
    
}

#Preview {
    VistaFicheros()
}

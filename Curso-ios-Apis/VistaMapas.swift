//
//  VistaMapas.swift
//  Curso-ios-Apis
//
//  Created by Equipo 9 on 24/2/26.
//

import CoreLocation  // mostrar ubicaciones
import MapKit  // libreria de mapas
import SwiftUI

// para que nos pida permiso
@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    private let manager = CLLocationManager()
    var location: CLLocation?
    var authoritationStatus: CLAuthorizationStatus?

    override init() {
        super.init()
        manager.delegate = self
    }
    // implementamos metodos de call back
    //para solicitar permisos

    func solicitarPermiso() {
        manager.requestWhenInUseAuthorization()
        // nos vamso al las propiedades del proyecto y en la pestaña info añadimos
        // Privacy - Location When In Use Usage Description
    }

    // observamos cambios de permisos en un funcion exixtente en el core de swift
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authoritationStatus = manager.authorizationStatus

        switch authoritationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default:
            break
        }
    }

    // Observamos la nueva ubicación
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        location = locations.first

    }
}

struct VistaMapas: View {
    // variable de stado para acceder al LocationManager
    @State private var locationManager = LocationManager()

    // posicion
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 40.4168,
                longitude: -3.7038
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)  // es el Zoom sobre el mapa
        )
    )

    var body: some View {
        VStack(spacing: 20) {
            Text("Mapa de MAdrid")

            Map(position: $position) {
                
                    Marker("kilometro 0", coordinate: CLLocationCoordinate2D(latitude: 40.4168, longitude: -3.7038))
                        .tint(.red)
                

                // uando cambia de posicion fisica
                if let location = locationManager.location {
                    Marker(
                        "Tu ubicación actual",
                        coordinate: location.coordinate
                    )
                    .tint(.blue)
                }

            }
            .mapControls {
                MapCompass()
                // añadimos un control para cuando pulsemos modifica la ubicacion del usuario
                MapUserLocationButton()
            }
            // callback
            .onAppear {
                // cuando se carga la vista solicita permiso
                locationManager.solicitarPermiso()
            }
            // callback
            .onChange(of: locationManager.location) { _, newlocation in
                // deprecado que solo da un parametro y por eso usamos el ' _ '
                if let newlocation = newlocation {
                    position = .region(
                        MKCoordinateRegion(
                            center: newlocation.coordinate,
                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        )
                    )
                }
            }
            .frame(height: 300)
            .cornerRadius(20)
            .shadow(radius: 10)
        }

    }
}

#Preview {
    VistaMapas()
}

//
//  TestMarker.swift
//  GoogleMapsDemo
//
//  Created by Milton Palaguachi on 2/3/21.
//

import Foundation
import GoogleMaps

enum TestMarder {
    static let address1 = "Gaspar Sangurima, Cuenca, US"
    static let address2 = "Calle del Batan, Cuenca, Ecuador"
    static let address3 = "Mall del Rio, Avenida Felipe II, Cuenca, Ecuador"
    static let address4 = "Avenida Elia Liut, Cuenca, Ecuador"
    static let address5 = "Av. Gonzalez Suarez. y Emilio Zapata, Cuenca Ecuador 010109, Ecuador"
    static let address6 = "Calle Larga, Cuenca 010107, Ecuador"
    
    static let place1 = PlaceDetails(address: address1, phone: "44444444", website: "www.example.com")
    static let place2 = PlaceDetails(address: address2, phone: "44444444", website: "www.example.com")
    static let place3 = PlaceDetails(address: address3, phone: "44444444", website: "www.example.com")
    static let place4 = PlaceDetails(address: address4, phone: "44444444", website: "www.example.com")
    static let place5 = PlaceDetails(address: address5, phone: "44444444", website: "www.example.com")

    static let postion1 = CLLocationCoordinate2DMake(-2.9018356,-79.0087052)
    static let postion2 = CLLocationCoordinate2DMake(-2.8922687,-79.0243996)
    static let postion3 = CLLocationCoordinate2DMake(-2.8976016,-78.978947)
    static let postion4 = CLLocationCoordinate2DMake(-2.9060989,-78.9990293)
    
    static let marker1 = Marker(name: "G-Grill", placeDetails: place2, coordinate: postion1)
    static let marker2 = Marker(name: "USxx", placeDetails: place3, coordinate: postion2)
    static let marker3 = Marker(name: "Museo Pumapugo", placeDetails: place4, coordinate: postion3)
    static let marker4 = Marker(name: "Park", placeDetails: place5, coordinate: postion4)

    static let markers: [Marker] = [marker1, marker2, marker3,marker4]
}

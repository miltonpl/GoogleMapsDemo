//
//  Marker.swift
//  GoogleMapsDemo
//
//  Created by Milton Palaguachi on 2/4/21.
//
import GoogleMaps

class Marker: GMSMarker {
    var name: String?
    var address: String?
    
    init(name: String, placeDetails: PlaceDetails?, coordinate: CLLocationCoordinate2D) {
        super.init()
        self.position = coordinate
        self.name = name
        self.address = placeDetails?.address
        self.setUI()
    }
    
    func setUI() {
//        groundAnchor = CGPoint(x: 0.5, y: 2.0)
        appearAnimation = .pop
        isDraggable = true
    }
}

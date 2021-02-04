//
//  MapView.swift
//  GoogleMapsDemo
//
//  Created by Milton Palaguachi on 2/3/21.
//

import UIKit
import GoogleMaps

class MapView: UIView, MapViewProtocol, MarkerProtocol {
  
    @IBOutlet weak var googleMap: GMSMapView! {
        didSet {
            self.googleMap.delegate = self
            self.googleMap.mapType = .normal
            self.googleMap.isMyLocationEnabled = true
            
            self.googleMap.settings.compassButton = true
            self.googleMap.settings.myLocationButton = true
            self.googleMap.settings.setAllGesturesEnabled(true)
//            self.googleMap.setMinZoom(kGMSMinZoomLevel, maxZoom: kGMSMaxZoomLevel)
        }
    }
    //Camara Zoom boundry(5, 20)
    @ZoomCamera
    private var zoom: Float  = 15
    
    weak var delegate: MapViewDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Zoom In/Out ABAction
    
    @IBAction func zoomInCamara(_ sender: Any) {
        if self.zoom != googleMap.camera.zoom {
            self.zoom = googleMap.camera.zoom
        }
        self.zoom = zoom + 1
        self.googleMap.animate(toZoom: zoom)
    }
    
    @IBAction func zoomOutCamara(_ sender: Any) {
        if self.zoom != googleMap.camera.zoom {
            self.zoom = googleMap.camera.zoom
        }
        self.zoom = zoom - 1
        self.googleMap.animate(toZoom: zoom)
    }
    
    // MARK: - Google Map Manager Methods
    
    func clearMap() {
        self.googleMap.clear()
    }
    
    func setMapToLocation(_ location: CLLocationCoordinate2D, withZoom zoom: CGFloat) {
        self.googleMap.animate(to: GMSCameraPosition.camera(withTarget: location, zoom: Float(zoom)))
    }
    
    func getZoomLevelOfMap() -> CGFloat {
        CGFloat(self.googleMap.camera.zoom)
    }
    
    // MARK: - Marker Manager Methods
    
    func setMarkersOnMap(markers: [GMSMarker], screenEdgeInset edgeInset: UIEdgeInsets) {
        markers.forEach { marker in
            marker.map = self.googleMap
        }
        self.zoomGoogleMapView(toFitMarkers: markers, screenEdgeInset: edgeInset)
    }
    
    func zoomGoogleMapView(toFitMarkers markers: [GMSMarker], screenEdgeInset edgeInset: UIEdgeInsets) {
        let path = GMSMutablePath()
        markers.forEach { marker in
            path.add(marker.position)
        }
        let bounds = GMSCoordinateBounds(path: path)
        self.googleMap.animate(with: GMSCameraUpdate.fit(bounds, with: edgeInset))
    }
    
    func addMarkerOnMap(marker: GMSMarker, withZoom zoom: CGFloat) {
        marker.map = self.googleMap
        self.googleMap.animate(to: GMSCameraPosition.camera(withTarget: marker.position, zoom: Float(zoom)))
        self.googleMap.isMyLocationEnabled = true
    }
}

// MARK: - GMSMapView Delegate

extension MapView: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        self.delegate?.mapView(mapView, didChange: position)
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.delegate?.mapView(mapView, didTapAt: coordinate)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        self.delegate?.mapView(mapView, didTapOn: marker)
        return false
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        self.delegate?.didTapMyLocationButton(for: mapView)
        return true
    }
    
    // MARK: - I have not use these methods
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
        UIView()
    }
    
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        UIView()
    }
}

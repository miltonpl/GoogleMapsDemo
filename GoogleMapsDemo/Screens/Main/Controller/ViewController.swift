//
//  ViewController.swift
//  GoogleMapsDemo
//
//  Created by Milton Palaguachi on 2/3/21.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MapView! {
        didSet {
            self.mapView.delegate = self
        }
    }
    private var myLocation: CLLocation?
    private var locationHandler: LocationHandler?
    private var currentMarker: Marker?
    private var markerView: MarkerView?
    private let edgeInset = UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationHandler = LocationHandler()
        self.locationHandler?.getUserLocation()
        self.locationHandler?.delegate = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.addSomeMarkers()
        }
    }
    
    func addSomeMarkers() {
        self.mapView.setMarkersOnMap(markers: TestMarder.markers, screenEdgeInset: self.edgeInset)
    }
}

extension ViewController: MapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        guard self.markerView != nil, let position = self.currentMarker?.position else { return }
        let markerPoint = self.mapView.googleMap.projection.point(for: position)
        self.markerView?.center = CGPoint(x: markerPoint.x, y: markerPoint.y - 110)
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        guard self.currentMarker != nil else { return }
        self.markerView?.removeFromSuperview()
        self.markerView = nil
        self.currentMarker = nil
    }
    
    func mapView(_ mapView: GMSMapView, didTapOn marker: GMSMarker) {
        // make sure in not the same else return
        guard let marker = marker as? Marker, self.currentMarker != marker else { return }
        
        // if marker has previously been tapped and stored in currentMaker then nil it out
        if self.currentMarker != nil {
            self.currentMarker = nil
        }
        self.currentMarker = marker
        
        //remove markerView
        if self.markerView != nil {
            self.markerView?.removeFromSuperview()
            self.markerView = nil
        }
        
        let markerView = MarkerView()
        //save the reference or address of makerView
        self.markerView = markerView
        
        let markerPoint = self.mapView.googleMap.projection.point(for: marker.position)
        markerView.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width * 0.6, height: self.view.frame.height/5)
        markerView.center = CGPoint(x: markerPoint.x, y: markerPoint.y - 110)
        markerView.confiure(marker: marker)
        self.mapView.addSubview(markerView)
        self.mapView.bringSubviewToFront(markerView)
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) {
        guard let coordinate = self.myLocation?.coordinate else { return  }
        
        let marker = Marker(name: "Your Location", placeDetails: TestMarder.place1, coordinate:coordinate)

        self.mapView.addMarkerOnMap(marker: marker, withZoom: 15)
    }
}
extension ViewController: LocationHandlerDelegate {
    func userLocation(location: CLLocation) {
        self.myLocation = location
    }
    
    func locationDidFailWithError(error: Error) {
        print("error - \(error.localizedDescription)")
    }
    
    
}

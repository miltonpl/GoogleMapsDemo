//
//  MapViewProtocols.swift
//  GoogleMapsDemo
//
//  Created by Milton Palaguachi on 2/3/21.
//

import UIKit
import GoogleMaps

enum MapRegionChangedType: Int {
    case None = 0
    case Pan
    case Pinch
    case InitLocation
}

enum ZoomType {
    case zoomIn, zoomOut
}

protocol MapViewProtocol {
    func clearMap()
    func setMapToLocation(_ location: CLLocationCoordinate2D, withZoom zoom: CGFloat)
    func getZoomLevelOfMap() -> CGFloat
}

protocol MarkerProtocol {
    func setMarkersOnMap(markers: [GMSMarker], screenEdgeInset edgeInset: UIEdgeInsets)
    func zoomGoogleMapView(toFitMarkers markers: [GMSMarker],screenEdgeInset edgeInset: UIEdgeInsets)
    func addMarkerOnMap(marker: GMSMarker, withZoom zoom: CGFloat)
}

protocol MapViewDelegate: AnyObject {
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition)
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D)
    func mapView(_ mapView: GMSMapView, didTapOn marker: GMSMarker)
    func didTapMyLocationButton(for mapView: GMSMapView)
}

/*
protocol MapViewDelegate: AnyObject {
 
     func mapView(_ mapView: GMSMapView, didPanRegionWithCamerPosition position: GMSCameraPosition)
     func mapView(_ mapView: GMSMapView, didPinchRegionWithCamerPosition position: GMSCameraPosition)
     func mapView(_ mapView: GMSMapView, willMove gesture: Bool)
     func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition)
     func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition)
     func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D)
     func mapView(_ mapView: GMSMapView, didLongPressAtCoordinate coordinate: CLLocationCoordinate2D)
     func mapView(_ mapView: GMSMapView, didTapOn marker: GMSMarker)
     func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay)
     func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker)
     func didTapMyLocationButton(for mapView: GMSMapView)
     func mapViewDidStartTileRendering(_ mapView: GMSMapView)
     func mapViewDidFinishTileRendering(_ mapView: GMSMapView)
     //Called when map is stable (tiles loaded, labels rendered, camera idle) and overlay objects have been rendered.
     func mapViewSnapshotReady(_ mapView: GMSMapView)
     func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView?
}

extension MapViewDelegate {
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
    }
    
    func mapView(_ mapView: GMSMapView, didPinchRegionWithCamerPosition position: GMSCameraPosition) {
        
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
    }
    
    
    func mapView(_ mapView: GMSMapView, didLongPressAtCoordinate coordinate: CLLocationCoordinate2D) {
        
    }
    
    
    func mapView(_ mapView: GMSMapView, didTap overlay: GMSOverlay) {
        
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        
    }
    
    func mapViewDidStartTileRendering(_ mapView: GMSMapView) {
        
    }
    
    func mapViewDidFinishTileRendering(_ mapView: GMSMapView) {
        
    }
    
    func mapViewSnapshotReady(_ mapView: GMSMapView) {
        
    }
}
*/

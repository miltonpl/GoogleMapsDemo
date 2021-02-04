//
//  Zoom.swift
//  GoogleMapsDemo
//
//  Created by Milton Palaguachi on 2/4/21.
//

import Foundation
@propertyWrapper
struct ZoomCamera {
    private let minZoom = 5.0
    private let maxZoom = 20.0
    private var value: Float
    init(wrappedValue value: Float) {
        self.value = value
    }
    var wrappedValue: Float {
        get {
            return Float(max(min(Double(value),maxZoom), minZoom))
        }
        set {
            value = newValue
        }
    }
}

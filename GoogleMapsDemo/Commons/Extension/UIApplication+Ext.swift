//
//  UIApplication+Ext.swift
//  GoogleMapsDemo
//
//  Created by Milton Palaguachi on 2/4/21.
//

import UIKit
extension UIApplication {
    static func openSettings() {
        guard let urlSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(urlSettings) else { return }
        UIApplication.shared.open(urlSettings) { status in
            print("Open Settings\(status)")
        }
    }
}

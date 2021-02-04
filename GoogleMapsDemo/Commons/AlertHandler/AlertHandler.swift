//
//  AlertHandler.swift
//  GoogleMapsDemo
//
//  Created by Milton Palaguachi on 2/4/21.
//

import UIKit

protocol AlertHandler: UIViewController {
    func showAlert(_ title: String?, _ message: String?, actions: [ActionType], completion: @escaping(_ action: ActionType) -> Void)
}

extension AlertHandler {
    func showAlert(_ title: String?, _ message: String?, actions: [ActionType], completion: @escaping(_ action: ActionType) -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { actionType in
            let action = UIAlertAction(title: actionType.rawValue.capitalized, style: .cancel) { [actionType] _ in
                completion(actionType)
            }
            alert.addAction(action)
        }
        present(alert, animated: true)
    }
}

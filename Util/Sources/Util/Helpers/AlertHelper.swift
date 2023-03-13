//
//  AlertHelper.swift
//  
//
//  Created by Kaan Ozdemir on 13.03.2023.
//

import UIKit

public class AlertHelper {
    
    private var title: String?
    private var message: String
    private var actions: [UIAlertAction]
    
    public init(title: String? = nil, message: String, actions: [UIAlertAction]) {
        self.title = title
        self.message = message
        self.actions = actions
    }
    
    public func present() {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach {
            alert.addAction($0)
        }
        
        UIApplication.shared.topViewController?.present(alert, animated: true)
    }
}

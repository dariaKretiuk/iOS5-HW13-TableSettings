//
//  AppDelegate+Extention.swift
//  iOS5-HW13-TableSettings
//
//  Created by Дарья Кретюк on 24.03.2022.
//

import UIKit

extension AppDelegate {
    
    static let appearance: UINavigationBarAppearance =  {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 247.0/255.0,
                                             green: 247.0/255.0,
                                             blue: 247.0/255.0,
                                             alpha: 1
        )
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        return appearance
    }()
    
    static func settingsNavigationBar() {
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}

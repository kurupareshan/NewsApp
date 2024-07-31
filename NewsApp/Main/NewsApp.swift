//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by kurupareshan pathmanathan on 7/30/24.
//

import SwiftUI

@main
struct NewsApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
}

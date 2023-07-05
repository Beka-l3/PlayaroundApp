//
//  PlayaroundAppApp.swift
//  PlayaroundApp
//
//  Created by Bekzhan Talgat on 04.07.2023.
//

import SwiftUI

@main
struct PlayaroundAppApp: App {
    @ObservedObject var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appCoordinator)
        }
    }
}


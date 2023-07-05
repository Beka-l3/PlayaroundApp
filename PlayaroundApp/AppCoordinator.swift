//
//  AppCoordinator.swift
//  PlayaroundApp
//
//  Created by Bekzhan Talgat on 04.07.2023.
//

import SwiftUI


final class AppCoordinator: ObservableObject {
    @Published var didFinishLoading: Bool = false
    @Published var isLoggedIn: Bool = false
    @Published var launchScreenIsReady: Bool = false
    
    
    init() {
        resovleEntrance()
    }
    
    
    func resovleEntrance() {
        let t = UInt32.random(in: 1...5)
        print("Waiting for entrance resolvance: \(t) sec")
        
        Task {
            sleep(t)
            await finishLoading()
        }
    }
    
    @MainActor private func finishLoading() {
        withAnimation(.easeInOut) {
            didFinishLoading = true
        }
    }
    
    
    func logIn() {
        
        Task {
            let t = UInt32.random(in: 2...3)
            sleep(t)
            
            await MainActor.run {
                withAnimation(.easeInOut) {
                    isLoggedIn = true
                }
            }
        }
    }
    
    func logOut() {
        Task {
            let t = UInt32.random(in: 2...3)
            sleep(t)
            
            await MainActor.run {
                withAnimation(.easeInOut) {
                    isLoggedIn = false
                }
            }
        }
    }
    
}

//
//  LaunchView.swift
//  PlayaroundApp
//
//  Created by Bekzhan Talgat on 04.07.2023.
//

import SwiftUI

struct LaunchView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    var body: some View {
        VStack(spacing: 8) {
            ProgressView()
            
            Text("Waiting for the app to be ready...")
                .font(.caption)
        }
        .onAppear {
            Task {
                sleep(3)
                setLaunchScreenToReady()
            }
        }
    }
    
    @MainActor func setLaunchScreenToReady() {
        appCoordinator.launchScreenIsReady = true
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView()
//            .preferredColorScheme(.dark)
//    }
//}

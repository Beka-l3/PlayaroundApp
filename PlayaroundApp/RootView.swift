//
//  RootView.swift
//  PlayaroundApp
//
//  Created by Bekzhan Talgat on 04.07.2023.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
//    @State private var path: [AnyView] = []
    
    var body: some View {
        if appCoordinator.didFinishLoading && appCoordinator.launchScreenIsReady {
            if appCoordinator.isLoggedIn {
                SessionView()
            } else {
                LogInView()
            }
        } else {
            LaunchView()
        }
    }
}

//struct RootView_Previews: PreviewProvider {
//    static var previews: some View {
//        @ObservedObject var appCoordinator = AppCoordinator()
//
//        RootView()
//            .environmentObject(appCoordinator)
//    }
//}

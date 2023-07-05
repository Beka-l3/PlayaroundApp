//
//  LogInView.swift
//  PlayaroundApp
//
//  Created by Bekzhan Talgat on 04.07.2023.
//

import SwiftUI

struct LogInView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Button {
                if !isLoading {
                    isLoading = true
                    appCoordinator.logIn()
                }
            } label: {
                Text("Log in")
                    .font(.system(size: 18).bold())
                    .foregroundColor(colorScheme == .dark ? .black : .white)
                    .frame(width: 280, height: 50)
                    .background(Color("FocusColor"))
                    .cornerRadius(10)
            }
            .padding(.bottom, 120)

            Spacer()
            
            if isLoading {
                ProgressView()
                    .tint(Color("FocusColor"))
            }
            
            Spacer()
        }
        .onDisappear {
            isLoading = false
        }
    }
}





//struct LogInView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogInView()
//            .preferredColorScheme(.dark)
//    }
//}

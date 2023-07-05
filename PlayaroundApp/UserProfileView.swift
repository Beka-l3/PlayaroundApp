//
//  UserProfileView.swift
//  PlayaroundApp
//
//  Created by Bekzhan Talgat on 04.07.2023.
//

import SwiftUI

struct UserProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var appCoordinator: AppCoordinator
    @Binding var tabbarOffsetFactor: CGFloat
    
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(colorScheme == .dark ? .white : .black)
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    
                    NavigationLink {
                        UserProfileEditorView(tabbarOffsetFactor: $tabbarOffsetFactor)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 0.4)) {
                                    tabbarOffsetFactor = 1
                                }
                            }
                    } label: {
                        Text("Edit")
                            .font(.system(size: 18).bold())
                            .foregroundColor(Color("FocusColor"))
                            .frame(width: 280, height: 50)
                            .background(colorScheme == .dark ? .black : .white)
                            .cornerRadius(10)
                    }
                    .padding(.vertical, 120)
                    
                    
                    Button {
                        if !isLoading {
                            isLoading = true
                            appCoordinator.logOut()
                        }
                    } label: {
                        Text("Log out")
                            .font(.system(size: 18).bold())
                            .foregroundColor(Color("FocusColor"))
                            .frame(width: 280, height: 50)
                            .background(colorScheme == .dark ? .black : .white)
                            .cornerRadius(10)
                    }
//                    .padding(.top, 120)
                    
                    Spacer()
                    
                    if isLoading {
                        ProgressView()
                            .tint(colorScheme == .dark ? .black : .white)
                    }

                    
                    Spacer()
                }
            }
            .onDisappear {
                isLoading = false
            }
        }
    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView(tabbarOffsetFactor: .constant(0))
//            .preferredColorScheme(.dark)
//    }
//}

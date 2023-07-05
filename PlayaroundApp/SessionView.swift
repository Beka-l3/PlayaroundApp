//
//  SessionView.swift
//  PlayaroundApp
//
//  Created by Bekzhan Talgat on 04.07.2023.
//

import SwiftUI



struct SessionView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @State var selectedTab: Tab = .coffee
    @State var tabbarOffsetFactor: CGFloat = 0
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ChatView().tag(Tab.chat)

                    CoffeeView().tag(Tab.coffee)

                    UserProfileView(tabbarOffsetFactor: $tabbarOffsetFactor)
                        .tag(Tab.profile)
                }
            }
            
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
                    .offset(y: 120 * tabbarOffsetFactor)
            }
            .ignoresSafeArea()
            
        }   
    }
}

//struct SessionView_Previews: PreviewProvider {
//    static var previews: some View {
//        SessionView()
//            .preferredColorScheme(.dark)
//    }
//}












/*
 
 TabView {
     ChatView()
         .tabItem {
             Image(systemName: "message.fill")
             Text("Chat")
         }
     
     RatingView()
         .tabItem {
             Image(systemName: "cup.and.saucer.fill")
             Text("Coffee")
         }
     
     UserProfileView()
         .tabItem {
             Image(systemName: "person.fill")
             Text("User")
         }
 }
 .background(.black)
 
 
 */

//
//  CustomTabBar.swift
//  PlayaroundApp
//
//  Created by Bekzhan Talgat on 04.07.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case chat = "message"
    case coffee = "cup.and.saucer"
    case profile = "person"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var filledImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var selectedColor: Color {
        switch selectedTab {
        case .chat:
            return .yellow
        case .coffee:
            return .green
        case .profile:
            return .blue
        }
    }
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? filledImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? selectedColor : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .padding(.vertical, 24)
        }
        .frame(maxHeight: 120, alignment: .top)
        .background(.black)
        .cornerRadius(36, corners: [.topLeft, .topRight])
        
    }
}

//struct CustomTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabBar(selectedTab: .constant(.coffee))
//    }
//}

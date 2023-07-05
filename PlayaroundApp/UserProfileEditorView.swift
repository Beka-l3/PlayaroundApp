//
//  UserProfileEditorView.swift
//  PlayaroundApp
//
//  Created by Bekzhan Talgat on 04.07.2023.
//

import SwiftUI

struct UserProfileEditorView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var tabbarOffsetFactor: CGFloat
    
    var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.4)) {
                tabbarOffsetFactor = 0.0
            }
            dismiss()
        } label: {
            Text("Save changes")
                .font(.system(size: 18).bold())
                .foregroundColor(.white)
                .frame(width: 280, height: 50)
                .background(.black)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("FocusColor"), lineWidth: 1)
                }
                
        }
        .padding(.bottom, 120)
        .toolbar(.hidden)
    }
}

//struct UserProfileEditorView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileEditorView(tabbarOffsetFactor: $tabbarOffsetFactor)
//            .preferredColorScheme(.dark)
//    }
//}

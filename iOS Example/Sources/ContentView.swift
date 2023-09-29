//
//  ContentView.swift
//  iOS Example
//
//  Created by Ayoub on 29/9/2023.
//

import SwiftUI
import DialogUI


struct ContentView: View {
    
    @State private var showDialog = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Spacer()
            Button {
                showDialog.toggle()
            } label: {
                Text("Show dialog").foregroundColor(.white)
            }
            .padding(16)
            .background(.gray)
            .cornerRadius(12)
            .shadow(radius: 2)
            Spacer()
        }
        .background(.white)
        .asDialogUI(show: $showDialog, content: DialogContentEx)
    }
    
    @ViewBuilder
    private func DialogContentEx() -> some View {
        VStack(spacing: 20) {
            Text("Dialog title").foregroundColor(.black).font(.system(size: 20, weight: Font.Weight.semibold))
            Text("This is dialog message, a dummy decsription only to fill up the dialog demo text, so you can design whatever you like inside the dialog view content.").foregroundColor(.black).font(.system(size: 14, weight: Font.Weight.regular))
            HStack(spacing: 10) {
                Button {
                    self.showDialog = false
                } label: {
                    Text("OK").foregroundColor(.white)
                }
                .padding(12)
                .frame(width: 120)
                .background(.green)
                .cornerRadius(12)
                
                Button {
                    self.showDialog = false
                } label: {
                    Text("Cancel").foregroundColor(.white)
                }
                .padding(12)
                .frame(width: 120)
                .background(.gray)
                .cornerRadius(12)
            }
        }
        .padding(20)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
        .padding(20)
    }
}

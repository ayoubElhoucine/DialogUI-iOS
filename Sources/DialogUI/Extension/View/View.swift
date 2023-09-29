//
//  File.swift
//  
//
//  Created by Ayoub on 29/9/2023.
//

import Foundation
import SwiftUI

extension View {
    public func asDialogUI<ContentView: View>(show: Binding<Bool>, content: @escaping () -> ContentView) -> some View {
        self.modifier(DialogViewModifier(content: content, show: show))
    }
}

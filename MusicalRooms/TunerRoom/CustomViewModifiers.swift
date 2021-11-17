//
//  CustomViewModifiers.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 17/11/21.
//

import Foundation
import SwiftUI

extension Text {
    func brownBoldText() -> some View {
        self.fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .modifier(SharpTextViewModifier())
    }
}

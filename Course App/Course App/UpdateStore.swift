//
//  UpdateStore.swift
//  Course App
//
//  Created by SKUBI on 04/04/23.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

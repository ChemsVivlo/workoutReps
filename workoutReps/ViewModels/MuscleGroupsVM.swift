//
//  MuscleGroupsVM.swift
//  workoutReps
//
//  Created by Jose Vivanco on 08/05/24.
//

import Foundation
import SwiftUI

class MuscleGroupsVM: ObservableObject {
    @Published var isEditing: Bool = false
    @Published var indexTapped: Int?
    @Published var isLongPressing: Bool = false
    
    let colors: [Color] = [
        .red,
        .green,
        .blue,
        .purple,
        .orange,
        .yellow
    ]
}

//
//  MuscleGroupView.swift
//  workoutReps
//
//  Created by Jose Vivanco on 23/03/24.
//

import SwiftUI

struct MuscleGroupCell: View {
    let muscleGroupName: String
    let color: Color
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(width: 170, height: 170)
                    .foregroundColor(color)
                    .opacity(0.8)
                    .cornerRadius(30)
                VStack{
                    Text(muscleGroupName)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .medium, design: .rounded))
                        .minimumScaleFactor(0.5)
                        .lineLimit(3)
                }
            }
            .frame(width: 170, height: 170)
        }
    }
}

#Preview {
    MuscleGroupCell(muscleGroupName: "Muscle Group Name", color: .accentColor)
}

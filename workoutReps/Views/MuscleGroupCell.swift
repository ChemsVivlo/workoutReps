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
    let localIndex: Int
    @Binding var isEditing: Bool
    @Binding var indexTapped: Int?
    @Binding var isLongPressing: Bool
    @State private var isAnimating = false
    @State private var animationAngle: Double = Double.random(in: -5.0...5.0)
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            basicCellAndText
            if isEditing, !isLongPressing {
                //White circle with option of selection
                editCircle
            } else if isLongPressing {
                //White circle with minus sign in it
                deleteCircle
            }
        }
        .frame(width: 170, height: 170)
        .rotationEffect(Angle(degrees: isLongPressing ? animationAngle : 0))
        .onChange(of: isLongPressing, { oldValue, newValue in
            shakeAnimation(isDeleting: newValue)
        })
    }
}


// MARK: Components

extension MuscleGroupCell {
    
    private var basicCellAndText: some View {
        ZStack {
            Rectangle()
                .frame(width: 170, height: 170)
                .foregroundColor(color)
                .cornerRadius(30)
            VStack{
                Text(muscleGroupName)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .medium, design: .rounded))
                    .minimumScaleFactor(0.5)
                    .lineLimit(4)
            }
            .padding(.horizontal, 2)
        }
    }
    
    private var editCircle: some View {
        ZStack {
            Circle()
                .frame(height: 20)
                .foregroundColor(.white)
                .offset(x: 67, y: -67)
            
            if let selectedIndex = indexTapped {
                //When selected, draw an internal circle
                if selectedIndex == localIndex {
                                            Circle()
                                                .frame(height: 10)
                                                .foregroundColor(color)
                                                .offset(x: 67, y: -67)
                }
            }
        }
    }
    
    private var deleteCircle: some View {
        ZStack {
            Circle()
                .frame(height: 20)
                .foregroundColor(.white)
                .offset(x: 67, y: -67)
            Rectangle()
                .frame(width: 10, height: 5)
                .foregroundColor(color)
                .offset(x: 67, y: -67)
        }
    }
    
}


// MARK: Functions

extension MuscleGroupCell {
    
    func shakeAnimation(isDeleting: Bool) {
        if isDeleting {
            timer = Timer.scheduledTimer(withTimeInterval: 0.12, repeats: true) { _ in
                withAnimation(.linear(duration: 0.1)){
                    animationAngle = animationAngle <= 0 ? 5 : -5
                }
            }
        } else {
            animationAngle = Double.random(in: -5.0...5.0)
            timer?.invalidate()
            timer = nil
        }
    }
}

#Preview {
    MuscleGroupCell(muscleGroupName: "Muscle Group Name", color: .accentColor, localIndex: 0, isEditing: .constant(true), indexTapped: .constant(0), isLongPressing: .constant(true))
}

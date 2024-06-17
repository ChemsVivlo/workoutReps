//
//  AddView.swift
//  workoutReps
//
//  Created by Jose Vivanco on 24/03/24.
//

import SwiftUI

struct AddMuscleGroupView: View {
    
    @EnvironmentObject var userModel: UserModel
    @Environment(\.presentationMode) var presentationMode
    
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
        }
        .navigationTitle("Add a Muscle Group 💪🏻")
        .alert(isPresented: $showAlert, content: getAlert)
        .padding(14)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            let newMuscleGroup = MuscleGroupModel(muscleGroupName: textFieldText, exercises: [])
            userModel.addMuscleGroup(newMuscleGroup)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new item must be at least 3 characters long 😱😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationView {
        AddMuscleGroupView()
    }.environment(UserModel(userName: nil, age: nil, profileImageURLString: nil))
}

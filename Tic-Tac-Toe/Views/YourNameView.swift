//
//  YourNameView.swift
//  Tic-Tac-Toe
//
//  Created by Bayu Sedana on 14/08/23.
//

import SwiftUI

struct YourNameView: View {
    // MARK: - Properties
    @AppStorage("yourName") var yourName = ""
    @State private var userName = ""
    var body: some View {
        VStack {
            Text("This is the name that will be use in this Device.")
            TextField("Your Name", text: $userName)
                .autocorrectionDisabled()
                .textFieldStyle(.roundedBorder)
            Button("Set") {
                yourName = userName
            }
            .buttonStyle(.borderedProminent)
            .disabled(userName.isEmpty)
            
            Image("Launchscreen")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Tic Tac Toe")
        .inNavigationStack()
    }
}

struct YourNameView_Previews: PreviewProvider {
    static var previews: some View {
        YourNameView()
    }
}

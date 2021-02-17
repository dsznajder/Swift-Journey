//
//  ProfileView.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import SwiftUI

struct ProfileView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        Form {
            VStack(spacing: 10) {
                Section(header: Text("Personal info")) {
                    TextField("First name", text: $viewModel.firstName)
                    TextField("Last name", text: $viewModel.lastName)
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    SecureField("Password", text: $viewModel.password)
                    SecureField("Password confirmation", text: $viewModel.passwordConfirmation)
                    
                    DatePicker("Birthday", selection: $viewModel.birthday, displayedComponents: .date)
                    Toggle("Subscribe", isOn: $viewModel.subscriber)
                        .toggleStyle(SwitchToggleStyle(tint: .primary))
                }
            }
            .border(viewModel.isValid ? Color(.systemBackground) : Color(.red), width: 0.5)
            if viewModel.subscriber {
                Section(header: Text("Payment Info")) {
                    TextField("Card Number", text: $viewModel.cardNumber)
                        .keyboardType(.numberPad)
                    TextField("CVV", text: $viewModel.cvv)
                    
                    DatePicker("Expiration Date", selection: $viewModel.cardExpirationDate, displayedComponents: .date)
                }
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}

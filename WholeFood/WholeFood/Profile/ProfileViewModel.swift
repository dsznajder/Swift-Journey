//
//  ProfileViewModel.swift
//  WholeFood
//
//  Created by Damian Sznajder on 16/02/2021.
//

import Foundation
import Combine

final class ProfileViewModel: ObservableObject {
    
    
    
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var passwordConfirmation = ""
    @Published var birthday = Date()
    @Published var subscriber = false
    @Published var cardNumber = ""
    @Published var cvv = ""
    @Published var cardExpirationDate = Date()
    
    @Published var isValid = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
//        $email
//            .map { $0.contains(".") }
//            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
//            .assign(to: &$isValid)
        
        Publishers.CombineLatest(
            $email.map(isEmailValid),
            passwordIsConfirmedAndValid
        )
        .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
        .map { $0 && $1 }
        .assign(to: &$isValid)
    }
    
    private func isEmailValid(_ email: String) -> Bool {
        email.contains("@") && email.contains(".")
    }
    
    private func isPasswordValid(_ password: String) -> Bool {
        password.count > 6
    }
    
    private func passwordIsValid() -> AnyPublisher<Bool, Never> {
        $password.map(isPasswordValid)
            .eraseToAnyPublisher()
    }
    
    private var passwordMatchesConfirmation: AnyPublisher<Bool, Never> {
        $password.combineLatest($passwordConfirmation)
            .map { $0 == $1 }
            .eraseToAnyPublisher()
    }
    
    private var passwordIsConfirmedAndValid: AnyPublisher<Bool, Never> {
        passwordIsValid().combineLatest(passwordMatchesConfirmation)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }
 
}

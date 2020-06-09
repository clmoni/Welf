//
//  AuthenticationService.swift
//  Welf
//
//  Created by Clement Oniovosa on 17/05/2020.
//  Copyright © 2020 Clement Oniovosa. All rights reserved.
//

import Foundation
import AWSMobileClient

struct AuthenticationService {
    public let user = User()
    
    public func initialise<T>(app: T) where T : AppDelegate {
        self.addUserStateListener(app: app)
        self.doInitialisation()
    }
    
    public func signIn(username: String, password: String) {
        self.changeSigningInState(isSigningIn: true)
        AWSMobileClient.default().signIn(username: username, password: password) {(signInResult, error) in
            if let error = error as? AWSMobileClientError {
                print("\(error)")
                self.translateAWSMobileClientErrorToInternalAuthenticationErrorState(awsError: error)
            } else if let signInResult = signInResult {
                self.logSignInResult(signInResult)
            }
            self.changeSigningInState(isSigningIn: false)
        }
    }
    
    public func signOut() {
        DispatchQueue.main.async {
            AWSMobileClient.default().signOut()
        }
    }
    
    private func changeSigningInState(isSigningIn: Bool) {
        DispatchQueue.main.async {
            self.user.authenticationState.isSigningIn = isSigningIn
        }
    }
    
    private func translateAWSMobileClientErrorToInternalAuthenticationErrorState(awsError: AWSMobileClientError?) {
        DispatchQueue.main.async {
            switch awsError {
            case .notAuthorized, .invalidParameter, .userNotFound:
                self.user.authenticationState.isBadCredentialsSignInError = true
                self.user.authenticationState.isNonUserFaultSignInError = false
            default:
                self.user.authenticationState.isBadCredentialsSignInError = false
                self.user.authenticationState.isNonUserFaultSignInError = true
            }
        }
    }
    
    private func doInitialisation() {
        AWSMobileClient.default().initialize({(userState, error) in
            // notify our subscriber the value changed
            self.user.authenticationState.isSignedIn = AWSMobileClient.default().isSignedIn
            self.logUserStateOrError(userState: userState, error: error)
        })
    }
    
    private func addUserStateListener<T> (app: T) where T : AppDelegate {
        // Override point for customization after application launch.
        AWSMobileClient.default().addUserStateListener(app) { (userState, info) in
            
            // notify our subscriber the value changed
            DispatchQueue.main.async {
                self.user.authenticationState.isSignedIn = AWSMobileClient.default().isSignedIn
            }
            
            self.logUserState(userState)
        }
    }
    
    private func logSignInResult(_ signInResult: SignInResult) {
        switch (signInResult.signInState) {
        case .signedIn:
            print("User is signed in.")
        case .smsMFA:
            print("SMS message sent to \(signInResult.codeDetails!.destination!)")
        default:
            print("Sign In needs info which is not et supported.")
        }
    }
    
    private func logUserStateOrError(userState: UserState?, error: Error?){
        if let userState = userState {
            print("UserState: \(userState.rawValue)")
        } else if let error = error {
            print("error: \(error.localizedDescription)")
        }
    }
    
    private func logUserState(_ userState: UserState)  {
        switch(userState) {
        case .guest:
            print("user is in guest mode.")
        case .signedOut:
            print("user just signed out.")
        case .signedIn:
            print("user just signed in.")
            print("username : \(String(describing: AWSMobileClient.default().username))")
            
            AWSMobileClient.default().getUserAttributes(completionHandler:{ (attributes, error) in
                print("error : \(String(describing: error))")
                print("attributes : \(String(describing: attributes))")
                print("")
                
                AWSMobileClient.default().getTokens({(tokens, error) in
                    print("error : \(String(describing: error))")
                    print("token : \(String(describing: tokens))")
                    print("")
                })
            })
        case .signedOutUserPoolsTokenInvalid:
            print("need to login again.")
        case .signedOutFederatedTokensInvalid:
            print("need logged in via federation, but currently needs new tokens.")
        default:
            print("unsupported")
        }
    }
}

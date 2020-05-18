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
    
    public func initialise(app: AppDelegate) {
        // Override point for customization after application launch.
        AWSMobileClient.default().addUserStateListener(app) { (userState, info) in
            
            // notify our subscriber the value changed
            DispatchQueue.main.async {
                app.userData.isSignedIn = AWSMobileClient.default().isSignedIn
            }
            
            self.logUserState(userState)
        }
        
        AWSMobileClient.default().initialize({(userState, error) in
            // notify our subscriber the value changed
            app.userData.isSignedIn = AWSMobileClient.default().isSignedIn
            self.logUserStateOrError(userState: userState, error: error)
        })
    }
    
    public func authenticateWithDropinUI(navigationController : UINavigationController) {
        print("dropinUI()")
        
        // Option to launch sign in directly
        let signinUIOptions = SignInUIOptions(canCancel: false, logoImage: UIImage(named: "lemon-logo"), backgroundColor: .secondarySystemBackground)

        AWSMobileClient.default().showSignIn(navigationController: navigationController, signInUIOptions: signinUIOptions, { (signInState, error) in
            if let signInState = signInState {
                print("Sign in flow completed: \(signInState)")
            } else if let error = error {
                print("error logging in: \(error.localizedDescription)")
            }
        })
    }
    
    public func authenticateWithHostedUI(navigationController : UINavigationController) {
        print("hostedUI()")
        // Optionally override the scopes based on the usecase.
        let hostedUIOptions = HostedUIOptions(scopes: ["openid", "email", "profile", "aws.cognito.signin.user.admin"])

        // Present the Hosted UI sign in.
        AWSMobileClient.default().showSignIn(navigationController: navigationController, hostedUIOptions: hostedUIOptions) { (userState, error) in
            if let error = error as? AWSMobileClientError {
                print(error.localizedDescription)
            }
            if let userState = userState {
                print("Status: \(userState.rawValue)")

            }
        }
    }
    
    public func signIn(username: String, password: String) {
        AWSMobileClient.default().signIn(username: username, password: password) {(signInResult, error) in
            if let error = error  {
                print("\(error)")
                // in real life, present an error message to user
            } else if let signInResult = signInResult {
                switch (signInResult.signInState) {
                case .signedIn:
                    print("User is signed in.")
                case .smsMFA:
                    print("SMS message sent to \(signInResult.codeDetails!.destination!)")
                default:
                    print("Sign In needs info which is not et supported.")
                }
            }
        }
    }
    
    public func signOut() {
        DispatchQueue.main.async {
            AWSMobileClient.default().signOut()
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
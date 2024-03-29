import AuthenticationServices
import SwiftUI


class SignInWithAppleDelegate: NSObject {
//    @EnvironmentObject var loginVM : LoginViewModel
    
    private let signInSucceeded: (Bool) -> Void
    init(onSignedIn: @escaping (Bool) -> Void) {
        signInSucceeded = onSignedIn
    }
}
extension SignInWithAppleDelegate: ASAuthorizationControllerDelegate {
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIdCredential as ASAuthorizationAppleIDCredential:
            if let _ = appleIdCredential.email, let _ = appleIdCredential.fullName {
                print("0️⃣ 첫 로그인 (회원가입)")
                
//                if let authorizationCode = appleIdCredential.authorizationCode {
//                    print("authorizationCode : \(String(data: authorizationCode, encoding: .utf8))")
//                }
                if let identity_token = appleIdCredential.identityToken {
                    let token = (String(data: identity_token, encoding: .utf8)!)
                    print("identity_token : \(token)")
                    LoginViewModel.shared.signin(token: token, loginProvider: .APPLE)
                }
                
//                          print("identityToken: \(String(describing: appleIdCredential.identityToken!))\nauthorizationCode: \(appleIdCredential.authorizationCode!)\nuser: \(credential.user)\nemail: \(String(describing: credential.email))\ncredential: \(credential)")
            } else {
                print("1️⃣ 로그인함")
                
//                if let authorizationCode = appleIdCredential.authorizationCode {
//                    print("authorizationCode : \(String(data: authorizationCode, encoding: .utf8))")
//                }
                if let identity_token = appleIdCredential.identityToken {
                    let token = (String(data: identity_token, encoding: .utf8)!)
                    print("identity_token : \(token)")
                    LoginViewModel.shared.signin(token: token, loginProvider: .APPLE)
                }
            signInSucceeded(true)
            }
        default:
            break
        }
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {}
}

extension SignInWithAppleDelegate: ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    return UIApplication.shared.windows.last!
  }
}

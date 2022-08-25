import AuthenticationServices
import SwiftUI
class SignInWithAppleDelegate: NSObject {
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
                print("0️⃣ 최초로그인 (회원가입)")
                print(appleIdCredential)
                
//                if  let authorizationCode = appleIDCredential.authorizationCode,
//                    let identityToken = appleIDCredential.identityToken,
//                    let authString = String(data: authorizationCode, encoding: .utf8),
//                    let tokenString = String(data: identityToken, encoding: .utf8) {
//                    print("authorizationCode: \(authorizationCode)")
//                    print("identityToken: \(identityToken)")
//                    print("authString: \(authString)")
//                    print("tokenString: \(tokenString)")
//                }
                
            } else {
                print("1️⃣ 재로그인")
                
            }
        default:
            break
        }
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {}
    
//    private func displayLog(credential: ASAuthorizationAppleIDCredential) {
//        print("identityToken: \(String(describing: credential.identityToken))\nauthorizationCode: \(credential.authorizationCode!)\nuser: \(credential.user)\nemail: \(String(describing: credential.email))\ncredential: \(credential)")
//    }
}


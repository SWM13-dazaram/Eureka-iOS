import SwiftUI
import MessageUI


struct EmailSender: UIViewControllerRepresentable {
  @Environment(\.presentationMode) var presentationMode

  func makeUIViewController(context: Context) -> MFMailComposeViewController {
    let mail = MFMailComposeViewController()
      let contents = "Email Comment".localized()

    mail.setSubject("App Name".localized()+"APP"+"Contact".localized())
    mail.setToRecipients(["dazaram2022@gmail.com"])
    mail.setMessageBody(contents, isHTML: false)

    // delegate 채택
//    mail.delegate = context.coordinator 주의: 이렇게 하면 안됨!!
    mail.mailComposeDelegate = context.coordinator
    return mail
  }

  func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}

  typealias UIViewControllerType = MFMailComposeViewController

  class Coordinator: NSObject, MFMailComposeViewControllerDelegate, UINavigationControllerDelegate {
    var parent: EmailSender

    init(_ parent: EmailSender) {
      self.parent = parent
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
      // TODO(iOS버그)
      // Error creating the CFMessagePort needed to communicate with PPT. 가 오는데 메일 정상적으로 보내지는 문제 https://stackoverflow.com/questions/63441752/error-creating-the-cfmessageport-needed-to-communicate-with-ppt
      
      // https://developer.apple.com/forums/thread/662643
      controller.dismiss(animated: true, completion: nil)
    }
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
}

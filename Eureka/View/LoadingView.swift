
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color.bg
            VStack{
                Spacer()
                Image("MainIcon")
                ProgressView("")
                    .progressViewStyle(CircularProgressViewStyle(tint: .appGreen))
                Spacer()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

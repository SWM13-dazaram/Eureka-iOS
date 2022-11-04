
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
            Color.bg
                .ignoresSafeArea()
            VStack{
                Spacer()
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

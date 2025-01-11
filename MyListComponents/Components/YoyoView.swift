import SwiftUI

struct YoyoView: View {
    @State var task = "開発する"
    @State var completed = false
    
    var body: some View {
        HStack {
            Button {
                completed.toggle()
            } label: {
                HStack {
                    Image(systemName: completed ? "checkmark.circle.fill": "circle")
                    Spacer()
                    Text(task)
                }
                
            }
            .foregroundColor(.primary)
            }
            
        }
    }

#Preview {
    YoyoView()
}

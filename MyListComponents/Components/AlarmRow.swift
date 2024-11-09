import SwiftUI

struct AlarmRow: View {
    var time: String
    var label: String
    @Binding var isAlarmOn: Bool  // @Bindingを追加して親ビューとの状態を同期
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(label)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(time)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Toggle(isOn: $isAlarmOn) {
                Text(isAlarmOn ? "ON" : "OFF")
                    .foregroundColor(isAlarmOn ? .green : .red)
            }
            .labelsHidden()
            .toggleStyle(SwitchToggleStyle(tint: .green))
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
        .shadow(radius: 5)
        .listRowInsets(.init())
    }
}

#Preview {
    List {
        Section {
            AlarmRow(time: "8:00 AM", label: "起床", isAlarmOn: .constant(true))
            AlarmRow(time: "12:00 PM", label: "ランチ", isAlarmOn: .constant(false))
            AlarmRow(time: "7:30 PM", label: "ジム", isAlarmOn: .constant(true))
        }
    }
}


//
//  PickerField.swift
//  Solo
//

import SwiftUI

struct PickerField: View {
    var icon: String? = nil
    let placeholder: String
    let options: [String]
    @Binding var selection: String
    
    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button (option) {
                    selection = option
                }
            }
        } label: {
            HStack {
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(.gray)
                        .frame(width: 22)
                }
                Text(selection.isEmpty ? placeholder : selection)
                    .foregroundColor(selection.isEmpty ? .gray.opacity(0.7) : .black)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundColor(.gray)
                    .font(.system(size: 14))
            }
            .frame(height: 48)
            .padding(.horizontal, 16)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.gray.opacity(0.2))
            )
            .padding(.horizontal, 16)
        }
    }
}

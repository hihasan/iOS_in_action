//
//  PickerView.swift
//  ios_in_action
//
//  Created by Appnap ws27 on 17/5/23.
//

import SwiftUI

struct PickerView: View {
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                        .foregroundColor(.blue)
                    Circle()
                        .foregroundColor(.orange)
                
            }
            
            HStack {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .foregroundColor(.green)
            }
            .controlSize(.small)
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}

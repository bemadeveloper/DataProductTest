//
//  EditButton.swift
//  DataProductTest
//
//  Created by Bema on 5/5/24.
//

import SwiftUI

struct EditButton: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "pencil")
                .padding(.top, 5)
        }
        
    }
}

#Preview {
    EditButton()
}

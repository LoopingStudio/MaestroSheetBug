//
//  SheetView.swift
//  MaestroTest
//
//  Created by Kelian Daste on 19/08/2024.
//

import SwiftUI

struct SheetView: View {
  
  @Environment(\.dismiss) var dismiss
  @State var cardNumber: String = ""
  @State var expiryDate: String = ""
  @State var cvc: String = ""

  @Binding var sheetHeight: CGFloat
  var body: some View {
    VStack {
      HStack {
        Text("Hello, World!")
        Spacer()
        Button {
          dismiss()
        } label: {
          Image(systemName: "xmark")
        }
      }

      Text("Card Informations")

      VStack {
        TextField("Card Number", text: $cardNumber)
        HStack {
          TextField("Expiry Date", text: $expiryDate)
          TextField("CVC", text: $cvc)
        }
      }
      .textFieldStyle(.roundedBorder)

      Spacer()

      Button("Pay") {
        dismiss()
      }
      .buttonStyle(.borderedProminent)
    }
    .padding()
    .presentationDetents([.fraction(sheetHeight)])
  }
}

#Preview {
  EmptyView()
    .sheet(isPresented: .constant(true)) {
      SheetView(sheetHeight: .constant(0.5))
    }
}

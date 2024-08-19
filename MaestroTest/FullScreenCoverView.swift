//
//  FullScreenCoverView.swift
//  MaestroTest
//
//  Created by Kelian Daste on 19/08/2024.
//

import SwiftUI

struct FullScreenCoverView: View {
  
  @Environment(\.dismiss) var dismiss
  @State var isOpen: Bool = false
  @State var sheetHeight: CGFloat = 0.5

  var body: some View {
    VStack {
      Text("Hello, FullScreenCover!")
        .font(.title)
        .frame(maxWidth: .infinity)
        .overlay(alignment: .trailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark")
          }
        }
      
      Spacer()

      Text("\(Int(sheetHeight*100)) %")

      HStack {
        Text("0 %")
        Slider(value: $sheetHeight, in: 0...1)
        Text("100 %")
      }

      Spacer()

      Button("Open Sheet") {
        isOpen = true
      }
      .buttonStyle(.borderedProminent)
    }
    .padding()
    .tint(.purple)
    .sheet(isPresented: $isOpen) {
      SheetView(sheetHeight: $sheetHeight)
    }
  }
}

#Preview {
    FullScreenCoverView()
}

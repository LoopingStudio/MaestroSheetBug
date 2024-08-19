import SwiftUI

struct ContentView: View {
  
  @State var isOpen: Bool = false
  @State var isFullScreenOpen: Bool = false
  @State var sheetHeight: CGFloat = 0.5

  var body: some View {
    VStack {
      Text("Hello, world!")
        .font(.title)

      Spacer()

      Text("\(Int(sheetHeight*100)) %")

      HStack {
        Text("0 %")
        Slider(value: $sheetHeight, in: 0...1)
        Text("100 %")
      }

      Spacer()

      HStack {
        Button("Open FullScreen") {
          isFullScreenOpen = true
        }
        Button("Open Sheet") {
          isOpen = true
        }
      }
      .buttonStyle(.borderedProminent)
    }
    .padding()
    .fullScreenCover(isPresented: $isFullScreenOpen) {
      FullScreenCoverView()
    }
    .sheet(isPresented: $isOpen) {
      SheetView(sheetHeight: $sheetHeight)
    }
  }

  private func openSheet(to height: CGFloat) {
    sheetHeight = height/100
    isOpen = true
  }
}

#Preview {
  ContentView()
}

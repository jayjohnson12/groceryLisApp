import SwiftUI

struct ContentView: View {
    @State private var groceries = ["Milk", "Eggs", "Bread"]
    @State private var newItem = ""

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(groceries, id: \.self) { item in
                        Text(item)
                    }
                    .onDelete(perform: deleteItems)
                }

                HStack {
                    TextField("Add new item", text: $newItem)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button("Add") {
                        addItem()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
            .navigationTitle("🛒 Grocery List")
        }
    }

    func addItem() {
        if !newItem.isEmpty {
            groceries.append(newItem)
            newItem = ""
        }
    }

    func deleteItems(at offsets: IndexSet) {
        groceries.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}


import SwiftUI

struct ContentView: View {
    @State private var viewModel = FavoritesViewModel()
    
    let comics = [
        Comic(
            name: "Spider-Man",
            cover: .SpiderMan.cover,
            previewChapters: [
                "Amazing Spider-Man #001",
                "test"
            ]
        ),
        Comic(
            name: "Wolverine",
            cover: .Wolverine.origin0100,
            previewChapters: [
                "Wolverine Origin #1"
            ]
        )
    ]
    
    
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                ScrollView{
                    
                    Text("Доступные комиксы")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                    NavigationLink(destination: FavoritesView(comics: comics, viewModel: viewModel)){
                        Text("Посмотреть избранные")
                            .font(.headline)
                            .fontWeight(.black)
                    }
                    
                    ForEach(comics, id: \.name){ comic in
                        ComicCard(comic: comic, isFavoritesView: false, viewModel: viewModel)
                        
                    }
                    
                }
                
                
            }
            
            
            
            
        }//navig
        
    }
    
}

#Preview {
    
    ContentView()
}

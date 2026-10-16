import SwiftUI

struct FavoritesView: View{
    var comics: [Comic]
    
    var viewModel: FavoritesViewModel

    
    
    var body: some View{
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                
                ScrollView{
                    
                    let favorite_comics = comics.filter{
                        viewModel.favorites.contains($0.name)
                    }
                    
                    
                    Text("Список избранных комиксов")
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                    ForEach(favorite_comics, id: \.name){comic in
                        ComicCard(comic: comic, isFavoritesView: true, viewModel: viewModel)
                        
                        
                        
                    }
                    
                }
                
            }
        }
    }
}


#Preview {
    FavoritesView(comics: [Comic(
        name: "Spider-Man",
        cover: .SpiderMan.cover,
        previewChapters: [
            "Amazing Spider-Man #001",
            "test"
        ]
    )],
    viewModel: FavoritesViewModel()
    )
}

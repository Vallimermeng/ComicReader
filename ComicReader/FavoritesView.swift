import SwiftUI

struct FavoritesView: View{
    var comics: [Comic]
    
    
    
    var body: some View{
        NavigationStack{
            ScrollView{
                let favorites = UserDefaults.standard.stringArray(forKey: "favorite") ?? []
                let favorite_comics = comics.filter{
                    favorites.contains($0.name)
                }
                Text("Нажми на облоку, чтобы перейти")
                    .font(.headline)
                ForEach(favorite_comics, id: \.name){comic in
                    VStack{
                        NavigationLink(destination: ChapterView(comic: comic)){
                            Image(comic.cover)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 300)
                        }
                        HStack{
                            Text(comic.name)
                                .font(.headline)
                        }
                    }
                        
                }
                
            }
        }
    }
}


#Preview {
    ContentView()
}

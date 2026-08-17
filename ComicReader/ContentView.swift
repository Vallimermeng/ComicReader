
import SwiftUI

struct ContentView: View {
    
    let comics = [
        Comic(
            name: "Spider-Man",
            cover: .SpiderMan.cover,
            chapter: ["Amazing Spider-Man #001", "test"]
        ),
        
        Comic(
            name: "Wolverine",
            cover: .Wolverine.origin0100,
            chapter: ["Wolverine Origin #1"]
        )
    ]
    
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                Text("Доступные комиксы")
                NavigationLink(destination: FavoritesView(comics: comics)){
                    Text("Посмотреть избранные")
                        .font(.headline)
                }
                
                ForEach(comics, id: \.name){ comic in
                    HStack{
                        VStack{
                            Image(comic.cover)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 300)
                            HStack{
                                Text(comic.name)
                                Button("Добавить в избранное"){
                                    var favorites = UserDefaults.standard.stringArray(forKey: "favorite") ?? []
                                    
                                    if !favorites.contains(comic.name){
                                        favorites.append(comic.name)
                                        
                                        UserDefaults.standard.set(favorites, forKey: "favorite")
                                    }
                                }
                            }
                            NavigationLink(destination: ChapterView(comic: comic)){
                                Text("Читать")
                                    .font(.headline)
                            }
                            
                        }//vstack
                    }
                    
                }//foreacb

            }//scrollview
           
            
        }//navig
        .background(.black)
        
    }
}

#Preview {
    ContentView()
}

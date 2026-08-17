
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
                
                ForEach(comics, id: \.name){ comic in
                    HStack{
                        VStack{
                            Image(comic.cover)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 300)
                            Text(comic.name)
                            NavigationLink(destination: ChapterView(comic: comic)){
                                Text("Читать")
                                    .font(.headline)
                            }
                            
                        }//vstack
                    }
                    
                }

            }//scrollview
           
            
        }//navig
        .background(.black)
        
    }
}

#Preview {
    ContentView()
}

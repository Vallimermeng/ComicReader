import SwiftUI

struct ChapterView: View{
    var comic: Comic
    
    
    var body: some View{
        NavigationStack{
            ScrollView{
                
                Text("Доступные главы")
                    .padding()
                    .font(.title2)
                
                ForEach(comic.chapters(), id: \.self ){chapterTitle in // showing all chapters
                    VStack{
                        NavigationLink(destination: ComicReaderView(
                            comic: comic,
                            chapter: chapterTitle)){
                                HStack{
                                    
                                    Text(chapterTitle)
                                    Spacer()
                                    
                                   
                                    if(UserDefaults.standard.object(forKey: "\(comic.name) \(chapterTitle)") != nil){
                                        
                                        Text("Стр. \(UserDefaults.standard.integer(forKey: "\(comic.name) \(chapterTitle)")+1)")
                                        
                                    }
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(.ultraThinMaterial)
                                .cornerRadius(50)
                                
                                
                                
                        }
                            .padding(5)
                        
                    }
                    
                }
                
                
            }
            
        }
        
    }
}




#Preview {
    ChapterView(
        comic: Comic(
            name: "Spider-Man",
            cover: .SpiderMan.cover,
            previewChapters: [
                "Amazing Spider-Man #001",
                "test"
            ]
        )
    )
}

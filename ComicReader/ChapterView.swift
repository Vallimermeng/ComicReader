import SwiftUI

struct ChapterView: View{
    var comic: Comic
    
    
    var body: some View{
        NavigationStack{
            ScrollView{
                
                Text("Доступные главы")
                    .padding()
                    .font(.title2)
                
                ForEach(comic.chapter, id: \.self ){chapterTitle in // showing all chapters
                    VStack{
                        NavigationLink(destination: ComicReaderView(
                            comic: comic,
                            chapter: chapterTitle)){
                                HStack{
                                    Text(chapterTitle)
                                        .padding()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                    if(UserDefaults.standard.object(forKey: "\(comic.name) \(chapterTitle)") != nil){
                                        Text("Стр. \(UserDefaults.standard.integer(forKey: "\(comic.name) \(chapterTitle)")+1)")
                                    }
                                }
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(50)
                                
                        }
                        
                    }
                    
                }
                
                
            }
            
        }
        
    }
}




#Preview {
    ChapterView(comic:  Comic(
        name: "Spider-Man",
        cover: .SpiderMan.cover,
        chapter: ["Amazing Spider-Man #001", "test"]
    ))
}

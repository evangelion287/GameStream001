//
//  Home.swift
//  GameStream
//
//  Created by ALBERTO on 11/04/23.
//

import SwiftUI
import AVKit


struct Home: View{
    
    @State var tabSeleccionado:Int = 2

    
    
    var body: some View{
        
        TabView(selection: $tabSeleccionado){
            
            Text("Pantalla Perfil").font(.system(size:30,
                                       weight: .bold,
                                       design: .rounded))
                .tabItem{
                        Image(systemName: "person")
                        Text("Perfil")
                
                }
                .tag(0)
            
            Text("Pantalla Games").font(.system(size:30,
                                       weight: .bold,
                                       design: .rounded))
                .tabItem{
                        Image(systemName: "gamecontroller")
                        Text("Games")
                
                }
                .tag(1)
            
            PantallaHome()
                .tabItem{
                        Image(systemName: "house")
                        Text("Inicio")
                
                }
                .tag(2)
            
            Text("Pantalla Favoritos").font(.system(size:30,
                                       weight: .bold,
                                       design: .rounded))
                .tabItem{
                        Image(systemName: "heart")
                        Text("Favoritos")
                
                }
                .tag(3)
            
        }
        .accentColor(.white)
        
        
    }

    
    init(){
        
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBarColor"))
        
        UITabBar.appearance().unselectedItemTintColor =
        UIColor.gray
        
        UITabBar.appearance().isTranslucent = true
        
        print("iniciando las vistas de home")
        
    }
}

struct PantallaHome: View{
    
    
    @State var TextoBusqueda = ""
    
    
    var body: some View{
        
        ZStack{
         
            Color("Marine").ignoresSafeArea()
            
            VStack{
                   
                Image("appLogo").resizable()
                    .aspectRatio(contentMode: .fit).frame(
                    width: 250)
                    .padding(.bottom, 42)
                
                HStack{
                    
                    Button(action: busqueda, label: {
                        
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(TextoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian")
                            )
                        
                        
                        
                        
                    })
                    
                    ZStack(alignment: .leading){
                        
                        if TextoBusqueda.isEmpty{
                            
                            Text("Buscar un video")
                                .foregroundColor(
                                    Color(red:174/255
                                                 , green: 177/255, blue: 185/255, opacity:1.0))
                            
                        }
                        
                        TextField("", text: $TextoBusqueda)
                            .foregroundColor(.blue)
                    }
                    
                }
                .padding([.top, .leading,.bottom], 11.0)
                .background(Color("Blue-Gray"))
                .clipShape(Capsule())
                
                SubModuloHome()
                    
            }.padding(.horizontal, 18)
         
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
    }

    func busqueda(){
        print("El usuario esta buscando \(TextoBusqueda)")
    }
}

struct SubModuloHome:View{
    
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    
    @State var isPlayerActive = false
    
    let urlVideos:[String] =
     ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body : some View {
       
        NavigationLink(
            destination: VideoPlayer(player:AVPlayer(url: URL(string: url)!))
                .frame(width: 400, height: 300),
            isActive: $isPlayerActive,
            label: {
                EmptyView()
            }
        )
        
        VStack{
                Text("LOS MÁS POPULARES")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                    .frame(minWidth: 0,  maxWidth: .infinity,  alignment: .leading)
                    .padding(.top)
            
                
                ZStack{
                    Button(action: {
                        
                        url = urlVideos[0]
                        print("URL: \(url)")
                        
                        isPlayerActive = true
                        
                    }, label: {
                        
                        VStack(spacing:0){
                            
                            Image("thewitcher")
                                .resizable()
                                .scaledToFit()
                            
                            
                            Text("The Witcher")
                                .frame(minWidth:0, maxWidth: .infinity,
                                       alignment: .leading)
                                .background(Color("Blue-Gray"))
                            
                            
                            
                            
                        }
                        
                    })
                    
                    
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width:42, height: 42)
                    
                    
                }
                .frame(minWidth: 0,  maxWidth: .infinity,  alignment: .center)
                .padding(.vertical)
            
            
                Text("CATEGORÍAS SUGERIDAS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0,  maxWidth: .infinity,  alignment: .leading)
                .padding(.top)
            
            
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack{
                        Button(action: {}, label: {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("Vector-shot")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                            }
                        })
                        
                        Button(action: {}, label: {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("rpg-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                            }
                        })
                        
                        Button(action: {}, label: {
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("Blue-Gray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("open-world-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                            }
                        })
                    }
                    
                    
                }
            
                Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0,  maxWidth: .infinity,  alignment: .leading)
                .padding(.top)
            
                ScrollView(.horizontal, showsIndicators: false){
                 
                    HStack{
                        Button(action: {}, label: {
                            
                            Text("Button")
                        })
                        
                    }
                    
                }
            
            }
        }
    
}


struct Home_Previews: PreviewProvider{
    static var previews: some View{
        Home()
    }
}

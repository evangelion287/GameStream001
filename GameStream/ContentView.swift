//
//  ContentView.swift
//  GameStream
//
//  Created by ALBERTO on 21/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            ZStack{
            
            Spacer()
            
            //Color(.blue).ignoresSafeArea()
            
            Color(red: 19/255, green: 30/255, blue: 53/255
                  , opacity: 1.0).ignoresSafeArea()
            
            
            VStack{
                Image("AppLogo-1").resizable().aspectRatio( contentMode: .fit)
                    .frame(width:250)
                    .padding(.bottom, 60)
                
                InicioYRegistroView()
            }
            
            
            }.navigationBarHidden(true)
        }
    }
}

struct InicioYRegistroView: View{
    @State var tipoInicioSesion = true
    
    var body : some View{
        
        VStack{
            HStack{
                
                Spacer()
                
                Button("Iniciar Session"){
                    tipoInicioSesion = true
                    print("pantalla inicio de session")
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                Button("Regístrate"){
                    tipoInicioSesion = false
                    print("pantalla inicio de session")
                }
                .foregroundColor(tipoInicioSesion ? .gray : . white)
                
                Spacer()
                
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true
            {
                InicioSesionView()
                
            }else{
                
                RegistroView()
            }
        }
    }
}

struct InicioSesionView: View{
    
    @State var correo =  ""
    @State var contrasenia = ""
    @State var isPantallaHomeActive = false;
    
    var body: some View{
        
        ScrollView{
            VStack(alignment: .leading){
        
                
                Text("Correo Electrónico")
                    .foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty{
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo)
                        .foregroundColor(.white)
                }
                
                
                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                
                Text("Contraseña")
                    .foregroundColor(.white)
                
                ZStack(alignment: .leading){
                    
                    if contrasenia.isEmpty{
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                
                    SecureField("", text: $contrasenia)
                        .foregroundColor(.white)
                }
                
                
                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300, alignment:.trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Button(action: iniciarSesion, label:{
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(EdgeInsets(
                            top: 11, leading: 18, bottom: 11, trailing: 18
                        ))
                        .overlay(RoundedRectangle(
                            cornerRadius: 6.0)
                                    .stroke(Color("Dark-Cian"), lineWidth: 1.0)
                                    .shadow(color: .white, radius: 6))
                })
                    
                
              
                VStack(){
                
                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.white)
                
                HStack{
                
                    Button(action: iniciarFacebook, label:{
                        Text("Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                            .frame(width:130, alignment: .center)
                            .padding(EdgeInsets(
                                top: 11, leading: 18, bottom: 11, trailing: 18
                            ))
                            .overlay(RoundedRectangle(
                                cornerRadius: 6.0)
                                        .stroke(Color(.white).opacity(0.1), lineWidth: 1.0)
                                     )
                            .background(Color(.white).opacity(0.1))
                        
                    })
                    
                    Button(action: iniciarTwitter, label:{
                        Text("Twitter")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                            .frame(width:130, alignment: .center)
                            .padding(EdgeInsets(
                                top: 11, leading: 18, bottom: 11, trailing: 18
                            ))
                            .overlay(RoundedRectangle(
                                cornerRadius: 6.0)
                                        .stroke(Color(.white).opacity(0.1), lineWidth: 1.0)
                                     )
                            .background(Color(.white).opacity(0.1))
                        
                    })
                     
                    
                    
                }.padding(.top)
                }.padding(.top, 100.0)
                
                
            }
            .padding(.horizontal, 77.0)
         
            NavigationLink(
            destination: Home(),
            isActive: $isPantallaHomeActive,
            label: {
                EmptyView()
            })
        }
    }

    func iniciarSesion(){
        print("Estoy iniciando sesion")
        isPantallaHomeActive = true
    }
}



func iniciarFacebook(){
    print("Estoy iniciando con Facebook")
}

func iniciarTwitter(){
    print("Estoy iniciando con Twitter")
}

struct RegistroView: View{

    @State var correo =  ""
    @State var contrasenia = ""
    @State var confirmContrasenia = ""
    @State var isPantallaHomeActive = false
  
    var body: some View{
        
        ScrollView{
            
            VStack(alignment:.center)
            {
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegir mas adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(
                    action:tomarFoto
                ,label: {
                    ZStack{
                        Image("image_perfil_02")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                        
                    }
                })
            }
            
            VStack(alignment: .leading){
        
                Text("Correo Electrónico*")
                    .foregroundColor(Color("Dark-Cian"))
                    .frame(width: 300,  alignment: .leading)
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty{
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo)
                        .foregroundColor(.white)
                }
                
                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Contraseña*")
                    .foregroundColor(.white)
                
                ZStack(alignment: .leading){
                    
                    if contrasenia.isEmpty{
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                
                    SecureField("", text: $contrasenia)
                        .foregroundColor(.white)
                }
                
                
                Divider().frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Confirmar contraseña*")
                    .foregroundColor(.white)
                
                ZStack(alignment: .leading){
                    
                    if contrasenia.isEmpty{
                        Text("Confirma tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $confirmContrasenia)
                        .foregroundColor(.white)
                    
                 
                    
                }
                
              
                
                
               
                Button(action: iniciarSesion, label:{
                    Text("REGÍSTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity,alignment: .center)
                        .padding(EdgeInsets(
                            top: 11, leading: 18, bottom: 11, trailing: 18
                        ))
                        .overlay(RoundedRectangle(
                            cornerRadius: 6.0)
                                    .stroke(Color("Dark-Cian"), lineWidth: 1.0)
                                    .shadow(color: .white, radius: 6))
                })
                    
                VStack(){
                
                Text("Registrate con redes sociales")
                    .foregroundColor(.white)
                
                HStack{
                
                    Button(action: iniciarFacebook, label:{
                        Text("Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                            .frame(width:130, alignment: .center)
                            .padding(EdgeInsets(
                                top: 11, leading: 18, bottom: 11, trailing: 18
                            ))
                            .overlay(RoundedRectangle(
                                cornerRadius: 4.0)
                                        .stroke(Color(.white).opacity(0.1), lineWidth: 1.0)
                                     )
                            .background(Color("Blue-Gray"))
                        
                    })
                    
                    Button(action: iniciarTwitter, label:{
                        Text("Twitter")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                            .frame(width:130, alignment: .center)
                            .padding(EdgeInsets(
                                top: 11, leading: 18, bottom: 11, trailing: 18
                            ))
                            .overlay(RoundedRectangle(
                                cornerRadius: 4.0)
                                        .stroke(Color(.white).opacity(0.1), lineWidth: 1.0)
                                     )
                            .background(Color("Blue-Gray"))
                        
                    })
                     
                    
                    
                }.padding(.top)
                }.padding(.top, 100.0)
                
                
            }
            .padding(.horizontal, 77.0)

        }
   
        
        
        
        
        
    }
 
    func iniciarSesion(){
        print("Estoy iniciando sesion")
        isPantallaHomeActive = true
    }
}

func tomarFoto(){
        print("Tomo foto")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

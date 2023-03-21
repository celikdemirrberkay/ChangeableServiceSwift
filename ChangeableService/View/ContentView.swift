//
//  ContentView.swift
//  ChangeableService
//
//  Created by Berkay  on 21.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userVM : UserListViewModel
    init() {
        self.userVM = UserListViewModel(userWebServices: LocalServices())
    }
    
    var body: some View {
        List(userVM.userList , id:\.id){ user in
            VStack{
                Text(user.name)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity,
                           alignment: .leading
                    )
                Text(user.username)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity,
                           alignment: .leading
                    )
                Text(user.email)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity,
                           alignment: .leading
                    )
                    .foregroundColor(.blue)
            }
        }.task {
            await userVM.getDatas()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

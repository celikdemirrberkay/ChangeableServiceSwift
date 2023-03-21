//
//  UserViewModel.swift
//  ChangeableService
//
//  Created by Berkay  on 21.03.2023.
//

import Foundation

struct UserViewModel {
    
    var user : User
    
    var name : String{
        user.name
    }
    var username : String{
        user.username
    }
    var email : String{
        user.email
    }
    var id : Int{
        user.id
    }
    
}

class UserListViewModel : ObservableObject{
    
    @Published var userList = [UserViewModel]()
    let service : IUserServicesProtocol
    
    init(userWebServices: IUserServicesProtocol) {
        self.service = userWebServices
    }
    
    func getDatas() async{
        var resource = ""
        if service.networkType == "Localservice"{
            resource = Constants.localResource()
        }else{
            resource = Constants.webResource()
        }
        
        do{
            let users = try await service.getDataFromAPI(resource)
            DispatchQueue.main.async {
                self.userList = users.map(UserViewModel.init)
            }
        }catch {
            print(error.localizedDescription)
        }
    }
}

enum NetworkEndpoint : String {
    case BASE_URL = "https://jsonplaceholder.typicode.com"
    case PATH = "/users"
    
    static func userPath () -> String {
        return "\(BASE_URL)\(PATH)"
    }
    
}
 //"https://jsonplaceholder.typicode.com/users"

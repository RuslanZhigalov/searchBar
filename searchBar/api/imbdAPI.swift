//
//  imbdAPI.swift
//  searchBar
//
//  Created by Руслан Жигалов on 13.12.2022.
//

import Foundation
class SearchQuery{
    let apiaKey = "k_cffy7lbx"
    func taskImdb(searchString: String, complition: @escaping([CharactersIMDB]) -> Void){
        let url = URL(string: "https://imdb-api.com/en/API/Search/\(apiaKey)/\(searchString)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["accept": "application/json"]
        let task = URLSession.shared.dataTask(
            with: request,
            completionHandler: { data, response, error in
                if let error = error {
                    print(error)
                }
                guard let data = data else{
                    return
                }
                do{
                    let charactersApi = try JSONDecoder().decode(ApiCharacterDataIMDB.self, from: data)
                    print(charactersApi.results)
                    complition(charactersApi.results)
                }catch{
                    print(error)
                }
            })
        task.resume()
        
    }
}

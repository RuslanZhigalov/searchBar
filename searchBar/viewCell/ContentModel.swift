//
//  ContentModel.swift
//  searchBar
//
//  Created by Руслан Жигалов on 13.12.2022.
//

import UIKit
struct ApiCharacterDataIMDB: Decodable{
    let results: [CharactersIMDB]
}
struct CharactersIMDB: Decodable{
    let image: String
    let title: String
    let description: String
}



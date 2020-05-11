//
//  Pessoa.swift
//  teste
//
//  Created by Kellyane Nogueira on 16/03/20.
//  Copyright © 2020 Kellyane Nogueira. All rights reserved.
//

import Foundation

class Pessoa: Codable {
    let nome: String
    let idade: Int
    
    init(nome: String, idade: Int) {
        self.nome = nome
        self.idade = idade
    }
}

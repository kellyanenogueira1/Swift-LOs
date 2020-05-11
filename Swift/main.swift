import Foundation

let fm = FileManager.default
let home = fm.homeDirectoryForCurrentUser
let fileUrl = home.appendingPathComponent("app/dados.json")

func read() -> [Pessoa] {
    let dados  = try! Data(contentsOf: fileUrl)
    let pessoas = try! JSONDecoder().decode([Pessoa].self, from: dados)
    
    return pessoas
}

func write(pessoa: Pessoa) {
    var pessoas = read()
    pessoas.append(pessoa)
    let dados = try! JSONEncoder().encode(pessoas)
    try! dados.write(to: fileUrl)
}

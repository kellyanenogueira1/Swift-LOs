import UIKit

class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")

print(manager.importer.filename)

//----------------------------------------------------------
struct Funcionario{
    var anoDeNasc: Int
    let nome: String
    var id: Int
    
    init(anoDeNasc: Int, nome: String){
        self.anoDeNasc = anoDeNasc
        self.nome = nome
        self.id = (
            self.anoDeNasc + 1
        )
    }
    
    mutating func mudaAno(_ ano: Int){
        self.anoDeNasc = ano
    }
}

var gerente = Funcionario(anoDeNasc: 1998, nome: "Kellyane")
gerente.mudaAno(1901)
print(gerente.id, gerente.anoDeNasc)

//-----------------------------------------------------------
class Empresa{
    var cnpj: Int
    var nome: String
    var qtdTrabalhadores: Int = 0 {
        willSet(newQtd){
            print("A nova quantidade de trabalhadores é: \(newQtd)")
        }
        didSet{
            if qtdTrabalhadores > oldValue{
                print("A empresa contratou \(qtdTrabalhadores - oldValue) funcionários.")
            }
        }
    }
    
    init(cnpj: Int, nome: String, qtdTrabalhadores: Int) {
        self.cnpj = cnpj
        self.nome = nome
        self.qtdTrabalhadores = qtdTrabalhadores
    }
    
}
var emp = Empresa(cnpj: 321, nome: "webArt", qtdTrabalhadores: 30)

//---------------------------------------------------------------
class Servidor{
    var nome: String
    var funcao: String
    var id: Int = 0
    
    init(nome: String, funcao: String){
        self.funcao = funcao
        self.nome = nome
        self.id += 1
    }
    
    final func mostrarDados(){
        print(self.funcao, self.nome, self.id )
    }

    func ponto(){
        print("Servidor chegou ao instituto.")
    }
}
var serv = Servidor(nome: "Rony", funcao: "Zelador")
 
class Professor: Servidor{
    var qtdDisciplinas: Int
    
    init(nome: String, funcao: String, qtdDisciplinas: Int) {
        self.qtdDisciplinas = qtdDisciplinas
        super.init(nome: nome, funcao: funcao)
    }
    
    override func ponto() {
        print("Professor chegou ao instituto")
    }
}
var prof = Professor(nome: "Marcos", funcao: "Professor de Exatas", qtdDisciplinas: 3)

//---------------------------------------------
class Produto{
    static var preco: Float = 10.0
    var id: Int = 0
    var tipo: String
    static var qtd: Int = 0
    
    required init?(id:Int, tipo: String){
        if tipo.isEmpty{return nil}
        self.tipo = tipo
        self.id = id
    }

    static func aplicaDesconto(_ qtd: Int){
        if qtd > 3 {
            self.qtd = qtd
            self.preco -= 0.1
        }
    }
}
var hidratante = Produto(id: 1234, tipo: "")

/*class MaterialConstrucao:Produto{
    var distribuidora: String
    init(id:Int, tipo: String, dist: String){
        if tipo.isEmpty{return nil}
        super.init(id: id, tipo: tipo)
        self.distribuidora = dist
    }
    
    required init(id: Int, tipo: String) {
        if tipo.isEmpty{return nil}
        super.init(id: id, tipo: tipo)
        self.distribuidora = "Sem dist"
    }
}*/

//------------------------------------------------
var i = 100
class Calculate {
    init() {
        i = i + 50
    }
    
    deinit {
        i = 0
    }
}
var cins: Calculate? = Calculate()
print("Counter Val: \(i)")
cins = nil
print("Counter Val: \(i)")

//-------------------------------------------------
class User{
    var login: String
    var passwd: Int
    
    init(login: String, passwd: Int) {
        self.login = login
        self.passwd = passwd
    }
}
class Teacher:User{
    var id: Int
    
    init(login: String, passwd: Int, id: Int) {
        self.id = id
        super.init(login: login, passwd: passwd)
    }
}
class Student:User{
    var registration: Int
    
    init(login: String, passwd: Int, registration: Int) {
        self.registration = registration
        super.init(login: login, passwd: passwd)
    }
}

let University = [
    Student(login: "Maria", passwd: 123, registration: 123),
    Teacher(login: "Fernando", passwd: 132, id: 1),
    Student(login: "Fábio", passwd: 345, registration: 324)
]

for i in University {
    if i is Student {
        print("\(i) is an student." )
    } else if i is Teacher {
        print("\(i) is a teacher." )
    }
}

for i in University {
    if let teacher = i as? Teacher{
        print("Teacher: \(teacher.login)")
    } else if let student = i as? Student {
        print("Student: \(student.login)")
    }
}

//-------------------------------------------------

enum ReadingFileError:Error{
    case fileInexisting
    case pathUnidentified
    case withoutPermission
    case formatUncodable
}

struct File{
    let path: String?
    let data: Data?
    let filename: String?
    let extensao: String?
}

class ReadingFile{

    func readFile(myfile: File) throws {
        if myfile.extensao == "txt"{ print ("formato ok")} else {
            throw ReadingFileError.formatUncodable
        }
        guard let url = myfile.path else{
            throw ReadingFileError.fileInexisting
        }
        guard let file = URL(fileURLWithPath: url) else {
            throw ReadingFileError.pathUnidentified
        }
        guard let read = file.readLine() else{
            throw ReadingFileError.withoutPermission
        }
    }
}

//-----------------------------------------------------
protocol Referencia{
    static var autor: String {get}
    static var anoPublicacao: Int {get}
    
}

protocol Citacao{
    func citarTexto(_ ref: Referencia)
}

struct ReadingBook:Referencia, Citacao {
    static var autor: String {return self.autor}
    static var anoPublicacao: Int {return self.anoPublicacao}
    var texto: String
    var qtdPag: Int
    
    func citarTexto(_ ref: Referencia) {
        print(texto)
        print(self.autor)
    }
}

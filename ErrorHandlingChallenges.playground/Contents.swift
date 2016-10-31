//: Playground - noun: a place where people can play

import Cocoa

enum Token {
    case Number(Int)
    case Plus
    case Minus
}

class Lexer {
    enum LexerError: Error {
        case InvalidCharacter(Character)
    }
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past the end!")
        position = input.index(after: position)
    }
    
    func lex() throws -> ([Token], [Int]) {
        var tokens = [Token]()
        var indices = [Int]()
        var index = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                //Start of a number - need to grab the rest
                let value = getNumber()
                tokens.append(.Number(value))
                indices.append(index)
            case "+":
                tokens.append(.Plus)
                indices.append(index)
                advance()
            case "-":
                tokens.append(.Minus)
                indices.append(index)
                advance()
            case " ":
                //Just advance to ignore spaces
                advance()
            default:
                //Something unexpected - need to send back an error
                throw LexerError.InvalidCharacter(nextCharacter)
            }
            index = index + 1
        }
        return (tokens, indices)
    }
    
    func getNumber() -> Int {
        var value = 0
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                let digitalValue = Int(String(nextCharacter))!
                value = 10 * value + digitalValue
                advance()
            default:
                return value
            }
        }
        return value
    }
}

class Parser {
    enum ParserError: Error {
        case UnexpectedEndOfInput
        case InvalidToken(Token, Int)
    }
    let tokens: [Token]
    let indices: [Int]
    var position = 0
    
    init(tokens:[Token], indices:[Int]) {
        self.tokens = tokens
        self.indices = indices
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw ParserError.UnexpectedEndOfInput
        }
        
        switch token {
        case .Number(let value):
            return value
        case .Plus, .Minus:
            throw ParserError.InvalidToken(token, position)
        }
    }
    
    func parse() throws -> Int {
        //Require a number first
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
            //Gettting a Plus after a Number is legal
            case .Plus:
                //After a plus, we must get another number
                let nextNumber = try getNumber()
                value += nextNumber
            //Getting a Number after a nubmer is not legal
            case .Minus:
                let nextNumber = try getNumber()
                value -= nextNumber
            case .Number:
                throw ParserError.InvalidToken(token, indices[position])
            }
        }
        return value
    }
}

func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    
//    guard let tokens = try? lexer.lex() else {
//        print("Lexing failed, but I don't know why")
//        return
//    }
    
    do {
        let (tokens, indices) = try lexer.lex()
        print("Lexer output: \(tokens)\n \(indices)")
        
        let parser = Parser(tokens: tokens, indices: indices)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.LexerError.InvalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch Parser.ParserError.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.ParserError.InvalidToken(let token, let position){
        print("Invalid token during parsing at index \(position): \(token)")
    } catch {
        print("An error occurred: \(error)")
    }
}

//evaluate(input: "10 + 3 + 5")
//evaluate(input: "1 + 2 + asdasd")
//evaluate(input: "10 + 5 - 3 - 1")
evaluate(input: "10 + 3 3 + 5")


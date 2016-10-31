//: Playground - noun: a place where people can play

import Cocoa

var errorCodeString: String?
errorCodeString = "404"
print(errorCodeString)
if errorCodeString != nil {
    let theError = errorCodeString!
    print(theError)
}

if let theError = errorCodeString {
    if let errorCodeInteger = Int(theError) {
        print("first: \(theError): \(errorCodeInteger)")
    }
}

var errorDescription: String?

if let theError = errorCodeString, let errorCodeInteger = Int(theError), errorCodeInteger == 404 {
    errorDescription = ("\(errorCodeInteger + 200): the request resource was not found.")
}
var upCaseErrorDescription = errorDescription?.uppercased()
print(errorDescription!)
print(upCaseErrorDescription!)




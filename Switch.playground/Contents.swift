
import Cocoa

var statusCode: Int = 418
var errorString: String = "The request failed with the error:"

switch statusCode {
case 100, 101:
    errorString += " Informational, 1xx"
case 204:
    errorString += " Successful but no content, 204"
case 300...307:
    errorString += " Redirection, 3xx"
case 400...417:
    errorString += " Client error, \(statusCode)"
case 500...505:
    errorString += " Server error, 5xx"
case let unknownCode where (unknownCode >= 200 && unknownCode < 300) || unknownCode > 505:
    errorString = " \(unknownCode) is not a known error code"
default:
    errorString = "Unexpected error encountered."
}

let error = (code: statusCode, status: errorString)
error.code
error.status

let firstErrorcode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorcode, secondErrorCode)

switch errorCodes {
case (404, 404):
    print("No item found.")
case (404, _):
    print("First item not found.")
case (_, 404):
    print("Second item not found.")
default:
    print("All items found.")
}

let age = 25
if case 18...35 = age where age >= 21 {
    print("In cool demographic and of drinking age")
}

let point = (x: 1, y: 4)

switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q2 where (point.x < 0) && point.y > 0:
    print("\(q2) is in quadrant 2")
case let q3 where (point.x < 0) && point.y < 0:
    print("\(q3) is in quadrant 3")
case let q4 where (point.x > 0) && point.y < 0:
    print("\(q4) is in quadrant 4")
case (_, 0):
    print("\(point) sits on the x-axis")
case (0, _):
    print("\(point) sits on the y-axis")
default:
    print("Case not covered")
}




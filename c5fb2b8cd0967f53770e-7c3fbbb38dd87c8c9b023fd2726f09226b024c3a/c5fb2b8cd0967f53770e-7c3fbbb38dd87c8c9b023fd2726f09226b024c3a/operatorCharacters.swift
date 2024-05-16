import Foundation

extension UnicodeScalar : ForwardIndexType {
    public func successor() -> UnicodeScalar {
        return UnicodeScalar(value + 1)
    }
}

var operatorHeads: [UnicodeScalar] = Array("=-+!*%<>&|^~?".unicodeScalars)
operatorHeads += Array("\u{00A1}" ... "\u{00A7}")
operatorHeads += ["\u{00A9}", "\u{00AB}", "\u{00AC}", "\u{00AE}"]
operatorHeads += ["\u{00B0}", "\u{00B1}", "\u{00B6}", "\u{00BB}"]
operatorHeads += ["\u{00BF}", "\u{00D7}", "\u{00F7}"]
operatorHeads += Array("\u{2016}" ... "\u{2017}")
operatorHeads += Array("\u{2020}" ... "\u{2027}")
operatorHeads += Array("\u{2030}" ... "\u{203E}")
operatorHeads += Array("\u{2041}" ... "\u{2053}")
operatorHeads += Array("\u{2055}" ... "\u{205E}")
operatorHeads += Array("\u{2190}" ... "\u{23FF}")
operatorHeads += Array("\u{2500}" ... "\u{2775}")
operatorHeads += Array("\u{2794}" ... "\u{2BFF}")
operatorHeads += Array("\u{2E00}" ... "\u{2E7F}")
operatorHeads += Array("\u{3001}" ... "\u{3003}")
operatorHeads += Array("\u{3008}" ... "\u{3030}")

var operatorChars: [UnicodeScalar] = [] // operatorHeads
operatorChars += Array("\u{0300}" ... "\u{036F}")
operatorChars += Array("\u{1DC0}" ... "\u{1DFF}")
operatorChars += Array("\u{20D0}" ... "\u{20FF}")
operatorChars += Array("\u{FE00}" ... "\u{FE0F}")
operatorChars += Array("\u{FE20}" ... "\u{FE2F}")
operatorChars += Array("\u{E0100}" ... "\u{E01EF}")

let format = "%04X"
let header = "\n| Character | Unicode Value | Unicode Name |\n|------|------|------|"

func unicodeName(scalar: UnicodeScalar) -> String {
    guard let string = String(scalar).stringByApplyingTransform(NSStringTransformToUnicodeName, reverse: false)
        else { return "" }
    
    return string
        .stringByReplacingOccurrencesOfString("\\N{", withString: "")
        .stringByReplacingOccurrencesOfString("}", withString: "")
}

print("# Allowed First Characters for Operators")
print(header)
operatorHeads.forEach {
    print("| \($0) | \(String(format: format, $0.value)) | \(unicodeName($0)) |")
}

print("# Additional Allowed Characters for Operators")
print(header)
operatorChars.forEach {
    print("| \($0) | \(String(format: format, $0.value)) | \(unicodeName($0)) |")
}

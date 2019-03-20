import Foundation

class Checklistitems: NSObject,Codable {
    var text = ""
    var checked = false
    func toggleChecked(){
        checked = !checked
    }
}

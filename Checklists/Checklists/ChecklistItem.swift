import Foundation

class Checklistitems: NSObject {
    var text = ""
    var checked = false
    func toggleChecked(){
        checked = !checked
    }
}

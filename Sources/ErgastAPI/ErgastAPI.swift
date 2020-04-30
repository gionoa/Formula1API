import Foundation
import CloudKit

struct ErgastAPI {
    let shared = ErgastAPI()
    
    let containerIdentifier = "iCloud.ErgastAPI"
    let secondContainer = CKContainer(identifier: containerIdentifier)
    
    init() {
        
    }
    
    public func doSomething() {
        print(".")
    }
}

import Foundation
import CloudKit

public struct ErgastAPI {
    static let shared = ErgastAPI()
    
    let containerIdentifier = "iCloud.ErgastAPI"
   // let secondContainer = CKContainer(identifier: containerIdentifier)
    
    init() {
        
    }
    
    public func doSomething() {
        print(".")
    }
    
    public static func doSomethingButStatic() {
        print(".")
    }
}

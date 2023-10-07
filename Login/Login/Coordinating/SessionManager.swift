import Foundation

final class SessionManager {
    static let shared = SessionManager()
    
    var hasSession: Bool {
        get {
            UserDefaults.standard.bool(forKey: "hasSession")
        } set {
            UserDefaults.standard.set(newValue, forKey: "hasSession")
        }
    }
    
    func startSession() {
        hasSession = true
    }
    
    func finishSession() {
        hasSession = false
    }
}

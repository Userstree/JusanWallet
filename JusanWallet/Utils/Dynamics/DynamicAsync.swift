//
// Created by Dossymkhan Zhulamanov on 08.07.2022.
//


import Foundation

class DynamicAsync<T>: Dynamic<T> {
    
    override func fire() {
        -->{ self.listener?(self.value) }
    }
    
    override init(_ v: T) {
        super.init(v)
    }
}

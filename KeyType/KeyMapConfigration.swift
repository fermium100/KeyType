//
//  KeyMapConfigration.swift
//  KeyType
//
//  MIT License
//  Copyright (c) 2016 potsbo
//

import Cocoa

class KeyMapConfiguration {
    var keyMappingList: [KeyEventMap] = []
    
    let kanaEisuMappings = [
        [Key.COMMAND_L.without.command, Key.EISU.alone],
        [Key.COMMAND_R.without.command, Key.KANA.alone]
    ]
    
    var mapList: [CGKeyCode: [KeyEventMap]] {
        get {
            if needsRehashing { rehash() }
            return storedList
        }
    }
    
    private var storedList : [CGKeyCode: [KeyEventMap]] = [:]
    private var needsRehashing = true
    
    private func rehash(){
        storedList = [:]
        
        for val in self.keyMappingList {
            let key = val.input.keyCode
            
            if storedList[key] == nil {
                storedList[key] = []
            }
            
            storedList[key]?.append(val)
        }
        needsRehashing = false
    }

}




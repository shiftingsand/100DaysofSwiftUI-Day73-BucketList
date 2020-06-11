//
//  ContentView.swift
//  BucketList
//
//  Created by Chris Wu on 6/11/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let filename = "message.txt"
    var body: some View {
        VStack {
        Text("Hello world")
            .onTapGesture {
                let str = "Test Message"
                let url = self.getDocumentsDirectory().appendingPathComponent(self.filename)
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    
                    let input = try String(contentsOf: url)
                    print("i read back \"\(input)\"")
                } catch {
                    print(error.localizedDescription)
                }
        }
            Text("filemanager says \(FileManager.default.readMyFile(theFileName: filename))")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

extension FileManager {
    func readMyFile(theFileName : String) -> String {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let onePath : URL = paths[0]
        let url = onePath.appendingPathComponent(theFileName)
        
        do {
            let input = try String(contentsOf: url)
            return input
        } catch {
            return(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  DataModel.swift
//  Safe
//
//  Created by IgorGalimski on 27/11/2021.
//

import Foundation

struct DataModel: Hashable, Codable
{
    let userName: String
    let password: String
    let siteName: String
}

func load<T: Codable>(fileName: String) -> T
{
    let data: Data
    
    guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else
    {
        fatalError("Couldn't find file")
    }
    
    do
    {
        data = try Data(contentsOf: fileURL)
    }
    catch let error
    {
        fatalError("Not file found: " + error.localizedDescription)
    }
    
    let decoder = JSONDecoder()
    do
    {
        return try decoder.decode(T.self, from: data)
    }
    catch let error
    {
        fatalError("Decode error: " + error.localizedDescription)
    }
}

var sensetiveData: [DataModel] = load(fileName: "sensetiveData")

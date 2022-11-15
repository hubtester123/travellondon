//
//  FileLoadingUtility.swift
//  travellondon
//
//  Created by Tony Cheung on 31/10/2022.
//

import Foundation

enum FileLoadingError: Error, Equatable {
    case fileMissingError(String)
    case cannotLoadFileError(String)
}

func loadFileToJSON<T>(_ filename:String, type: T) throws -> Any? {
    
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        throw FileLoadingError.fileMissingError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        throw FileLoadingError.cannotLoadFileError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        
        if T.self == EventDetail.Type.self {
            return try parseJSONToEventDetail(data: data)
        }
        
        if T.self == [Event].Type.self {
            return try parseJSONArrayToEventArray(data: data)
        }
        
        return nil
        
    } catch let error as NSError {
        print("Failed to load: \(error.localizedDescription)")
    }
    
    fatalError("Couldn't parse the object")
}

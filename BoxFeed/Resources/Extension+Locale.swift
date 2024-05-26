//
//  extension+Locale.swift
//  BoxFeed
//
//  Created by Husnain Ali on 26/05/2024.
//

import Foundation

extension Locale {
    var deviceLanguageIfSupported: String {
        if let languageCode = self.languageCode, desiredLanguages.contains(languageCode) {
            return languageCode
        } else {
            return "en"
        }
    }
    
    var deviceRegion: String? {
        self.regionCode?.lowercased()
    }
    
    var countryIfSupported: String {
        if let regionCode = self.deviceRegion, desiredLanguages.contains(regionCode) {
            return regionCode
        } else {
            return "us"
        }
    }
}


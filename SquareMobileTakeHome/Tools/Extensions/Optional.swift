//
//  Optional.swift
//  SquareMobileTakeHome
//
//  Created by Sky Roth on 2022-11-09.
//
//  Extensions for Optionals

import Foundation

extension Optional {
    struct UnwrapError: Error { }

    //  Try to unwrap optional, throw if failed
    static func unwrap(_ any: Any) throws -> Wrapped {
        guard let wrapped = any as? Wrapped else {
            throw UnwrapError()
        }
        return wrapped
    }
}

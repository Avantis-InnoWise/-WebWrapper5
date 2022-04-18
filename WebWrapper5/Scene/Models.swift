//
//  Models.swift
//  WebWrapper5
//
//  Created by user on 15.04.22.
//

import Foundation

enum Models {
    enum InitialData {
        struct Request {}
        struct Response {}

        struct ViewModel {
            let content: Content
            let baseURL: URL?
        }
    }

    enum GoBack {
        struct Request {}
        struct Response {}
        struct ViewModel {}
    }

    enum GoForward {
        struct Request {}
        struct Response {}
        struct ViewModel {}
    }

    enum GoHome {
        struct Request {}
        struct Response {}

        struct ViewModel {
            let url: URL?
        }
    }
    
    struct Content {
        let bckTtl: String
        let hmTtl: String
        let frwrdTtl: String
    }
}

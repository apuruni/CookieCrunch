//
//  Swap.swift
//  CookieCrunch
//
//  Created by Apurune on 2015/01/25.
//  Copyright (c) 2015年 Apurune. All rights reserved.
//

struct Swap: Printable {
    let cookieA: Cookie
    let cookieB: Cookie
    
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
}

//
//  PageModel.swift
//  Pinch
//
//  Created by Appnap ws27 on 15/6/23.
//

import Foundation

struct Page: Identifiable {
  let id: Int
  let imageName: String
}

extension Page {
  var thumbnailName: String {
    return "thumb-" + imageName
  }
}

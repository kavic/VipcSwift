//
//  NewsModel.swift
//  VipcSwift
//
//  Created by Kavic Tan on 2018/7/25.
//  Copyright © 2018年 vipc. All rights reserved.
//

import HandyJSON

struct NewsModel: HandyJSON {
    var recommend: [ArticleModel]! = []
}

struct ArticleModel: HandyJSON {
    var title: String?
    var url: String?
    var tag: String?
    var thumbnail: String?
    var vt: Int = 0
    var images = [String]()
    var app = JsSdkModel()
}

struct JsSdkModel: HandyJSON {
    var action: String?
    var type: String?
    var arguments = ArgumentModel()
}

struct ArgumentModel: HandyJSON {
    var item0: String?
    var item1: String?
}

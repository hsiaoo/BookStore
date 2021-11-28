//
//  UserBookShelf.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/11/27.
//  Copyright © 2021 VSpace, Inc. All rights reserved.
//

import Foundation

struct Borrowing
{
    static let books =
    [
        Book(title: "天龍八部", author: "金庸", image: nil, publicationDate: "2021/11/27", fileType: .PDF, pages: 100, description: "《天龍八部》是作家金庸的一部長篇武俠小說。由於《射鵰英雄傳》中曾提及喬峯為洪七公的前任者和段譽為段智興（一燈大師）的祖父和祖先，並曾提及大理段氏過去的事蹟，因此本書也可為「射鵰三部曲」的前傳。金庸表示：「《天龍八部》部分表達了佛家的哲學思想，就是人生大多數是不幸的。佛家對人生的定義比較悲觀，人生都要受苦，不管活得怎樣好，最後總會往生，當然沒辦法。佛家思想對人生真諦有深刻的理解。」"),
        Book(title: "元宇宙", author: "John", image: nil, publicationDate: "2021/11/27", fileType: .TXT, pages: 3, description: "「Metaverse」一詞來源於1992年作家尼爾·史蒂文森（Neal Stephenson）的科幻小說《雪崩》，描述一個人們以虛擬形象在三度空間中與各種軟體互動的世界。英文原著中叫「Metaverse」，它由「Meta」和「Verse」兩個詞根組成，Meta「元」表示「超越」， verse表示「宇宙universe」。")
    ]
}



struct Favorite
{
    static let books = [Book]()
}

struct ReadingRecord
{
    static let books = [Book]()
}

//
//  Book.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/20.
//

import UIKit

enum BookFileType: String
{
    case PDF
    case EPUB
    case CHM
    case Mobi
    case TXT
    case DOC
    case HTML
}

struct Book
{
    var title: String
    var author: String
    var image: Any?
    var publicationDate: String
    var fileType: BookFileType
    var pages: Int
    var description: String
    
    static var BookSample: [Book] {
        let books = [
            Book(title: "年輕人為何憤怒", author: "賈米爾．吉瓦尼", image: nil, publicationDate: "2021/09/14", fileType: .PDF, pages: 328, description: "在當今的世界，年輕人面臨的陷阱和誘惑比以往任何時候都要多，但能讓身陷溝渠的他們爬出困境的梯子卻比以往都更少。那些急切地想用暴力摧毀世界的年輕人，他們為何憤怒？為何掙扎？本書最精彩的並不是浪子回頭的故事，而是深刻的同情性理解，撼動人心。"),
            Book(title: "神秘優雅的數學家日常", author: "二宮敦人", image: nil, publicationDate: "2021/09/17", fileType: .PDF, pages: 336, description: "喜歡數學的，都是什麼樣的人？時而聰穎、時而脫線、從走路的背影就可以知道誰是數學家，只有天選之人才能入住，彷彿現代霍格華茲的數學界。從天才們架構的宇宙，延伸出人類的未來！真誠無邪念、忠於自己的感情，這就是數學的世界。"),
            Book(title: "世界末日時，有空喝杯咖啡嗎？", author: "何則文", image: nil, publicationDate: "2021/09/21", fileType: .PDF, pages: 224, description: "這是一本充滿「人味」的故事書，冒險的浪漫，交流的情誼，還有，發覺歷史的真相。造成隔閡的從來不是語言跟文化，而是自己心中的偏見跟歧視，或許，你認識的世界並不如以為的全面。世界本來就不只有一種樣貌，接納差異，才是真正的國際觀！「你是一個人類嗎？」所有地球上的人，都因為自己的民族、出生的國家以及個人經驗，塑造出自己的觀點，沒有什麼是對的、什麼是錯的，每個人的眼睛看出去的世界，本來就不同。讓我們從何則文的眼睛看出去，從「心」出發。")]
        return books
    }
}

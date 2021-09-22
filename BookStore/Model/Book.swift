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
            Book(title: "世界末日時，有空喝杯咖啡嗎？", author: "何則文", image: nil, publicationDate: "2021/09/21", fileType: .PDF, pages: 224, description: "這是一本充滿「人味」的故事書，冒險的浪漫，交流的情誼，還有，發覺歷史的真相。造成隔閡的從來不是語言跟文化，而是自己心中的偏見跟歧視，或許，你認識的世界並不如以為的全面。世界本來就不只有一種樣貌，接納差異，才是真正的國際觀！「你是一個人類嗎？」所有地球上的人，都因為自己的民族、出生的國家以及個人經驗，塑造出自己的觀點，沒有什麼是對的、什麼是錯的，每個人的眼睛看出去的世界，本來就不同。讓我們從何則文的眼睛看出去，從「心」出發。"),
            Book(title: "高手的法則", author: "克里斯多福．派克", image: nil, publicationDate: "2021/09/08", fileType: .PDF, pages: 464, description: "從美國華爾街到英國西敏區，從價值投資、指數投資到短線交易，從基金經理人到專職投資人，這些現代投資領域最偉大、最具洞察力的基金經理和私人投資者們，分享他們連續30年以驚人報酬率跑贏市場的實用箴言與智慧。他們不但創造出驚人的報酬，更培育出最成功的投資專業人士，如今倡導世界上最簡單的投資體系，驅動了數以百億計的利潤。\n這本書彙整各種不同投資觀點，列出各投資領域高手的必做與不做的原則，讓投資人在思路開闊的投資世界中，認識投資的真實面貌，以打造出適合自己的投資優勢！"),
            Book(title: "無法平靜的夜晚", author: "瑪麗珂‧盧卡絲‧萊納菲爾德", image: nil, publicationDate: "2021/09/01", fileType: .PDF, pages: 312, description: "我十歲，從那天起，我不脫外套。\n來自荷蘭的年度暢銷小說，沸騰國際文壇的全新聲音。布克國際獎史上最年輕得主，震驚出版界的天才橫溢之作！\n「我想讓大家知道一個家庭要如何面對傷痛，尤其是孩童會怎麼做。」－－瑪麗珂‧盧卡絲‧萊納菲爾德"),
            Book(title: "被操弄的真實", author: "泰娜‧布策", image: nil, publicationDate: "2021/03/01", fileType: .PDF, pages: 352, description: "從搜尋引擎到社群媒體，演算法篩選成千上萬的資訊，形成了偏見，卻也造就了同溫層。誰賦予了演算法權力，決定我們看到的一切？工程師、社群平台、意見領袖、普羅大眾？唯有看透背後的政治運作，才能揭露網路世界的真實！"),
            Book(title: "我們（還在初戀的島上）", author: "陳玉慧", image: nil, publicationDate: "2021/09/21", fileType: .PDF, pages: 314, description: "就像行星圍繞著恆星，我們圍繞著海島，正如我們的愛情，氣候變遷下我們的處境，寫給當今海島的一封情書。")]
        return books
    }
}

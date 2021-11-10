//
//  LibraryCategory.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/21.
//

// MARK: - 第一層抽象層
protocol MainCategory
{
    associatedtype MainType
    static func getSubCategory(from main: MainType) -> SubCategory
}

protocol SubCategory
{
    var subDictionary: [Int: String] { get }
}

// 電子書的種類
enum BookMainCategoryType: String, CaseIterable
{
    case Literature = "文學"
    //    case Novel = "小說"
    //    case Humanities = "人文"
    //    case Audiobook = "有聲書"
    //    case PictureBook = "繪本"
    //    case Comics = "漫畫"
    //    case ChildrenBook = "童書/青少年叢書"
    //    case Business = "商業"
    //    case Leisure = "休閒娛樂"
    //    case SelfHelp = "心理勵志"
    //    case Life = "生活"
    //    case History = "歷史"
    //    case SocialSciences = "社會科學"
    //    case Art = "藝術"
    //    case Education = "教育"
    //    case Family = "親子育樂"
    //    case Travel = "觀光旅遊"
    //    case Language = "語言學習"
    //    case Design = "設計"
    //    case PopularScience = "科普"
    //    case Examination = "考試用書"
    //    case ComputerSciences = "電腦資訊"
    //    case Free = "免費專區"
}

// 電子雜誌的種類
enum MagazineMainCategoryType: String, CaseIterable
{
    case FinancePolitics = "財經政治"
}


// MARK: - 第二層具體層-電子書
struct BookMainCategory: MainCategory
{
    typealias MainType = BookMainCategoryType
    
    static func getSubCategory(from main: BookMainCategoryType) -> SubCategory
    {
        switch main
        {
        case .Literature:
            return Literature()
        }
    }
}

// 文學
struct Literature: SubCategory
{
    var subDictionary: [Int: String] =
    [
        0: "文學小說",
        1: "大眾文學",
        2: "中國文學",
        3: "世界文學",
        4: "文學史",
        5: "現代文學",
        6: "經典文學",
        7: "歐美文學",
        8: "傳記",
        9: "國學常識",
        10: "文學評論",
        11: "詩作",
        12: "其他"
    ]
}

// MARK: - 第二層具體層-電子雜誌
struct MagazineMainCategory: MainCategory
{
    typealias MainType = MagazineMainCategoryType

    static func getSubCategory(from main: MagazineMainCategoryType) -> SubCategory
    {
        switch main
        {
        case .FinancePolitics:
            return FinancePolitics()
        }
    }
}

// 財經政治
struct FinancePolitics: SubCategory
{
    var subDictionary: [Int: String] =
    [
        0: "Money錢",
        1: "PPAPER BUSINESS",
        2: "大師輕鬆讀",
        3: "女人變有錢",
        4: "今周刊",
        5: "台灣銀行家",
        6: "交流雜誌",
        7: "先探投資週刊",
        8: "全球中央雜誌",
        9: "好房網HouseFun",
        10: "兩岸商情雜誌",
        11: "卓越雜誌",
        12: "明鏡雜誌",
        13: "哈佛商業評論",
        14: "活動平台雜誌",
        15: "看雜誌",
        16: "財訊",
        17: "財訊快報理財年鑑",
        18: "專案經理雜誌",
        19: "專案經理雜誌 特刊",
        20: "理財周刊",
        21: "理財周刊：2021投資大趨勢",
        22: "創業1定贏",
        23: "創業商機",
        24: "新新聞",
        25: "經理人",
        26: "遠見雜誌"
    ]
}

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
    case Novel = "小說"
    case Humanities = "人文"
    case Audiobook = "有聲書"
    case PictureBook = "繪本"
    case Comics = "漫畫"
    case ChildrenBook = "童書/青少年叢書"
    case Business = "商業"
    case Leisure = "休閒娛樂"
    case SelfHelp = "心理勵志"
    case Life = "生活"
    case History = "歷史"
    case SocialSciences = "社會科學"
    case Art = "藝術"
    case Education = "教育"
    case Family = "親子育樂"
    case Travel = "觀光旅遊"
    case Language = "語言學習"
    case Design = "設計"
    case PopularScience = "科普"
    case Examination = "考試用書"
    case ComputerSciences = "電腦資訊"
    case Free = "免費專區"
}

// 電子雜誌的種類
enum MagazineMainCategoryType: String, CaseIterable
{
    case FinancePolitics = "財經政治"
    case HumanitiesAndArts = "人文藝術"
    case LifeInformation = "生活資訊"
    case PopularScienceTrends = "科普趨勢"
    case Fashion = "流行時尚"
    case Architecture = "建築設計"
    case FamilyHealth = "親子健康"
    case Children = "兒少期刊"
    case LanguageMagazine = "語言學習"
    case Scholarship = "學術期刊"
}


// MARK: - 第二層具體層-電子書
struct BookMainCategory: MainCategory
{
    typealias MainType = BookMainCategoryType
    
    static func getSubCategory(from main: BookMainCategoryType) -> SubCategory
    {
        switch main
        {
        case .Literature: return Literature()
        case .Novel: return Novel()
        case .Humanities: return Humanities()
        case .Audiobook: return Audiobook()
        case .PictureBook: return PictureBook()
        case .Comics: return Comics()
        case .ChildrenBook: return ChildrenBook()
        case .Business: return Business()
        case .Leisure: return Leisure()
        case .SelfHelp: return SelfHelp()
        case .Life: return Life()
        case .History: return History()
        case .SocialSciences: return SocialSciences()
        case .Art: return Art()
        case .Education: return Education()
        case .Family: return Family()
        case .Travel: return Travel()
        case .Language: return Language()
        case .Design: return Design()
        case .PopularScience: return PopularScience()
        case .Examination: return Examination()
        case .ComputerSciences: return ComputerSciences()
        case .Free: return Free()
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

// 小說
struct Novel: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "武俠小說",
        1: "歷史人物/人物小說",
        2: "文學小說",
        3: "愛情文藝小說",
        4: "推理/犯罪小說",
        5: "科幻/奇幻小說",
        6: "言情小說",
        7: "溫馨勵志/成長療癒小說",
        8: "社會/紀實小說",
        9: "恐怖驚悚/靈異小說",
        10: "電視/電影原著小說",
        11: "軍事戰爭/災難冒險小說",
        12: "幽默/諷諭小說",
        13: "輕小說",
        14: "其他"
    ]
}

// 人文
struct Humanities: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "文化",
        1: "史地",
        2: "法律",
        3: "心理學",
        4: "宗教信仰",
        5: "哲學思想",
        6: "傳記",
        7: "中國史研究",
        8: "中國近代",
        9: "清代",
        10: "日本研究",
        11: "民間故事",
        12: "原住民",
        13: "學術研究",
        14: "其他"
    ]
}

// 有聲書
struct Audiobook: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "有聲繪本",
        1: "語言學習"
    ]
}

// 繪本
struct PictureBook: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "知識類繪本",
        1: "故事類繪本",
        2: "語文類繪本"
    ]
}

// 漫畫
struct Comics: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "兒童漫畫",
        1: "一般漫畫"
    ]
}

// 童書/青少年叢書
struct ChildrenBook: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "兒童小說",
        1: "兒童文學",
        2: "青少年文學",
        3: "故事合集",
        4: "圖畫書",
        5: "圖畫繪本",
        6: "校園故事",
        7: "童話",
        8: "語文/英語學習",
        9: "歷史",
        10: "字、辭典",
        11: "自然科學",
        12: "數學",
        13: "藝術"
    ]
}

// 商業
struct Business: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "經營管理",
        1: "行銷業務",
        2: "投資理財",
        3: "產業貿易",
        4: "趨勢分析",
        5: "職場生涯",
        6: "語言學習"
    ]
}

// 休閒娛樂
struct Leisure: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "運動",
        1: "工藝園藝",
        2: "時尚流行",
        3: "攝影寫真",
        4: "電影音樂",
        5: "興趣嗜好",
        6: "命理/占星",
        7: "休閒圖文書",
        8: "登山健走",
        9: "寓言/笑話/遊戲",
        10: "其他"
    ]
}

// 心理勵志
struct SelfHelp: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "心理",
        1: "勵志",
        2: "心靈成長",
        3: "其他"
    ]
}

// 生活
struct Life: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "生活休閒",
        1: "旅行",
        2: "健康生活",
        3: "兩性",
        4: "同性",
        5: "人際關係",
        6: "美容造型",
        7: "美體",
        8: "飲食生活",
        9: "食譜",
        10: "養生保健",
        11: "日常應用",
        12: "服飾雜貨",
        13: "運動/戶外活動",
        14: "寵物"
    ]
}

// 歷史
struct History: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "中國歷史",
        1: "世界歷史",
        2: "台灣歷史"
    ]
}

// 社科
struct SocialSciences: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "政治",
        1: "經濟",
        2: "法律",
        3: "社會",
        4: "外交",
        5: "傳媒",
        6: "中醫",
        7: "醫藥",
        8: "生死學",
        9: "中國政經社會"
    ]
}

// 藝術
struct Art: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "藝術/工藝",
        1: "美術/畫作",
        2: "美學",
        3: "音樂/戲曲",
        4: "攝影",
        5: "戲劇/表演藝術/舞蹈",
        6: "其他"
    ]
}

// 教育
struct Education: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "生命教育",
        1: "社會教育",
        2: "學校教育",
        3: "家庭教育",
        4: "留學教育",
        5: "特殊兒童教育",
        6: "數學",
        7: "其他"
    ]
}

// 親子育樂
struct Family: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "懷孕生產",
        1: "親子教養",
        2: "親子分享",
        3: "親子情感"
    ]
}

// 觀光旅遊
struct Travel: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "台灣",
        1: "中國大陸/港澳",
        2: "日本",
        3: "韓國",
        4: "東南亞",
        5: "亞洲",
        6: "歐洲",
        7: "法國",
        8: "美洲",
        9: "旅遊文學",
        10: "其他"
    ]
}

// 語言學習
struct Language: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "中文",
        1: "英語",
        2: "日語",
        3: "韓語",
        4: "台語、客家語、原住民語",
        5: "法文",
        6: "德文",
        7: "西班牙文",
        8: "翻譯",
        9: "TOEIC多益檢定",
        10: "歐洲其他語系",
        11: "亞洲其他語系",
        12: "其他"
    ]
}

// 設計
struct Design: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "美術設計",
        1: "室內設計",
        2: "創意美學",
        3: "東方建築",
        4: "西方建築",
        5: "住宅建築",
        6: "都市設計",
        7: "環境工程",
        8: "總論"
    ]
}

// 科普
struct PopularScience: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "自然科學",
        1: "物理化學",
        2: "生物",
        3: "數學",
        4: "應用科學",
        5: "腦科學",
        6: "醫學",
        7: "動物",
        8: "植物",
        9: "電子資訊",
        10: "圖書資訊/百科年鑑",
        11: "其他"
    ]
}

// 考試用書
struct Examination: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "國語/作文",
        1: "語言考試/檢定",
        2: "高中參考書",
        3: "專技人員用書"
    ]
}

// 電腦/資訊
struct ComputerSciences: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "作業系統",
        1: "資訊/程式",
        2: "網路/通訊",
        3: "數位/手機",
        4: "應用軟體"
    ]
}

// 免費專區
struct Free: SubCategory
{
    var subDictionary: [Int : String] =
    [
        0: "生活資訊",
        1: "自然科技",
        2: "社會人文",
        3: "觀光旅遊"
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
        case .FinancePolitics: return FinancePolitics()
        case .HumanitiesAndArts: return HumanitiesAndArts()
        case .LifeInformation: return LifeInformation()
        case .PopularScienceTrends: return PopularScienceTrends()
        case .Fashion: return Fashion()
        case .Architecture: return Architecture()
        case .FamilyHealth: return FamilyHealth()
        case .Children: return Children()
        case .LanguageMagazine: return LanguageMagazine()
        case .Scholarship: return Scholarship()
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

// 人文藝術
struct HumanitiesAndArts: SubCategory
{
    var subDictionary: [Int : String] =
    [
       0: "dpi設計插畫誌",
       1: "FOCUS焦點藝術",
       2: "Life Plus熟年誌",
       3: "Opera / arts & culture",
       4: "PAR表演藝術誌",
       5: "PPAPER",
       6: "Sample樣本",
       7: "VERSE",
       8: "XPLORE",
       9: "大學雜誌",
       10: "小日子享生活誌",
       11: "小典藏",
       12: "中土雜誌",
       13: "夭夭",
       14: "文訊雜誌",
       15: "台灣光華雜誌(中日文版)",
       16: "台灣光華雜誌(中英文國內版)",
       17: "幼獅文藝",
       18: "宇宙光雜誌",
       19: "寺廟大小事",
       20: "有荷文學雜誌",
       21: "兩性新知文選",
       22: "典藏今藝術",
       23: "典藏古美術",
       24: "幸運雜誌",
       25: "金門文藝",
       26: "香光莊嚴雜誌",
       27: "揚生風箏報",
       28: "經典雜誌",
       29: "潮人物",
       30: "潮思Mintazine",
       31: "職人SHOKUZiNE"
    ]
}

// 生活資訊
struct LifeInformation: SubCategory
{
    var subDictionary: [Int : String] =
    [
       0: "Cycling Update單車誌",
       1: "Hong Kong Walker",
       2: "idSHOW好宅秀",
       3: "Japan Walker",
       4: "LiFE",
       5: "Runnnn跑跑步",
       6: "SENSE好感",
       7: "STARS生活美學誌",
       8: "Taipei Walker",
       9: "Walker特刊",
       10: "一個人的旅行",
       11: "戶外探索Outside",
       12: "世界電影",
       13: "台灣鞋訓",
       14: "正反合",
       15: "正反合特刊",
       16: "白糖粿",
       17: "好遊趣",
       18: "行遍天下",
       19: "汽車線上情報誌",
       20: "周刊王",
       21: "欣旅遊BonVoyage",
       22: "阿路巴高爾夫 苦手克服球技特刊短桿篇",
       23: "阿路巴高爾夫國際中文版",
       24: "秋刀魚",
       25: "旅@天下",
       26: "旅讀中國",
       27: "時尚漫旅 ROAM",
       28: "時報周刊",
       29: "消費者報導",
       30: "留學StudyDIY",
       31: "貢丸湯",
       32: "高傳真視聽",
       33: "動腦雜誌",
       34: "現代保險健康理財雜誌",
       35: "甜蜜蜜",
       36: "單車身活",
       37: "單車環島聖經",
       38: "鄉間小路",
       39: "電玩雙週刊",
       40: "慢旅宮城小日子",
       41: "廣告雜誌",
       42: "豐年"
    ]
}

//科普趨勢
struct PopularScienceTrends: SubCategory
{
    var subDictionary: [Int : String] =
    [
       0: "HOW IT WORKS知識大圖解",
       1: "尖端科技軍事雜誌",
       2: "兵器戰術圖解",
       3: "科學人雜誌",
       4: "能力雜誌",
       5: "遙控技術",
       6: "遙控飛行技術",
       7: "數位狂潮DigiTrend",
       8: "數位時代",
       9: "環球生技月刊"
    ]
}

// 流行時尚
struct Fashion: SubCategory
{
    var subDictionary: [Int : String] =
    [
       0: "Ami艾美時尚",
       1: "ARCH雅趣",
       2: "BAZAAR哈潑時尚",
       3: "BEAUTY大美人",
       4: "BEAUTY美人誌",
       5: "ELLE雜誌",
       6: "InStyle時尚泉",
       7: "InStyle時尚樂",
       8: "LEZS雜誌",
       9: "men's uno男人誌",
       10: "PPAPER Fashion",
       11: "PPAPER Man",
       12: "VoCE國際中文版",
       13: "君子時代雜誌",
       14: "明潮M'INT",
       15: "欣音樂",
       16: "美麗佳人",
       17: "茉莉美人髮妝精選",
       18: "時間觀念",
       19: "珠寶之星",
       20: "富豪人生",
       21: "愛女生雜誌",
       22: "醫美時尚",
       23: "囍結TieTheKnots時尚誌"
    ]
}

// 建築設計
struct Architecture: SubCategory
{
    var subDictionary: [Int : String] =
    [
       0: "2019MEET @ design 設計心勢力",
       1: "2020MEET @ design 設計心勢力",
       2: "DECO居家",
       3: "Dream Life夢想誌",
       4: "HOMEDESIGN設計玩家",
       5: "Top Design 住宅設計精選 Fun Design",
       6: "易裝修系列",
       7: "室內設計 INTERIOR DESIGN",
       8: "時尚家居House-Style",
       9: "趨勢建材"
    ]
}

// 親子健康
struct FamilyHealth: SubCategory
{
    var subDictionary: [Int : String] =
    [
       0: "BabyLife育兒生活",
       1: "人本教育札記",
       2: "大家健康雜誌",
       3: "早安健康",
       4: "美麗孕媽咪",
       5: "張老師月刊",
       6: "媽咪寶貝",
       7: "媽媽寶寶",
       8: "魅麗雜誌Amazing",
       9: "親子天下",
       10: "嬰兒與母親"
    ]
}

// 兒少期刊
struct Children: SubCategory
{
    var subDictionary: [Int : String] =
    [
       0: "bobo小天才",
       1: "iFun學電子雜誌",
       2: "Top945康軒學習雜誌初階版",
       3: "Top945康軒學習雜誌進階版",
       4: "少年牛頓",
       5: "幼獅少年",
       6: "科學少年"
    ]
}

// 語言學習
struct LanguageMagazine: SubCategory
{
    var subDictionary: [Int : String] =
    [
       0: "ABC互動英語",
       1: "ALL+互動英語",
       2: "Apa Kabar Indonesia印尼語學習誌",
       3: "biz互動英語",
       4: "Bonjour!France法語學習誌",
       5: "CNN互動英語",
       6: "EZ Japan流行日語會話誌",
       7: "EZ Thai泰語學習誌",
       8: "HALLO!Germany德語學習誌",
       9: "Hello! English英語學習誌",
       10: "HI!JAPAN日語學習誌",
       11: "Hola España 西語學習誌",
       12: "Joy to the world",
       13: "KOREA韓語學習誌",
       14: "Live互動英語",
       15: "ライブ互動日本語",
       16: "大家說英語",
       17: "大家說越語",
       18: "空中英語教室",
       19: "常春藤生活英語",
       20: "常春藤解析英語",
       21: "彭蒙惠英語",
       22: "槓桿韓國語學習週刊",
       23: "德語學習誌"
    ]
}

// 學術期刊
struct Scholarship: SubCategory
{
    var subDictionary: [Int : String] =
    [
       0: "人文學科",
       1: "自然科學",
       2: "社會科學"
    ]
}

//
//  LibraryCategory.swift
//  BookStore
//
//  Created by H.W. Hsiao on 2021/9/21.
//

enum LibraryCategory: String, CaseIterable
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
    
    static func getSubCategory(category: LibraryCategory) -> [LibrarySubCategory]
    {
        var subCategory: [LibrarySubCategory]
        switch category
        {
        case .Literature:
            subCategory = [.LiteratureNovel, .PopularLiterature, .ChineseLiterature, .WorldLiterature, .LiteraryHistory, .ModernLiterature, .ClassicLiterature, .EnglishLiterature, .Biography, .Sinology, .LiteraryCriticism, .Poetry, .OtherLiterature]
        }
        return subCategory
    }
}

enum LibrarySubCategory: String
{
    // Literature文學
    case LiteratureNovel = "文學小說"
    case PopularLiterature = "大眾文學"
    case ChineseLiterature = "中國文學"
    case WorldLiterature = "世界文學"
    case LiteraryHistory = "文學史"
    case ModernLiterature = "現代文學"
    case ClassicLiterature = "經典文學"
    case EnglishLiterature = "歐美文學"
    case Biography = "傳記"
    case Sinology = "國學常識"
    case LiteraryCriticism = "文學評論"
    case Poetry = "詩作"
    case OtherLiterature = "其他"
}

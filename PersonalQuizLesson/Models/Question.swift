//
//  Question.swift
//  PersonalQuizLesson
//
//  Created by MAcbook on 08.11.2022.
//

struct Question {
    let title: String
    let responseType: ResponseType
    let answers: [Answer]
}

enum ResponseType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let animal: Animal
}

enum Animal: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "🐶"
        case .cat:
            return "🐱"
        case .rabbit:
            return "🐰"
        case .turtle:
            return "🐢"
        }
    }
}


enum CommentAnimal {
    case dog
    case cat
    case rabbit
    case turtle
    
    var comment: String {
        switch self {
        case .dog:
            return "Вы прекрасный друг и хороший товарищ!"
        case .cat:
            return "Вы домашний питомец, любящий греться под одеялком, но всегда готовый прийти на помощь!"
        case .rabbit:
            return "Вы ведете здоровый образ жизни! (А если нет, но явно к нему стремитесь!)"
        case .turtle:
            return "Ваша жизнь максимально размеренна, вы никогда никуда не спешите и наслаждаетесь жизнью!"
        }
    }
}


extension Question {
    static func getQuestions() -> [Question] {
        [
            Question(
                title: "Какую пищу предпочитаете?",
                responseType: .single,
                answers: [
                    Answer(title: "Стейк", animal: .dog),
                    Answer(title: "Рыба", animal: .cat),
                    Answer(title: "Морковь", animal: .rabbit),
                    Answer(title: "Кукуруза", animal: .turtle)
                ]
            ),
            
            Question(
                title: "Что вам больше нравится?",
                responseType: .multiple,
                answers: [
                    Answer(title: "Плавать", animal: .dog),
                    Answer(title: "Спать", animal: .cat),
                    Answer(title: "Обниматься", animal: .rabbit),
                    Answer(title: "Есть", animal: .turtle)
                ]
            ),
            Question(
                title: "Любите ли вы поездки на машине?",
                responseType: .ranged,
                answers: [
                    Answer(title: "Ненавижу", animal: .cat),
                    Answer(title: "Нервничаю", animal: .rabbit),
                    Answer(title: "Не замечаю", animal: .turtle),
                    Answer(title: "Обожаю", animal: .dog)
                ])
        ]
    }
}

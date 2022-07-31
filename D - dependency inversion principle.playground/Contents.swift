// Зависимости на абстракциях. Нет зависимости на что-то конкретное.
// Модули верхних уровней не должны зависеть от модулей нижних уровней. Оба типа модулей должны зависеть от абстракций.

// Нарушение принципа
class BadOrder {
    
    var price: Float
    
    init(price: Float) {
        self.price = price
    }
    
    func getTotalAmount() -> Float {
        // тут у нас появляется зависимость от класса SeasonDiscount. Класс Order жестко связан с классом SeasonDiscount
        let discount = BadSeasonDiscount()
        return price * discount.calculate()
    }
}

// мы не сможем добавить новый тип скидок без изменения кода класса SeasonDiscount
// Например чтобы добавить скидки к черной пятнице нам надо будет дописать условие для расчета скидки черная пятница
class BadSeasonDiscount {
    
    var season = "Summer"
    
    func calculate() -> Float {
        if season == "Summer" {
            return 0.9
        } else if season == "Winter" {
            return 0.8
        } else {
            return 1
        }
    }
}

// Исправим код чтобы принцип соблюдался
// добавим протокол для скидок
protocol GoodDiscount {
    func calculate() -> Float
}

class GoodOrder {
    
    var price: Float
    
    init(price: Float) {
        self.price = price
    }
    // исправим функцию, устраним зависимость от конкретного класса. Установим зависимость на абстрактный протокол.
    func getTotalAmount(discount: GoodDiscount) -> Float {
        return price * discount.calculate()
    }
}

class GoodSeasonDiscount: GoodDiscount {
    
    var season = "Summer"
    
    func calculate() -> Float {
        if season == "Summer" {
            return 0.9
        } else if season == "Winter" {
            return 0.8
        } else {
            return 1
        }
    }
}

// теперь мы можем легко добавить новый тип скидок без исправления уже написанного кода
class BlackFriday: GoodDiscount {
    func calculate() -> Float {
        return 0.5
    }
}

// Для каждого класса должно быть определено единственное назначение.
// Все ресурсы, необходимые для его осуществления, должны быть инкапсулированы в этот класс и подчинены только этой задаче.

// Существует лишь одна причина, приводящая к изменению класса. Один класс решает одну конкретную задачу.
// Все свойства и методы данного класса должны служить одной и только одной цели.

// Нарушение принципа, один класс отвечает за разные задачи
// Класс в себе содержит как минимум три причины для изменений (логика работы с рекламой, налоговыми отчетами и продажами)
// Согласно принципу через класс должна проходить только одна ось изменений
class BusinessMember {
    func orderAdvertising() {
        print("Orders ads and creates content")
    }
    
    func sendTaxReport() {
        print("Fill in and send a tax report")
    }
    
    func saleOfGoods() {
        print("Sale of goods and issuance of checks")
    }
}

// Исправление ошибок
// Разобьем на несколько классов, чтобы каждый класс был ответственен только за одну задачу
class AdsManager {
    func orderAdvertising() {
        print("Orders ads and creates content")
    }
}

class Accounter {
    func sendTaxReport() {
        print("Fill in and send a tax report")
    }
}

class Seller {
    func saleOfGoods() {
        print("Sale of goods and issuance of checks")
    }
}

// Много интерфейсов предназначенных для клиентов, лучше чем один общий
// Принцип разделения интерфейсов говорит о том, что слишком «толстые» интерфейсы необходимо разделять на более маленькие и специфические,
// чтобы клиенты маленьких интерфейсов знали только о методах, которые необходимы им в работе. В итоге, при изменении метода интерфейса
// не должны меняться клиенты, которые этот метод не используют.

// Цель принципа - минимизация побочных эффектов и повторов за счет разделения ПО на независимые части

// Нарушение принципа
protocol BadTransportVehicle {
    func drive()
    func fly()
}

class BadLandVihicle {
    func execute(_ vehicle: BadTransportVehicle) {
        vehicle.drive()
        // также от сюда доступен метод fly() который не должен использоваться наземным транспортом
        // это нарушение принципа тк этому классу не за чем иметь доступ к этому методу
    }
}

class BadFlyingVihicle {
    func execute(_ vehicle: BadTransportVehicle) {
        vehicle.fly()
        // от сюда доступен метод drive() который не нужен классу летающего транспорта
    }
}

// Исправим код, чтобы принцип выполнялся
// Откажемся от использования одного общего интерфейса
// Разделим его на два отдельных протокола
protocol GoodLandTransportVehicle {
    func drive()
}

protocol GoodFlyingTransportVehicle {
    func fly()
}

class GoodLandVihicle {
    func execute(_ vehicle: GoodLandTransportVehicle) {
        vehicle.drive()
    }
}

class GoodFlyingVihicle {
    func execute(_ vehicle: GoodFlyingTransportVehicle) {
        vehicle.fly()
    }
}

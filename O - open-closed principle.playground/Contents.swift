// Программные сущности должны быть открыты для расширения, но закрыты для модификации
// Это означает, что эти сущности могут менять свое поведение без изменения их исходного кода
// Новый функционал вводится путем добавления новго кода, а не изменением старого, уже работающего


// По «простому»: расширить поведение сущности в Swift можно тремя способами:
// Добавить расширение (extension) к созданной сущности и дописать там новый функционал;
// Использовать наследование и переопределить поведение метода или свойства в дочерней сущности (override);
// Использовать абстракцию, при создании сущностей.

// Нарушение принципа
class Programmer {
    func performTask() {
        print("coding the app...")
    }
}

class Designer {
    func performTask() {
        print("draw design...")
    }
}

class Tester {
    func performTask() {
        print("testing the code...")
    }
}
// Добавим еще один класс
class DevOps {
    func performTask() {
        print("setting up the system...")
    }
}

class ProjectManager {
    var programmers = [Programmer]()
    var designer = [Designer]()
    var tester = [Tester]()
    // придется изменить класс менеджера при добавлении DevOps
    var devOps = [DevOps]()
    
    func countNumberEmployees() {
        print("Количество сотрудников: ")
        // также придется добавить тут изменения + devOps.count
        print(programmers.count + designer.count + tester.count + devOps.count)
    }
    
    func startDeveloping() {
        for i in programmers {
            i.performTask()
        }
        for i in designer {
            i.performTask()
        }
        for i in tester {
            i.performTask()
        }
        // и тут нужно добавить код
        for i in devOps {
            i.performTask()
        }
    }
}

// При добавлении нового класса нам пришлось модифицировать существующий класс
// Согласно принципу класс должен быть открыт к расширению, но закрыт для модификации

var manager = ProjectManager()
// Наймем 3-х программистов
manager.programmers.append(Programmer())
manager.programmers.append(Programmer())
manager.programmers.append(Programmer())
// Наймем 2-х дизайнеров
manager.designer.append(Designer())
manager.designer.append(Designer())
//Наймем 2-х тестировщиков
manager.tester.append(Tester())
manager.tester.append(Tester())
// Наймем 1-го девопса
manager.devOps.append(DevOps())
// Посчитаем сколько сотрудников на проекте
manager.countNumberEmployees()
// Попросим приступить к работе
manager.startDeveloping()

print("////////////////////////////////////////////////////")
// Приведен код к требованиям принципа. Он будет легко расширяться за счет абстракции и не требовать изменений класса при этом.

protocol Employee {
    func performTask()
}

class GoodProgrammer: Employee {
    func performTask() {
        print("coding the app...")
    }
}

class GoodDesigner: Employee {
    func performTask() {
        print("draw design...")
    }
}

class GoodTester: Employee {
    func performTask() {
        print("testing the code...")
    }
}
// Добавим еще один класс
class GoodDevOps: Employee {
    func performTask() {
        print("setting up the system...")
    }
}

// Нарушение принципа

class GoodProjectManager {
    var employee = [Employee]()
    
    func countNumberEmployees() {
        print("Количество сотрудников: ")
        print(employee.count)
    }
    
    func startDeveloping() {
        for i in employee {
            i.performTask()
        }
    }
}

var goodManager = GoodProjectManager()
// Наймем 3-х программистов
goodManager.employee.append(GoodProgrammer())
goodManager.employee.append(GoodProgrammer())
goodManager.employee.append(GoodProgrammer())
// Наймем 2-х дизайнеров
goodManager.employee.append(GoodDesigner())
goodManager.employee.append(GoodDesigner())
//Наймем 2-х тестировщиков
goodManager.employee.append(GoodTester())
goodManager.employee.append(GoodTester())
// Наймем 1-го девопса
goodManager.employee.append(GoodDevOps())
// Посчитаем сколько сотрудников на проекте
goodManager.countNumberEmployees()
// Попросим приступить к работе
goodManager.startDeveloping()

// Объекты в программе должны быть заменяемы на экземпляры их подтипов
// без изменения правильности выполнения программы

// Нарушение принципа
class Specialist {
    var busy = false
}

class Programmer: Specialist {
    
}

class Designer: Specialist {
    
}

// попробуем добавить еще один класс
class Tester: Specialist {
    
}

// после добавления класса Tester нам нужно изменить функциональность метода - askAboutStatusSpecialist
// метод может принять в качестве параметра новый класс, но функциональность на него придется дописать
// (те правильность работы не сохраняется при использовании экземпляра сабкласса)
// это нарушение принципа подстановки Лисков
class ProjectManager {
    func askAboutStatusSpecialist(_ specialist: Specialist) {
        if specialist is Programmer {
            print("Im programmist and \(specialist.busy ? "i am busy" : "i am finished my task")")
        } else if specialist is Designer {
            print("Im designer and \(specialist.busy ? "i am busy" : "i am finished my task")")
        // придется добавить еще одно условие
        } else if specialist is Tester {
            print("Im tester and \(specialist.busy ? "i am busy" : "i am finished my task")")
        }
    }
}

var projectManager = ProjectManager()
var programmer = Programmer()
programmer.busy = true
var designer = Designer()

projectManager.askAboutStatusSpecialist(programmer)
projectManager.askAboutStatusSpecialist(designer)

print("*******************************************************************")
//----------------------------------------------------------------------------------------------------
// Исправим код чтобы принцип выполнялся

protocol GoodSpecialist {
    var busy: Bool { get set }
    func printSpecialtyAndStatus()
}

class GoodProgrammer: GoodSpecialist {
    var busy: Bool = false
    
    func printSpecialtyAndStatus() {
        print("Im programmer and \(self.busy ? "i am busy" : "i am finished my task")")
    }
}

class GoodDesigner: GoodSpecialist {
    var busy: Bool = false
    
    func printSpecialtyAndStatus() {
        print("Im designer and \(self.busy ? "i am busy" : "i am finished my task")")
    }
}

// попробуем добавить еще один класс
class GoodTester: GoodSpecialist {
    var busy: Bool = false
    
    func printSpecialtyAndStatus() {
        print("Im designer and \(self.busy ? "i am busy" : "i am finished my task")")
    }
}

// после добавления класса Tester метод - askAboutStatusSpecialist работает все также как и раньше
// таким образом принцип выполняется
class GoodProjectManager {
    func askAboutStatusSpecialist(_ specialist: GoodSpecialist) {
        specialist.printSpecialtyAndStatus()
    }
}

var goodProjectManager = GoodProjectManager()
var goodProgrammer = GoodProgrammer()
goodProgrammer.busy = true
var goodDesigner = GoodDesigner()
var goodTester = GoodTester()
goodTester.busy = true

goodProjectManager.askAboutStatusSpecialist(goodProgrammer)
goodProjectManager.askAboutStatusSpecialist(goodDesigner)
goodProjectManager.askAboutStatusSpecialist(goodTester)

import Foundation

//MARK –  BleedingModel
struct BleedingModel: Identifiable {
    var id = UUID()
    var name: String
    var imageIcon: String
}

extension BleedingModel {
    
    static var bleeding1 = BleedingModel(name: "No Bleeding", imageIcon: "bleeding:noBleeding")
    static var bleeding2 = BleedingModel(name: "Light", imageIcon: "bleeding:light")
    static var bleeding3 = BleedingModel(name: "Regular", imageIcon: "bleeding:regular")
    static var bleeding4 = BleedingModel(name: "Heavy", imageIcon: "bleeding:heavy")
}

let dummyBleedingData = [BleedingModel.bleeding1, BleedingModel.bleeding2, BleedingModel.bleeding3, BleedingModel.bleeding4]

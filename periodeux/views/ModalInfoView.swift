
import SwiftUI
import Foundation

struct ModalInfoView: View {
    
    @State var date = Date()
    
    @State var diaryTags = ["Mood", "Symptom", "Bleeding"]
    @Binding var selectedDiaryTag: Int
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack {
                    
                    Picker("Diary Picker", selection: $selectedDiaryTag) {
                        ForEach(0..<diaryTags.count) { index in
                            Text(self.diaryTags[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .onChange(of: selectedDiaryTag, perform: {
                        changedValue in
                        
                        if changedValue == 0 {
                            selectedDiaryTag = 0
                        }
                        
                        if changedValue == 1 {
                            selectedDiaryTag = 1
                        }
                        
                        if changedValue == 2 {
                            selectedDiaryTag = 2
                        }
                    })
                }
                
                if selectedDiaryTag == 0{
                    Mood()
                }
                
                if selectedDiaryTag == 1 {
                    Symptom()
                }
                
                if selectedDiaryTag == 2 {
                    Bleeding()
                }
                
            }
            .navigationBarTitle(Text("\(currentDateString(date: date))"))
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.mode.wrappedValue.dismiss()
                                    }, label: {
                                        Text("Done")
                                            .foregroundColor(ColorManager.highlightOrange)
                                    })
            )
        }
        
    }
    
    var dateFormat: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM y"
        return formatter
    }
    
    func currentDateString(date: Date) -> String {
        let currentDate = dateFormat.string(from: date)
        return currentDate
    }
}

struct ModalInfoView_Previews: PreviewProvider {
    
    @Binding var selectedDiaryTag: Int
    
    static var previews: some View {
        ModalInfoView(selectedDiaryTag: .constant(2))//constant disables picker
    }
}


struct Mood : View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var moods: [MoodModel] = dummyMoodData
    
    var body : some View{
        LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
            
            ForEach(moods){
                mood in
                LargeMoodCellView(mood: mood)
            }
        }
        
        Spacer()
    }
}


struct Symptom : View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var symptoms: [SymptomModel] = dummySymptomData
    
    var body : some View{
        LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
            
            ForEach(symptoms){
                symptom in
                LargeSymptomCellView(symptom: symptom)
            }
        }
        
        Spacer()
    }
}


struct Bleeding : View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var bleedings: [BleedingModel] = dummyBleedingData
    
    var body : some View{
        
        LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
            
            ForEach(bleedings){
                bleeding in
                LargeBleedingCellView(bleeding: bleeding)
            }
        }
        
        Spacer()
    }
}

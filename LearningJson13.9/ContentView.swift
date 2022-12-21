////
////  ContentView.swift
////  LearningJson13.9
////
////  Created by Apple  on 22/12/22.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    private var movie:[Movie] = Movie.allMovies
//
//    var body: some View {
//
//        NavigationView {
//            List{
//                ForEach(movie,id:\.) { eachMovie in
//                    Text("\(eachMovie.totalPages)")
//                }
//            }
//        }
//    }
//}


import SwiftUI

struct ContentView: View {
    private var people: [Person] = Person.allPeople
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(people, id: \.firstName) { person in
                    NavigationLink(destination: DetailView(person: person)) {
                        VStack(alignment: .leading) {
                            Text("\(person.firstName) \(person.surname)")
                                .bold()
                            Text("\(person.phoneNumbers[0].number)")
                                .foregroundColor(.gray)
                        }
                        .padding(6)
                    }
                }
            }
            .navigationTitle("Phonebook")
        }
    }
}

import SwiftUI

struct DetailView: View {
    var person: Person
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(person.firstName) \(person.surname)")
                .bold()
            Text("\(person.phoneNumbers[0].number)")
            Text("\(person.address.streetAddress)")
            Text("\(person.address.city)")
        }
    }
}


import Foundation

struct Person: Codable{
    let firstName, surname, gender: String
    let age: Int
    let address: Address
    let phoneNumbers: [PhoneNumber]
    
    // Generate samples
    static let allPeople: [Person] = Bundle.main.decode(file: "example.json")
    static let samplePerson: Person = allPeople[0]
}

struct Address: Codable {
    let streetAddress, city, state, postalCode: String
}

struct PhoneNumber: Codable {
    let type, number: String
}

// Extension to decode JSON locally
extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}

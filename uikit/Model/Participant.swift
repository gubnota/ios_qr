//
//  Participant.swift
//  gopicar
//
//  Created by Vladislav Muravyev on 26.12.2023.
//

import Foundation
import Combine


struct ParticipantT: Decodable {
    let number: Int
    let id: String
    let fullname: String
    let already_registered: Bool
}

class ParticipantManager: ObservableObject {

    @Published public var participants: [ParticipantT] = []
    @Published public var filtered: [ParticipantT] = []
    @Published public var searchText = ""
    @Published public var scannedCode = "";

    static let shared = ParticipantManager()
    private init() {
        // Initialize the participants array
        participants = [
        ]
//        fetchData();
        performPostRequest()
    }
    
    func performGetRequest() {
        // Replace "your-api-endpoint" with the actual API endpoint that serves the JSON data
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([ParticipantT].self, from: data)
                    DispatchQueue.main.async {
                        self.participants = decodedData
                        self.filtered = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
    
    func performPostRequest() {
        // Define the URL and request body
        let url = URL(string: "https://newyear.pge.ru/api/v1/participants")!
        let requestBody: [String: Any] = [
            "token": "130d651e-a181-493d-a604-5b3f90bb2eed"
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: requestBody)
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("newyear.pge.ru", forHTTPHeaderField: "Host")
        request.setValue("48", forHTTPHeaderField: "Content-Length")
        request.httpBody = jsonData
        
        // Perform the request using URLSession
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    // Handle the error
                    print("Request failed with error: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    // Handle invalid response
                    print("Invalid response")
                    return
                }
                
                // Handle the response data
                if let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode([ParticipantT].self, from: data)
                        // Handle the decoded response
                        self.participants = decodedResponse;
                        print("Received response: \(decodedResponse)")
                    } catch {
                        // Handle decoding error
                        print("Error decoding response: \(error)")
                    }
                }
            }
        }.resume()
    }



    
    func filterParticipantsByName(_ searchString: String) { //}-> [ParticipantT] {
        if searchString.isEmpty {
            self.filtered = participants
        } else {
            self.filtered =  participants.filter {
            $0.fullname.localizedCaseInsensitiveContains(searchString)
            || String($0.number).contains(searchString)
            }
        }
    }
}

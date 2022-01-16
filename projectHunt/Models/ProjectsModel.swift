//
//  ProjectsModel.swift
//  projectHunt
//
//  Created by Артем Галиев on 20.12.2021.
//

import Foundation

struct ProjectsModel {
    let idProject: Int
    let projectName: String
    let projectDisc: String
    let skills: [String]
    let projectContact: String
    let peopleInProject: [PeopleModel]
}

struct PeopleModel {
    let idPeople: Int
    let name: String
    let secondName: String
    let skills: [String]
    let aboutMe: String
    let whatWantDo: String
    let telegram: String
    let numberPhone: String
}

enum ButtonState {
    case currentButton
    case pastButton
}

enum ProjectButtonState {
    case project
    case people
}

struct EventModel {
    let eventName: String
    let eventDate: String
    let eventId: Int
}

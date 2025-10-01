//
//  RegisterMock.swift
//  EmotionDiary
//
//  Created by Lizandra Malta on 01/10/25.
//

// Dados mockados para testes
let mockRegisters: [Register] = [
    Register(
        title: "Registro feliz",
        content: [
        Word(emotion: .happy, word: "sorriso ksakdj sdalkjdka dsakdalskda"),
        Word(emotion: .happy, word: "alegria dklsal;dk kdslakda "),
        Word(emotion: .none, word: "dia kdsakjda")
    ]),
    Register(
        title: "Registro triste",
        content: [
        Word(emotion: .sad, word: "lágrima"),
        Word(emotion: .sad, word: "tristeza"),
        Word(emotion: .none, word: "noite")
    ]),
    Register(
        title: "Registro de raiva",
        content: [
        Word(emotion: .angry, word: "raiva"),
        Word(emotion: .angry, word: "grito"),
        Word(emotion: .none, word: "momento")
    ]),
    Register(
        title: "Registro neutro",
        content: [
        Word(emotion: .happy, word: "amizade"),
        Word(emotion: .sad, word: "saudade"),
        Word(emotion: .angry, word: "discussão"),
        Word(emotion: .none, word: "história")
    ])
]


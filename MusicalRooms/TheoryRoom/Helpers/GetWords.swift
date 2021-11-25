//
//  GetWords.swift
//  MusicalRooms
//
//  Created by Isaac Lee Jing Zhi on 24/11/21.
//

import Foundation

func getWords(_ grade: Int) -> [Word] {
    var words: [Word] = []
    if grade == 1 {
        words = [Word(title:"a tempo", definition: "resuming the speed obtained preceding ritardando or accelerando."),
                Word(title:"accelerando", altText: "accel.", definition: "gradually increasing in speed"),
                Word(title:"adagio", definition: "in a leisurely manner; slowly"),
                Word(title:"allegretto", definition: "in a leisurely manner; slowly"),
                Word(title:"allegro", definition: "brisk or rapid in tempo"),
                Word(title:"andante", definition: "moderately slow and even"),
                Word(title:"cantabile", definition: "songlike and flowing in style"),
                Word(title:"crescendo", altText: "cresc.", definition: "a gradual increase in loudness"),
                Word(title:"da capo", altText: "D.C.", definition: "(from the) beginning"),
                Word(title:"decrescendo", altText: "decresc.", definition: "gradually reducing force (generally) "),
                Word(title:"diminuendo", altText: "dimin. / dim.", definition: "gradually reducing in loudness (generally)"),
                Word(title:"dolce", definition: "sweet; soft"),
                Word(title:"forte", altText: "f", definition: "to play loudly"),
                Word(title:"fortissimo", altText: "ff", definition: "to play loudly (louder than forte)"),
                Word(title:"fine, al fine", definition: "to repeat sections of a composition either from the beginning (D.C), or the dal segno sign, until the \"Fine\" symbol"),
                Word(title:"legato", definition: "a smooth, graceful style"),
                Word(title:"mezzo forte", altText: "mf", definition: "softer than forte"),
                Word(title:"moderato", definition: "in a moderate tempo"),
                Word(title:"mezzo piano", altText: "mf", definition: "slightly softer than mezzo forte"),
                Word(title:"piano", altText: "p", definition: "quietly /   softly"),
                Word(title:"pianissimo", altText: "pp", definition: "very softly, even more softly than piano"),
                Word(title:"rallentando", altText: "rall.", definition: "a gradual slowing of the tempo"),
                Word(title:"ritardando", altText: "ritard. / rit.", definition: "a gradual slowing of the tempo, or a delay"),
                Word(title:"staccato", altText: "stacc.", definition: "to play in a detached, seperate manner ")]
    } else if grade == 2 {
        words = [Word(title: "alla marcia", definition: "like a march"),
                Word(title: "allargando", definition: "in a slower and broader manner"),
                Word(title: "con moto", definition: "with movement, in a spirited manner"),
                Word(title: "con, col", definition: "\"with\""),
                Word(title: "dal segno", altText: "D.S", definition: "to repeat the phrase marked by the D.S sign (segno)"),
                Word(title: "e, ed", definition: "\"and\""),
                Word(title: "espressivo", altText: "espress.", definition: "with expression, expressive"),
                Word(title: "fortepiano", altText: "fp", definition: "to play loudly, then immediately soft"),
                Word(title: "grave", definition: "with a solemn, grave expression; the slowest tempo"),
                Word(title: "grazioso", definition: "gracefully; with grace"),
                Word(title: "largo", definition: "broadly; slowly; slower than lento"),
                Word(title: "lento", definition: "slowly; slower than adagio"),
                Word(title: "ma", definition: "\"but\""),
                Word(title: "meno", definition: "less motion; slower tempo"),
                Word(title: "meno mosso", definition: "less rapid"),
                Word(title: "molto", definition: "\"much\"; \"very\""),
                Word(title: "non troppo", definition: "not too much; without excess"),
                Word(title: "piú", definition: "\"more\""),
                Word(title: "piú mosso", definition: "more quickly"),
                Word(title: "poco, poco a poco", definition: "little, little by little"),
                Word(title: "presto", definition: "to play quickly, faster than allegro"),
                Word(title: "ritenuto", altText: "rit. / riten.", definition: "held back in tempo"),
                Word(title: "senza", definition: "\"without\""),
                Word(title: "vivace, vivo", definition: "to play quickly, lively")]
    } else if grade == 3 {
        words = [Word(title: "agitato", definition: "in a restless and agitated manner"),
                Word(title: "andantino", definition: "slightly fater than andante"),
                Word(title: "animato", definition: "with animation"),
                Word(title: "ben", definition: "well; good"),
                Word(title: "con forza", definition: "with force"),
                Word(title: "energico", definition: "with energy; energetically"),
                Word(title: "giocoso", definition: "graceful; smooth or elegant"),
                Word(title: "leggiero", definition: "lightfully; gracefully"),
                Word(title: "maestoso", definition: "performed in a majestic manner"),
                Word(title: "marcato", altText: "marc.", definition: "to play in a majestic an steadily manner"),
                Word(title: "pesante", definition: "to play in a heavy, ponderous fashion"),
                Word(title: "prestissimo", definition: "faster than presto"),
                Word(title: "primo, prima", definition: "\"first\""),
                Word(title: "risoluto", definition: "resolutely and with a marked accent"),
                Word(title: "scherzando", definition: "in a sportful manner; playfully"),
                Word(title: "semplice", definition: "in a simple style"),
                Word(title: "sempre", definition: "\"always\""),
                Word(title: "sforzando, sforzado", altText: "sfz. / sf.", definition: "to play with stress or with an accent"),
                Word(title: "simile", altText: "sim.", definition: "in a similar way"),
                Word(title: "sostenuto", altText: "sost", definition: "to play in a smooth, sustained manner; to sustain to or beyong the note's full value"),
                Word(title: "subito", altText: "sub.", definition: "immediately; suddenly"),
                Word(title: "tranquillo", definition: "tranquil; to play in a calm and quite manner"),
                Word(title: "triste, tristamente", definition: "sad, mournful")
               ]
    } else if grade == 4 {
        words = [Word(title: "affetuoso", definition: "tenderly"),
        Word(title: "alla breve", definition: "cut time; common time (2/2)"),
        Word(title: "amabile", definition: "tender; gentle"),
        Word(title: "appassionato", definition: "deeply emotional, impassioned"),
        Word(title: "assai", definition: "\"very\""),
        Word(title: "come prima", definition: "in the same manner as the first time"),
        Word(title: "comodo, tempo comodo", definition: "in a comfortable tempo"),
        Word(title: "con brio", definition: "in a vigourous or brisk manner"),
        Word(title: "deciso", definition: "decisively"),
        Word(title: "larghetto", definition: "slower than adagio, but not as slow as largo"),
        Word(title: "mesto", definition: "sad and pensive"),
        Word(title: "misterioso", definition: "in a mysterious manner"),
        Word(title: "ritmico", definition: "rhythmic"),
        Word(title: "rubato, tempo rubato", definition: "the flexibility/ freedom in the performance of a rhythm; not strict in the tempo"),
        Word(title: "stringendo", definition: "with quickening of the tempo (usually until the climax)"),
        Word(title: "animé", definition: "to perform in a lively and animated manner"),
        Word(title: "douce", definition: "sweetly; to reduce the speed"),
        Word(title: "lent", definition: "to perform the passage at a slower tempo"),
        Word(title: "modéré", definition: "to play at a reasonable tempo (usually moderato)"),
        Word(title: "retenu", definition: "held back; to gently decrease the tempo"),
        Word(title: "vite", definition: "lively")]
    } else if grade == 5 {
        words = [
            Word(title: "a niente", definition: "to fade the music down to a little more than a bare whisper"),
            Word(title: "ad libitum", altText: "ad lib.", definition: "to play in free time;\n to improvise a melodic line;\n to repeat the passage an arbitrary number of times"),
            Word(title: "attacca", definition: "attack at once, to beign the next movement without a pause"),
            Word(title: "cantando", definition: "to play in a singable, songlike manner"),
            Word(title: "con dolore", definition: "in a sad manner"),
            Word(title: "con spirito", definition: "with spirit or animation"),
            Word(title: "doloroso", definition: "sorrowful"),
            Word(title: "largamente", definition: "with slowness and breadth"),
            Word(title: "morendo", definition: "dying away"),
            Word(title: "perdendosi", definition: "dying away"),
            Word(title: "quasi", definition: "in the style of; in the manner of"),
            Word(title: "rinforzando", altText: "rf / rfz/ rinf", definition: "played with a sudden increase of force"),
            Word(title: "smorzando", altText: "smorz.", definition: "growing slower and softer; dying away"),
            Word(title: "sonoro", definition: "melodious; giving out a deep, resonant sound"),
            Word(title: "sotto voce", definition: "a dramatic lowering of the vocal. instrument sound"),
            Word(title: "langsam", definition: "slow, slowly"),
            Word(title: "lebhaft", definition: "lively, similar to vivace"),
            Word(title: "mässig", definition: "in an animated manner, with motion"),
            Word(title: "ruhig", definition: "to play in a calm and peaceful manner"),
            Word(title: "schnell", definition: "in a rapid manner; quickly"),
            Word(title: "traurig", definition: "mournful, sad")
        ]
    }
    return words
}

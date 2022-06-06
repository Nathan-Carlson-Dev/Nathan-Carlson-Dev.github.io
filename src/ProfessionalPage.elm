module ProfessionalPage exposing (..)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Events exposing (..)
import Styling exposing (listify, subtitlize, theme)


professionalContent : Html msg
professionalContent =
    div [] [ interestsParagraph, careerGoalsParagraph, approachParagraph, methodologyParagraph, otherInfo ]


interestsParagraph : Html msg
interestsParagraph =
    div [ id "interests", class "info" ]
        [ subtitlize "Interests:"
        , p [] [ text "Logic is a topic I am very fond of, especially its different representations and applications. I quite enjoy lambda calculus and combinatorial logic because when I was first learning it I left it as an exercise for myself to emulate propositional calculus. Other systems of logic I have had fun with include set theory, category theory, boolean algebra. And some more technical systems of logic include turing machines, non/deterministic finite automata, cellular automata, context free grammar/unrestricted grammar." ]
        , p [] [ text "Some more topics that I enjoy and am very invested in are listed down below:" ]
        , div [ id "interestLists" ]
            [ div []
                [ p [] [ Html.Styled.em [] [ text "Mathematics" ] ]
                , listify (ul []) [ "Calculus", "Higher Order Logic", "Number Theory", "Abstract Algebra", "Incompleteness", "Topology", "Symbolic Mathematics" ]
                ]
            , div []
                [ p [] [ Html.Styled.em [] [ text "Computer Science" ] ]
                , listify (ul []) [ "Programming Language Design", "Models of Computation", "Automated Theorem Proving", "Computer Architecture", "Machine Learning", "Data Compression", "Formal Languages" ]
                ]
            ]
        ]


careerGoalsParagraph : Html msg
careerGoalsParagraph =
    div [ id "careerGoals", class "info" ]
        [ subtitlize "Career Goals:"
        , p [] [ text "As I am currently pursuing my bachelors, my short term goals are to gain industry experience through an internship, and also exposing myself to amazing research that professors are studying and working on. Ultimately, I want to enter the workforce as a researcher, so that I can develop new and better ways to solve problems. I think a change needs to be made to the technology industry, one that requires more manageable systems and code (whether that be on the part of the programmer or on the part of a tool itself), in a way that is more predictable and reliable, and researching this is on the forefront of my mind." ]
        ]


approachParagraph : Html msg
approachParagraph =
    div [ id "approach", class "info" ]
        [ subtitlize "Approach to Problem Solving:"
        , p [] [ text "I think it is important to understand how someone solves a problem, not only to help that person when they are having trouble, but also to build a cohesive team. As such, I would like to present my learning style and problem solving techniques. I champion a growth mindset, where I start with a nugget of information, and even if I don’t understand it fully, I find something to take away from it that I can continue on with. This can be slow at first, but in the end I find learning enjoyable and I obtain a vast web of connecting concepts that I can use to apply in my own way." ]
        , p [] [ text "I approach problem solving as though I was writing a proof to a proposition. This idea extends way beyond mathematics or programming. Every problem has a statement and a system with boundaries. If I understand the system and its boundaries then I can understand the problem statement and how to solve it. And every system has its own set of axioms, definitions, and theorems that I can work with to solve the problem. Whether it is customer service, where axioms and definitions provide the boundaries of customer interaction and the theorems are good practice, or I am working on a JPEG equivalent compression format, where the axioms and definitions describe the data to compress, and theorems are the techniques I can use to reach an optimal compression ratio, breaking down a system to its smallest atoms and understanding their core interactions, allow me to build up to the problem and solve it." ]
        ]


methodologyParagraph : Html msg
methodologyParagraph =
    div [ id "methodology", class "info" ]
        [ subtitlize "Methodology Of Programming:"
        , p [] [ text "Naturally, as I have stated in my Approach to Problem Solving segment, I prefer a functional paradigm to programming. I believe that reducing the amount of states that I have to keep track of while coding gives me the safest and most efficient code. It is also intuitive to me since it makes all of the axioms and core definitions more apparent, whereas an object oriented approach requires me to interpret and build on composite definitions (for example, an encapsulating class in java). With that said, a functional approach isn’t the only and end all approach to me. I find myself using procedural programming when I want to work closer with the hardware or want to decrease the amount of memory I use or the processing time it takes to complete a task. Furthermore, I have traditionally used object oriented programming for a lot of my past projects." ]
        ]


otherInfo : Html msg
otherInfo =
    div [ id "other", class "info" ]
        [ div [ class "flexIt" ]
            [ div [] [ subtitlize "Technical Coursework:", listify (ul []) [ "Data Structures", "Calculus II", "Foundations Of Computer Science", "Introduction To Linear Algebra", "Applied Calculus III", "Logic, Language And Proof", "Programming Abstractions", "Introduction To Theory Of Computations", "Survey Of Probability & Statistics", "Finite Mathematical Structures", "System Fundamentals I", "Fundamentals Of Software Development", "Analysis Of Algorithms" ] ]
            , div [] [ subtitlize "Professional Skills:", listify (ul []) [ "Time Managment", "Organization", "Group Communication", "Problem Solving", "Adaptability", "Self Motivation" ] ]
            , div [] [ subtitlize "Programming Languages & Frameworks:", listify (ul []) [ "Python", "Javascript", "Java", "C#", "OCaml", "Elm", "MIPS Assembly", "React.js", "Express.js", "Node.js", ".NET Framework" ] ]
            ]
        , div [ class "flexIt" ] [ div [] [ subtitlize "Mathematical Concepts & Theories", listify (ul []) [ "Discrete Mathematics", "Differential Calculus", "Integral Calculus", "Multivariable Calculus", "Untyped Lambda Calculus", "Linear Algebra", "Graph Theory", "Combinatorics", "Discrete Transforms", "Propositional/Predicate Logic", "Proof Techniques", "Boolean Algebra", "Statistical Hypothesis Testing", "Probability Distributions", "Category Theory" ] ], div [] [ subtitlize "Programming Paradigms & Concepts:", listify (ul []) [ "Object-Oriented Programming", "Functional Programming", "Data Structures", "Computational Complexity", "Non/Deterministic Automata", "Context-Free Grammar", "Unrestricted Grammar", "Greedy Algorithms", "Divide & Conquer Algorithms", "Dynamic Programming" ] ] ]
        ]

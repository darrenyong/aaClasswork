# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ApplicationRecord.transaction do
    User.destroy_all
    Poll.destroy_all
    Question.destroy_all
    AnswerChoice.destroy_all
    Response.destroy_all

    u1 = User.create!(username: 'abhi')
    u2 = User.create!(username: 'darrenyong')
    u3 = User.create!(username: 'rome')

    # Poll 1
    p1 = Poll.create!(author_id: u3.id, title: 'App Academy Survey')

    # Poll 1 Questions
    p1_q1 = Question.create!(question: "Rate App Academy", poll_id: p1.id)
    p1_q2 = Question.create!(question: "How likely are you to recommend a/A to a friend", poll_id: p1.id)

    # Poll 1 Questions 1 Answers
    p1_q1_a1 = AnswerChoice.create!(answer: "1", question_id: p1_q1.id)
    p1_q1_a2 = AnswerChoice.create!(answer: "2", question_id: p1_q1.id)
    p1_q1_a3 = AnswerChoice.create!(answer: "3", question_id: p1_q1.id)
    
    # Poll 1 Questions 2 Answers
    p1_q2_a1 = AnswerChoice.create!(answer: "Not likely", question_id: p1_q2.id)
    p1_q2_a2 = AnswerChoice.create!(answer: "Somewhat likely", question_id: p1_q2.id)
    p1_q2_a3 = AnswerChoice.create!(answer: "Very likely", question_id: p1_q2.id)

    # Poll 1 Responses
    p1_r1 = Response.create!(answer_id: p1_q1_a3.id, question_id: p1_q1.id, user_id: u3.id)
    p1_r2 = Response.create!(answer_id: p1_q2_a3.id, question_id: p1_q2.id, user_id: u3.id)

    p1_r3 = Response.create!(answer_id: p1_q1_a2.id, question_id: p1_q1.id, user_id: u2.id)
    p1_r4 = Response.create!(answer_id: p1_q2_a2.id, question_id: p1_q2.id, user_id: u2.id)

    p1_r5 = Response.create!(answer_id: p1_q1_a3.id, question_id: p1_q1.id, user_id: u3.id)
    p1_r6 = Response.create!(answer_id: p1_q2_a3.id, question_id: p1_q2.id, user_id: u3.id)
    

      

    # Poll 2
    # p2 = Poll.create!(author_id: u2.id, title: 'Avengers: Infinity War Survey')

    # p2_q1 = Question.create!(question: "Rate Avengers: Infinity War", poll_id: p2.id)
    # p2_q2 = Question.create!(question: "Who is your favorite Avenger?", poll_id: p2.id)
    # p2_q3 = Question.create!(question: "How many Marvel movies have you watched?", poll_id: p2.id)


end
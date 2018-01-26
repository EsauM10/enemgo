user = User.create(
  kind: :admin,
  username: 'testador',
  email: 'admin@teste.com',
  password: '123456',
  password_confirmation: '123456'
)

student = User.create(
  kind: :student,
  username: 'student1',
  email: 'test@test.com',
  password: '123456',
  password_confirmation: '123456'
)

User.create!(
  kind: :evaluator,
  username: 'evaluator',
  email: 'evaluator@test.com',
  password: '123456',
  password_confirmation: '123456'
)

student.build_profile(
  first_name: FFaker::Name.first_name,
  last_name: FFaker::Name.last_name,
  birthday: Time.at(Time.now - 15.years)
)

student.save

exam = user.exams.build(
  kind: :enem,
  year: Time.now.year,
  title: 'Enem 2018'
)

exam.save

30.times do |t|
  question = Question.new(
    statement: FFaker::Lorem.paragraphs,
    status: :approved,
    area: rand(0..3),
    source: FFaker::Internet.http_url,
    official: [false, true].sample,
    user: user
  )

  5.times do |t|
    question.alternatives.build(
      statement: FFaker::Lorem.paragraph,
      veracity: false
    )
  end

  question.alternatives.sample.update_attributes(veracity: true)
  question.build_solution(statement: FFaker::Lorem.words)
  question.save!

  exam.exam_questions.build(
    question: question
  )

  exam.save!
end

plan = Stripe::Plan.create(
  amount: 2900,
  name: 'Premium',
  interval: 'month',
  currency: 'brl',
  id: 1
)

Plan.create!(
  price: (plan.amount / 100).to_f,
  name: plan.name,
  stripe_id: plan.id
)


user = User.create!(
  kind: :admin,
  email: 'admin@teste.com',
  password: '123456',
  password_confirmation: '123456',
)

user.build_profile(
  first_name: FFaker::Name.first_name,
  last_name: FFaker::Name.last_name,
  birthday: Time.at(Time.now - 15.years),
  sex: 'M'
)

user.save

student = User.create(
  kind: :student,
  email: 'test@test.com',
  password: '123456',
  password_confirmation: '123456'
)

User.create!(
  kind: :evaluator,
  email: 'evaluator@test.com',
  password: '123456',
  password_confirmation: '123456'
)

student.build_profile(
  first_name: FFaker::Name.first_name,
  last_name: FFaker::Name.last_name,
  birthday: Time.at(Time.now - 15.years),
  sex: 'M'
)

student.save(validate: false)

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

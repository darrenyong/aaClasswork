require 'sqlite3'
require 'singleton'

class QuestionsDB < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Questions
    attr_reader :id
    attr_accessor :title, :body, :author_id
    
    def self.find_by_id(id)
        question = QuestionsDB.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          questions
        WHERE
          id = ?
      SQL
      return nil unless question.length > 0
  
      Questions.new(question.first)          
    end

    def self.find_by_author_id(author_id)
        author = QuestionsDB.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?
        SQL
        return nil unless author.length > 0
    
        if author.length == 1
            Questions.new(author.first)
        else
            author.map do |question|
                Questions.new(question)
            end
        end 
    
    end

    def self.most_followed(n)
        QuestionFollows.most_followed_questions(n)
    end

    def self.most_liked(n)
        QuestionLikes.most_liked_questions(n)
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def author
        Users.find_by_id(self.author_id)
    end

    def replies
        Replies.find_by_question_id(self.id)
    end

    def followers
        QuestionFollows.followers_for_question_id(self.id)
    end

    def likers
        QuestionLikes.likers_for_question_id(self.id)
    end

    def num_likes
        QuestionLikes.num_likes_for_question_id(self.id)
    end
end

class Users
    attr_reader :id
    attr_accessor :fname, :lname
    
    def self.find_by_id(id)
        user = QuestionsDB.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          users
        WHERE
          id = ?
      SQL
      return nil unless user.length > 0
  
      Users.new(user.first)          
    end

    def self.find_by_name(fname, lname)
        full_name = QuestionsDB.instance.execute(<<-SQL, fname, lname)
        SELECT
          *
        FROM
          users
        WHERE
          fname = ? AND lname = ?
      SQL
      return nil unless full_name.length > 0
  
      Users.new(full_name.first)          
    end

    def initialize(options)
        @fname = options['fname']
        @lname = options['lname']
        @id = options['id']
    end

    def authored_questions
        Questions.find_by_author_id(self.id)
    end

    def authored_replies
        Replies.find_by_user_id(self.id)
    end

    def followed_questions
        QuestionFollows.followed_questions_for_user_id(self.id)
    end

    def liked_questions
        QuestionLikes.liked_questions_for_user_id(self.id)
    end

    def average_karma
        
    end
end

class QuestionFollows
    attr_accessor :question_id, :user_id
    
    def self.find_by_question_id(id)
        question_follows = QuestionsDB.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          question_follows
        WHERE
          question_id = ?
      SQL
      return nil unless question_follows.length > 0
  
      QuestionsFollows.new(question_follows.first)          
    end

    def self.find_by_user_id(id)
        user = QuestionsDB.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          question_follows
        WHERE
          user_id = ?
      SQL
      return nil unless user.length > 0
  
        if user.length == 1
            Replies.new(user.first)
        else
            user.map do |us|
                Replies.new(us)
            end
        end            
    end

    def self.followers_for_question_id(question_id)
        user = QuestionsDB.instance.execute(<<-SQL, question_id)
        SELECT *
        FROM users
        WHERE id IN
        (SELECT
          user_id
        FROM
          question_follows
        WHERE
          question_id = ?)
      SQL
      return nil unless user.length > 0
        if user.length == 1
            Users.new(user.first)
        else
            user.map do |us|
                Users.new(us)
            end
        end   
    end
    
    def self.most_followed_questions(n)
        most_followed_question = QuestionsDB.instance.execute(<<-SQL, n)
        SELECT *
        FROM questions
        WHERE id IN
        (SELECT
          question_id
        FROM
          question_follows
        GROUP BY
          question_id
        ORDER BY COUNT(user_id) DESC LIMIT ? 
          )
      SQL
      return nil unless most_followed_question.length > 0
        if most_followed_question.length == 1
            Questions.new(most_followed_question.first)
        else
            most_followed_question.map do |us|
                Questions.new(us)
            end
        end   
    end

    def self.followed_questions_for_user_id(user_id)
        question = QuestionsDB.instance.execute(<<-SQL, user_id)
        SELECT *
        FROM questions
        WHERE id IN
        (SELECT
          question_id
        FROM
          question_follows
        WHERE
          user_id = ?)
      SQL
      return nil unless question.length > 0
        if question.length == 1
            Questions.new(question.first)
        else
            question.map do |us|
                Questions.new(us)
            end
        end  
    end

    def initialize(options)
        @question_id = options['question_id']
        @user_id = options['user_id']
    end
end

class Replies
    attr_reader :id
    attr_accessor :question_id, :user_id, :parent_reply_id, :body
    
    def self.find_by_id(id)
        reply = QuestionsDB.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          replies
        WHERE
          id = ?
      SQL
      return nil unless reply.length > 0
  
      Replies.new(reply.first)          
    end

    def self.find_by_user_id(user_id)
        reply = QuestionsDB.instance.execute(<<-SQL, user_id)
        SELECT
          *
        FROM
          replies
        WHERE
          user_id = ?
      SQL
      return nil unless reply.length > 0
  
        if reply.length == 1
            Replies.new(reply.first)
        else
            reply.map do |reply|
                Replies.new(reply)
            end
        end          
    end

    def self.find_by_question_id(question_id)
        question = QuestionsDB.instance.execute(<<-SQL, question_id)
        SELECT
          *
        FROM
          replies
        WHERE
          question_id = ?
        SQL
        return nil unless question.length > 0
  
        if question.length == 1
            Replies.new(question.first)
        else
            question.map do |reply|
                Replies.new(reply)
            end
        end
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @user_id = options['user_id']
        @parent_reply_id = options['parent_reply_id']
        @body = options['body']
    end

    def author
        Users.find_by_id(self.user_id)
    end

    def question
        Questions.find_by_id(self.question_id)
    end

    def parent_reply
        Replies.find_by_id(self.parent_reply_id)
    end

    def child_replies
        reply = QuestionsDB.instance.execute(<<-SQL, parent_id: self.id)
        SELECT
          *
        FROM
          replies
        WHERE
          parent_reply_id = :parent_id
        SQL
        return nil unless reply.length > 0
  
        Replies.new(reply.first)
    end
end

class QuestionLikes
    attr_accessor :question_id, :user_id
    
    def self.find_by_question_id(id)
        question_likes = QuestionsDB.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          question_likes
        WHERE
          question_id = ?
      SQL
      return nil unless question_likes.length > 0
  
      QuestionLikes.new(question_likes.first)          
    end

    def self.find_by_user_id(id)
        question_likes = QuestionsDB.instance.execute(<<-SQL, id)
        SELECT
          *
        FROM
          question_likes
        WHERE
          user_id = ?
      SQL
      return nil unless question_likes.length > 0
  
      QuestionLikes.new(question_likes.first)          
    end

    def self.likers_for_question_id(question_id)
        user = QuestionsDB.instance.execute(<<-SQL, question_id)
        SELECT *
        FROM users
        WHERE id IN
        (SELECT
          user_id
        FROM
          question_likes
        WHERE
          question_id = ?)
      SQL
      return nil unless user.length > 0
        if user.length == 1
            Users.new(user.first)
        else
            user.map do |us|
                Users.new(us)
            end
        end    
    end

    def self.num_likes_for_question_id(question_id)
        user = QuestionsDB.instance.execute(<<-SQL, question_id)
        SELECT
          COUNT(*)
        FROM
          question_likes
        WHERE
          question_id = ?
      SQL
      return nil unless user.length > 0
       user.first   
    end

    def self.liked_questions_for_user_id(user_id)
        question = QuestionsDB.instance.execute(<<-SQL, user_id)
        SELECT *
        FROM questions
        WHERE id IN
        (SELECT
          question_id
        FROM
          question_likes
        WHERE
          user_id = ?)
      SQL
      return nil unless question.length > 0
        if question.length == 1
            Questions.new(question.first)
        else
            question.map do |us|
                Questions.new(us)
            end
        end
    end
     
    def self.most_liked_questions(n)
        most_liked_question = QuestionsDB.instance.execute(<<-SQL, n)
        SELECT *
        FROM questions
        WHERE id IN
        (SELECT
          question_id
        FROM
          question_likes
        GROUP BY
          question_id
        ORDER BY COUNT(user_id) DESC LIMIT ? 
          )
      SQL
      return nil unless most_liked_question.length > 0
        if most_liked_question.length == 1
            Questions.new(most_liked_question.first)
        else
            most_liked_question.map do |us|
                Questions.new(us)
            end
        end   
    end

    def initialize(options)
        @question_id = options['question_id']
        @user_id = options['user_id']
    end
end
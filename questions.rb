require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database 
    include Singleton

    def initialize()
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users
    def initialize(hash)
        @fname = hash['fname']
        @lname = hash['lname']
    end

    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
            fname, lname
        FROM
            users
        WHERE
            id = ? 
        SQL
        Users.new(user.first)
    end

    def self.find_by_name(fname = nil,lname = nil)
        name = QuestionsDatabase.instance.execute(<<-SQL,fname,lname) 
        SELECT
            fname, lname
        FROM
            users
        WHERE  
            fname = ? OR lname = ? 
        SQL
        Users.new(name.first)
    end
end

class Questions

    def initialize(hash)
        @author_id = hash['author_id']
        @title = hash['title']
        @body = hash['body']
    end
    
    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT
            author_id, title, body
        FROM
            questions
        WHERE
            id = ? 
        SQL
        Questions.new(question.first)
    end
end

class QuestionFollows
end

class Replies
end

class QuestionLike
end
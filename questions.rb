require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database 
    include Singleton

    def initialize()
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end

    def self.instance
        self.instance
    end
end

class Users
    def initialize(hash)
        @fname = hash['fname']
        @lname = hash['lname']
    end

    def self.find_by_id(id)
        user = QuestionsDatabase.instance.execute(<< SQL, id)
        SELECT
            fname, lname
        FROM
            users
        WHERE
            id = id 
        SQL
        Users.new
    end

    def self.find_by_name

    end

end

class Questions
end

class QuestionFollows
end

class Replies
end

class QuestionLike
end
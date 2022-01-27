require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
    attr_accessor :id, :f_name, :l_name

    def self.all
        data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
        data.map { |datum| User.new(datum) }
    end

    def self.find_by_name(f_name, l_name)
        user = QuestionsDBConnection.instance.execute(<<-SQL, f_name, l_name)
            SELECT
                *
            FROM
                users
            WHERE
                f_name = ? AND l_name = ?
        SQL
        return nil unless user.length > 0

        User.new(user.first)
    end

    def self.find_by_id(id)
        user = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless user.length > 0

        User.new(user.first)
    end

    def initialize(options)
        @id = options['id']
        @f_name = options['f_name']
        @l_name = options['l_name']
    end

    def create
        raise "#{self} already in database" if self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.f_name, self.l_name)
            INSERT INTO
                users (f_name, l_name)
            VALUES
                (?, ?)
        SQL
        self.id = QuestionsDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.f_name, self.l_name, self.id)
        UPDATE
            users
        SET
            f_name = ?, l_name = ?
        WHERE
            id = ?
        SQL
    end

    def authored_questions
        Question.find_by_author_id(id)
    end

    def authored_replies
        Reply.find_by_user_id(id)
    end
end

class Question 

    attr_accessor :id, :title, :body, :author_id

    def self.all
        data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
        data.map { |datum| Question.new(datum) }
    end

    def self.find_by_author_id(author_id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?
        SQL
        return nil unless question.length > 0

        question.map { |datum| Question.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def create
        raise "#{self} already in database" if self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.title, self.body, self.author_id)
            INSERT INTO
                questions (title, body, author_id)
            VALUES
                (?, ?, ?)
        SQL
        self.id = QuestionsDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.title, self.body, self.author_id, self.id)
        UPDATE
            questions
        SET
            title = ?, body = ?, author_id = ?
        WHERE
            id = ?
        SQL
    end

    def author
        User.find_by_id(author_id)
    end

    def replies
        Reply.find_by_question_id(id)
    end    

    def self.find_by_id(id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless question.length > 0

        Question.new(question.first)
    end
end

class QuestionFollow

    attr_accessor :id, :user_id, :question_id

    def self.all
        data = QuestionsDBConnection.instance.execute("SELECT * FROM question_follows")
        data.map { |datum| QuestionFollow.new(datum) }
    end

    def self.followers_for_question_id(question_id)
        question_follow = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                question_follows
            JOIN
                questions ON questions.id = ?
            JOIN
                users on questions.id = users.id
                
        SQL
        return nil unless question.length > 0

        question_follow.map { |datum| User.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def create
        raise "#{self} already in database" if self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.user_id, self.question_id)
            INSERT INTO
                question_follows (user_id, question_id)
            VALUES
                (?, ?)
        SQL
        self.id = QuestionsDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.user_id, self.question_id, self.id)
        UPDATE
            question_follows
        SET
            user_id = ?, question_id = ?
        WHERE
            id = ?
        SQL
    end

end

class Reply
    attr_accessor :id, :user_id, :question_id, :parent_id, :body

    def self.all
        data = QuestionsDBConnection.instance.execute("SELECT * FROM replies")
        data.map { |datum| Reply.new(datum) }
    end

    def self.find_by_user_id(user_id)
        reply = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL
        return nil unless reply.length > 0

        reply.map { |datum| Reply.new(datum) }
    end

    def self.find_by_question_id(question_id)
        reply = QuestionsDBConnection.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL
        return nil unless reply.length > 0

        reply.map { |datum| Reply.new(datum) }
    end

    def author
        User.find_by_id(user_id)
    end

    def question
        Question.find_by_id(question_id)
    end

    def parent_reply
            reply = QuestionsDBConnection.instance.execute(<<-SQL, parent_id)
                SELECT
                    *
                FROM
                    replies
                WHERE
                    id = ?
            SQL
            return nil unless reply.length > 0
    
            Reply.new(reply.first)
    end

    def child_replies
        reply = QuestionsDBConnection.instance.execute(<<-SQL, id)
                SELECT
                    *
                FROM
                    replies
                WHERE
                    parent_id = ?
            SQL
            return nil unless reply.length > 0

            reply.map { |datum| Reply.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @body = options['body']
    end

    def create
        raise "#{self} already in database" if self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.user_id, self.question_id, self.parent_id, self.body)
            INSERT INTO
                replies (user_id, question_id, parent_id, body)
            VALUES
                (?, ?, ?, ?)
        SQL
        self.id = QuestionsDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.user_id, self.question_id, self.parent_id, self.body, self.id)
        UPDATE
            replies
        SET
            user_id = ?, question_id = ?, parent_id = ?, body = ?
        WHERE
            id = ?
        SQL
    end
end

class QuestionLike
    attr_accessor :id, :user_id, :question_id, :likes

    def self.all
        data = QuestionsDBConnection.instance.execute("SELECT * FROM question_likes")
        data.map { |datum| QuestionLike.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @likes = options['likes']
    end

    def create
        raise "#{self} already in database" if self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.user_id, self.question_id, self.likes)
            INSERT INTO
                question_likes (user_id, question_id, likes)
            VALUES
                (?, ?, ?)
        SQL
        self.id = QuestionsDBConnection.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDBConnection.instance.execute(<<-SQL, self.user_id, self.question_id, self.likes, self.id)
        UPDATE
            question_likes
        SET
            user_id = ?, question_id = ?, likes = ?
        WHERE
            id = ?
        SQL
    end
end
